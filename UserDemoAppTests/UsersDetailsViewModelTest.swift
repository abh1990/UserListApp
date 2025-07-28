import XCTest
import Combine

@testable import UserDemoApp

final class UsersDetailsViewModelTest: XCTestCase {

    var viewModel: UserDetailViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
            super.setUp()
            cancellables = []
        }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_shouldExposeCorrectProperties() {
        let user = User(
            id: 1,
            firstName: "Jane",
            lastName: "Doe",
            email: "jane@example.com",
            image: "https://dummyjson.com/image.jpg")
        
        let userDetails = UserDetails(fullName: "\(user.firstName) \(user.lastName)", email: user.email, imageUrl: user.image)

        let viewModel = UserDetailViewModel(userDetails: userDetails)

        XCTAssertEqual(viewModel.userDetails?.fullName, "Jane Doe")
        XCTAssertEqual(viewModel.userDetails?.email, "jane@example.com")
        XCTAssertEqual(viewModel.userDetails?.imageUrl, "https://dummyjson.com/image.jpg")
    }

    func test_init_shouldFailWithIncorrectProperties() {
        let user = User(
            id: 1,
            firstName: "Jane",
            lastName: "Doe",
            email: "jane@example.com",
            image: "https://dummyjson.com/image.jpg")

        let userDetails = UserDetails(fullName: "\(user.firstName) \(user.lastName)", email: user.email, imageUrl: user.image)

        let viewModel = UserDetailViewModel(userDetails: userDetails)

        XCTAssertNotEqual(viewModel.userDetails?.fullName, "Janet Doe")
        XCTAssertNotEqual(viewModel.userDetails?.email, "janet@example.com")
        XCTAssertNotEqual(
            viewModel.userDetails?.imageUrl, "https://dummyjson.com/image1.jpg")
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

    func testUserDetailViewModelInitialization() {
        // Given
        let mockUser = User(
            id: 1,
            firstName: "Jane",
            lastName: "Doe",
            email: "jane.doe@example.com",
            image: "https://example.com/jane.jpg"
        )

        // When
        let userDetails = UserDetails(fullName: "\(mockUser.firstName) \(mockUser.lastName)", email: mockUser.email, imageUrl: mockUser.image)
        
        let viewModel = UserDetailViewModel(userDetails: userDetails)

        // Then
        XCTAssertEqual(viewModel.userDetails?.fullName, "Jane Doe")
        XCTAssertEqual(viewModel.userDetails?.email, "jane.doe@example.com")
        XCTAssertEqual(viewModel.userDetails?.imageUrl, "https://example.com/jane.jpg")
    }

    func testInit_withNilUser_setsEmptyProperties() {
        
        let viewModel = UserDetailViewModel(userDetails: UserDetails(fullName: "", email: "", imageUrl: ""))

        XCTAssertEqual(viewModel.userDetails?.fullName, "")
        XCTAssertEqual(viewModel.userDetails?.email, "")
        XCTAssertEqual(viewModel.userDetails?.imageUrl, "")
    }

    func testInit_withMissingLastName() {
        let user = User(id: 1,
            firstName: "Jane", lastName: "", email: "jane@example.com",
            image: "")
        
        let userDetails = UserDetails(fullName: "\(user.firstName) \(user.lastName)", email: user.email, imageUrl: user.image)

        let viewModel = UserDetailViewModel(userDetails: userDetails)

        XCTAssertEqual(viewModel.userDetails?.fullName, "Jane ")
        XCTAssertEqual(viewModel.userDetails?.email, "jane@example.com")
        XCTAssertEqual(viewModel.userDetails?.imageUrl, "")
    }
}
