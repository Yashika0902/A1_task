import Foundation
struct UserModel: Codable, Identifiable {
    let id = UUID()
    let image: String
    let email: String
    let name: String
    let age: Int
    let dob: String

    private enum CodingKeys: String, CodingKey {
        case image, email, name, age, dob
    }
}


struct UserResponse: Codable {
    let data: [UserModel]
}

