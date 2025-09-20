import Foundation
@MainActor
class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private var currentPage = 1
    private var isFetching = false
    
    //service protocol
    private let userService: UserServiceProtocol
    
    //init function
    init(service: UserServiceProtocol) {
        self.userService = service
    }
    
    //load users
    func loadUsers(reset: Bool = false) async {
        if isFetching { return } 
        isFetching = true
        
        if reset {
            currentPage = 1
            users.removeAll()
        }
        
        isLoading = true
        do {
            let newUsers = try await userService.fetchUsers(page: currentPage)
            users.append(contentsOf: newUsers)
            currentPage += 1
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
        isFetching = false
    }
}

