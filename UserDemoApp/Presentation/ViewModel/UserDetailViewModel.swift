/*
class UserDetailViewModel {
    
    let fullName: String
    let email: String
    let imageUrl: String
    
    init(user: User? = nil) {
        self.fullName = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
        self.email = user?.email ?? ""
        self.imageUrl = user?.image ?? ""
    }
    
}
*/

import Combine
 
class UserDetailViewModel {
    @Published var userDetails: UserDetails?
 
    init(userDetails: UserDetails?) {
        self.userDetails = userDetails
    }
}
