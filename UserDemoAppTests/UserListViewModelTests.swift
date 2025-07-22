import XCTest
@testable import UserDemoApp

final class UserListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_loadUsers_success_populatesUserList() async {
            // Arrange
            let mockRepo = MockUserRepository()
        mockRepo.usersToReturn = [
            User(id: 1, firstName: "John", lastName: "Doe", email: "john@example.com", image: "https://dummyjson.com/image.jpg"),
            User(id: 2, firstName: "Jane", lastName: "Smith", email: "jane@example.com", image: "https://dummyjson.com/image1.jpg")
        ]
        let viewModel = UserListViewModel(useCase: GetUsersUseCaseImp(repo: mockRepo))
     
            // Act
        await viewModel.loadUsersList()
     
            // Assert
            XCTAssertEqual(viewModel.users.count, 2)
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.errorMessage)
        }
    
    func test_loadUsers_failure_setsErrorMessage() async {
        // Arrange
        let mockRepo = MockUserRepository()
        mockRepo.shouldThrowError = true
     
        let viewModel = UserListViewModel(useCase: GetUsersUseCaseImp(repo: mockRepo))
     
        // Act
        await viewModel.loadUsersList()
     
        // Assert
        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.errorMessage, "The network request failed with error: Failed to fetch users")
    }
    
    func testLoadData_whenConnected_shouldReturnData() async {
           
           // Arrange
           let mockRepo = MockUserRepository()
           //let mockChecker = MockNetworkChecker()
           mockRepo.isConnected = true
           mockRepo.usersToReturn = [
            User(id: 1, firstName: "John", lastName: "Doe", email: "john@example.com", image: "https://dummyjson.com/image.jpg"),
            User(id: 2, firstName: "Jane", lastName: "Smith", email: "jane@example.com", image: "https://dummyjson.com/image1.jpg")
               ]
        
           let viewModel = UserListViewModel(useCase: GetUsersUseCaseImp(repo: mockRepo))
       
           //Act
           await viewModel.loadUsersList()
        
       // Assert
           XCTAssertEqual(viewModel.users.count, 2)
           XCTAssertNil(viewModel.errorMessage)
       }
    
    func testLoadData_whenDisconnected_shouldSetError() async {
        // Arrange
        let mockRepo = MockUserRepository()

        mockRepo.isConnected = false
 
    let viewModel = UserListViewModel(useCase: GetUsersUseCaseImp(repo: mockRepo))
    
        //Act
        await viewModel.loadUsersList()
     //Assert
        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertEqual(viewModel.errorMessage, "No Internet connection.")
    }
}
