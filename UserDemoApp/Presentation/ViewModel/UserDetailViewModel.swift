import Combine
 
class UserDetailViewModel {
    @Published var userDetails: UserDetails?
 
    init(userDetails: UserDetails?) {
        self.userDetails = userDetails
    }
}
