
import Foundation

import Foundation

struct SchemaPokemonSpecie: Codable {
    var color: SchemaPokemonColor
}

// MARK: - SchemaPokemon
struct SchemaPokemon: Codable {
    let id: Int?
    let name: String?
    let baseExperience: Int?
    let height: Int?
    let isDefault: Bool?
    let order: Int?
    let weight: Int?
    let abilities: [SchemaAbility]?
    let forms: [SchemaSpecies]?
    let gameIndices: [SchemaGameIndex]?
    let heldItems: [SchemaHeldItem]?
    let locationAreaEncounters: String?
    let moves: [SchemaMove]?
    let species: SchemaSpecies?
    let sprites: SchemaSprites?
    let stats: [SchemaStat]?
    let types: [SchemaType]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case baseExperience = "base_experience"
        case height = "height"
        case isDefault = "is_default"
        case order = "order"
        case weight = "weight"
        case abilities = "abilities"
        case forms = "forms"
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case moves = "moves"
        case species = "species"
        case sprites = "sprites"
        case stats = "stats"
        case types = "types"
    }
}

struct SchemaPokemonColor: Codable {
    let name: String?
    let url: String?
}

// MARK: - SchemaAbility
struct SchemaAbility: Codable {
    let isHidden: Bool?
    let slot: Int?
    let ability: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot = "slot"
        case ability = "ability"
    }
}

// MARK: - SchemaSpecies
struct SchemaSpecies: Codable {
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - SchemaGameIndex
struct SchemaGameIndex: Codable {
    let gameIndex: Int?
    let version: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version = "version"
    }
}

// MARK: - SchemaHeldItem
struct SchemaHeldItem: Codable {
    let item: SchemaSpecies?
    let versionDetails: [SchemaVersionDetail]?

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case versionDetails = "version_details"
    }
}

// MARK: - SchemaVersionDetail
struct SchemaVersionDetail: Codable {
    let rarity: Int?
    let version: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case rarity = "rarity"
        case version = "version"
    }
}

// MARK: - SchemaMove
struct SchemaMove: Codable {
    let move: SchemaSpecies?
    let versionGroupDetails: [SchemaVersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move = "move"
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - SchemaVersionGroupDetail
struct SchemaVersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let versionGroup: SchemaSpecies?
    let moveLearnMethod: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup = "version_group"
        case moveLearnMethod = "move_learn_method"
    }
}

// MARK: - SchemaSprites
struct SchemaSprites: Codable {
    let backFemale: String?
    let backShinyFemale: String?
    let backDefault: String?
    let frontFemale: String?
    let frontShinyFemale: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let other: SchemaOther?
    let versions: SchemaVersions?

    enum CodingKeys: String, CodingKey {
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
        case backDefault = "back_default"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other = "other"
        case versions = "versions"
    }
}

// MARK: - SchemaOther
struct SchemaOther: Codable {
    let dreamWorld: SchemaDreamWorld?
    let officialArtwork: SchemaOfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - SchemaOfficialArtwork
struct SchemaOfficialArtwork: Codable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - SchemaDreamWorld
struct SchemaDreamWorld: Codable {
}

// MARK: - SchemaVersions
struct SchemaVersions: Codable {
    let generationI: SchemaGenerationI?
    let generationIi: SchemaGenerationIi?
    let generationIii: SchemaGenerationIii?
    let generationIv: SchemaGenerationIv?
    let generationV: SchemaGenerationV?
    let generationVi: [String: SchemaDreamWorld]?
    let generationVii: SchemaGenerationVii?
    let generationViii: SchemaGenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - SchemaGenerationI
struct SchemaGenerationI: Codable {
    let redBlue: SchemaDreamWorld?
    let yellow: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow = "yellow"
    }
}

// MARK: - SchemaGenerationIi
struct SchemaGenerationIi: Codable {
    let crystal: SchemaDreamWorld?
    let gold: SchemaDreamWorld?
    let silver: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case crystal = "crystal"
        case gold = "gold"
        case silver = "silver"
    }
}

// MARK: - SchemaGenerationIii
struct SchemaGenerationIii: Codable {
    let emerald: SchemaDreamWorld?
    let fireredLeafgreen: SchemaDreamWorld?
    let rubySapphire: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - SchemaGenerationIv
struct SchemaGenerationIv: Codable {
    let diamondPearl: SchemaDreamWorld?
    let heartgoldSoulsilver: SchemaDreamWorld?
    let platinum: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum = "platinum"
    }
}

// MARK: - SchemaGenerationV
struct SchemaGenerationV: Codable {
    let blackWhite: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - SchemaGenerationVii
struct SchemaGenerationVii: Codable {
    let icons: SchemaDreamWorld?
    let ultraSunUltraMoon: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - SchemaGenerationViii
struct SchemaGenerationViii: Codable {
    let icons: SchemaDreamWorld?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
    }
}

// MARK: - SchemaStat
struct SchemaStat: Codable {
    let baseStat: Int?
    let effort: Int?
    let stat: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

// MARK: - SchemaType
struct SchemaType: Codable {
    let slot: Int?
    let type: SchemaSpecies?

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

// MARK: - SchemaPokemonList
struct SchemaPokemonList: Codable {
    let count: Int?
    let next: String?
    let previous: JSONNull?
    let results: [SchemaResult]?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

// MARK: - SchemaResult
struct SchemaResult: Codable {
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
