import Foundation
protocol UserServiceProtocol {
    func fetchUsers(page: Int) async throws -> [UserModel]
}

class UserService: UserServiceProtocol {
    func fetchUsers(page: Int = 1) async throws -> [UserModel] {
        //url object
        guard let url = URL(string: "https://core-apis.a1apps.co/ios/interview-details?page=\(page)") else {
            throw URLError(.badURL)
        }
        //get back json
        let (data, response) = try await URLSession.shared.data(from: url)
        //check response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        //decode json
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let responseObject = try decoder.decode(UserResponse.self, from: data)
        return responseObject.data
    }
}



