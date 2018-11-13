import UIKit

var str = "Hello, playground"

protocol RepositoryType {}

struct Repository: RepositoryType {
    let id: Int
    let name: String
    let isFork: Bool
    let forksCount: Int
    let stargazersCount: Int
    let owner: User
    let updateDate: Date
    let description: String?
    let language: String?
    let parent: RepositoryType?
    var readMe: String?
    var starred: Bool?
}

struct User {
    let login: String
    let id: Int
    let avatar: UIImage
    var repositories: [Repository]?
    var stars: [Repository]?
    var followers: [User]?
    var following: [User]?
    var followed: Bool?
}

extension User {
    struct Details {
        let publicRepositoriesCount: Int
        let followersCount: Int
        let followingCount: Int
        let name: String?
        let company: String?
        let blog: URL?
        let location: String?
        let email: String?
        let bio: String?
    }
}
