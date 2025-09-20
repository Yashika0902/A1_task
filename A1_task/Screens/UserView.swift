import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel(service: UserService())
    
    var body: some View {
        NavigationStack {
            
            if viewModel.isLoading {
                ProgressView("Loading users...")
                    .font(.headline)
            }
            
            else if let error = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                    Button("Retry") {
                        Task { await viewModel.loadUsers() }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            
            else if viewModel.users.isEmpty {
                Text("No users found")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            else {
                List(viewModel.users) { user in
                    HStack(spacing: 16) {
                        // Profile Image
                        AsyncImage(url: URL(string: user.image)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                            } else if phase.error != nil {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 60, height: 60)
                                    .overlay(Image(systemName: "person.fill").foregroundColor(.white))
                            } else {
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            }
                        }

                        // User Info
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Age: \(user.age)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                    .onAppear {
                        if user.id == viewModel.users.last?.id {
                            Task { await viewModel.loadUsers() }
                        }
                    }

                }
                .listStyle(.insetGrouped)
                .navigationTitle("Users")
            }

        }
        .onAppear {
            Task { await viewModel.loadUsers() }
        }
    }
}

#Preview {
    UserView()
}

