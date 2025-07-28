import Foundation
import Combine

class UserListViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private let useCase: GetUsersUseCase
    
    init(useCase: GetUsersUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    func loadUsersList() async {
        guard NetworkMonitor.shared.isConnected else {
            errorMessage = NetworkError.noInternet.errorDescription
            return
        }
        isLoading = true
        do {
            users = try await useCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
