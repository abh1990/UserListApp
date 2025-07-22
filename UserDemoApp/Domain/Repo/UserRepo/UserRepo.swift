import Foundation

public protocol UserRepository {
  func fetchUsers() async throws -> [User]
}

public class UseListRepository: UserRepository {
    private let client: NetworkClient
    public init(client: NetworkClient) {
        self.client = client
    }
    
    public func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://dummyjson.com/users")!
        do {
            let response: Users = try await client.get(url)
            return response.users
        } catch {
            throw error
        }
    }
}
