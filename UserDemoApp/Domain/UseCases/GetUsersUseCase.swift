public protocol GetUsersUseCase {
  func execute() async throws -> [User]
}

public class GetUsersUseCaseImp: GetUsersUseCase {
  private let repo: UserRepository
  public init(repo: UserRepository) { self.repo = repo }
 
    public func execute() async throws -> [User] {
        do {
            return try await repo.fetchUsers()
        } catch {
            throw error
        }
        
        
       
  }
}
