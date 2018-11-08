import UIKit
import Foundation

struct ID{
    let value:Int
}

extension ID: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(Int.self)
        self.init(value: value)
    }
}


enum RemoteValue<T> {
    case unfetched
    case fetched(value: T)
}

struct FetchableValue<T> {
    let url: URL
    var value: RemoteValue<T>
    
    indirect enum RemoteValue<T> {
        case unfetched
        case fetched(value: T)
    }
}

extension FetchableValue: Decodable {
    init(from decoder: Decoder) throws {
        let template = try decoder.singleValueContainer().decode(String.self)
        guard let url = URL(template: template) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: ""))
        }
        self.url = url
        value = .unfetched
    }
}



protocol RepositoryType{
    
}

extension User {
    struct Details: Decodable {
        let publicRepositoriesCount: Int
        let followersCount: Int
        let followingCount: Int
        let name: String?
        let company: String?
        let location: String?
        let email: String?
        let bio: String?
        let blog: URL?
    }
}

struct Repository: RepositoryType {
    let id: ID
    let name: String
    let isFork: Bool
    let forksCount: Int
    let stargazersCount: Int
    let owner: User
    let description: String?
    let language: String?
    let parent: RepositoryType?
    var readMe: FetchableValue<String>
    var isStarred: FetchableValue<Bool>
}


struct User {
    let login: String
    let id: ID
    var avatar: FetchableValue<UIImage>
    var repositories: FetchableValue<[Repository]>
    var stars: FetchableValue<[Repository]>
    var followers: FetchableValue<[User]>
    var following: FetchableValue<[User]>
    var isFollowed: FetchableValue<Bool>
    var details: FetchableValue<Details>
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case url
        case avatarUrl = "avatar_url"
        case repositoriesUrl = "repos_url"
        case starredUrl = "starred_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        id = try container.decode(ID.self, forKey: .id)
        avatar = try container.decode(FetchableValue.self, forKey: .avatarUrl)
        repositories = try container.decode(FetchableValue.self, forKey: .repositoriesUrl)
        stars = try container.decode(FetchableValue.self, forKey: .starredUrl)
        followers = try container.decode(FetchableValue.self, forKey: .followersUrl)
        following = try container.decode(FetchableValue.self, forKey: .followingUrl)
        
        func decodeDetails() throws -> FetchableValue<Details> {
            let detailsContainer = try decoder.container(keyedBy: Details.CodingKeys.self)
            guard detailsContainer.contains(.publicRepositoriesCount) else {
                return try container.decode(FetchableValue.self, forKey: .url)
            }
            let details = try Details(from: decoder)
            return FetchableValue(url: try container.value(forKey: .url), value: .fetched(value: details))
        }
        
        details = try decodeDetails()
    }
}


extension URL {
    init?(template: String) {
        let regex = "\\{.*\\}"
        let cleanedString = template.replacingOccurrences(of: regex, with: "", options: .regularExpression)
        self.init(string: cleanedString)
    }
}


extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case url
        case avatarUrl = "avatar_url"
        case repositoriesUrl = "repos_url"
        case starredUrl = "starred_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
    }
}
