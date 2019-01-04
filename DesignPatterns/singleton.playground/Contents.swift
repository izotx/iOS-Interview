import UIKit

final class LibraryAPI {
    // 1
    static let shared = LibraryAPI()
    // 2
    private init() {
        
    }
}

let api = LibraryAPI.shared

