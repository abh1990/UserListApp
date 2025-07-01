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
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        do {
            return try await client.get(url)
        } catch {
            throw error
        }
    }
}
