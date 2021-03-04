import Foundation

class API {
    static let shared = API(baseURL: "https://pokeapi.co/api/v2/")
    let decoder: JSONDecoder
    let baseURL: URL
    
    init(baseURL: String) {
        self.baseURL = URL(string: baseURL)!
        self.decoder = JSONDecoder()
    }
    
    private func fetchCache(request: URLRequest, completion: @escaping (Data?) -> ()) {
        let endpoint = request.url!.absoluteString
        let method = request.httpMethod!
        let data = UserDefaults.standard.data(forKey: "cache[\(method)]:\(endpoint)")
        completion(data)
    }
    
    private func setCache(request: URLRequest, data: Data) {
        let endpoint: String = request.url!.absoluteString
        let method: String = request.httpMethod!
        UserDefaults.standard.set(data, forKey: "cache[\(method)]:\(endpoint)")
    }
    
    func fetch(from endpoint: String, revalidate: Bool = false, completion: @escaping (Data) -> ()){
        var wasCached = false
        guard let url = URL(string: endpoint, relativeTo: self.baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        fetchCache(request: request) { (data) in
            if let data = data {
                completion(data)
                wasCached = true
            }
        }
        
        if !wasCached || revalidate {
            URLSession.shared.dataTask(with: request) { data, _, _  in
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                        self.setCache(request: request, data: data)
                    }
                }
            }
            .resume()
        }
    }
    
    func fetchAndDecode<T: Decodable>(from endpoint: String, revalidate: Bool = false, completion: @escaping (T) -> ()){
        self.fetch(from: endpoint, revalidate: revalidate) { (data) in
            do {
                let content = try self.decoder.decode(T.self, from: data)
                completion(content)
            } catch {
                debugPrint(error)
            }
        }
    }
}
