import XCTest
import Combine

@testable import UserDemoApp

final class UserDetailViewControllerTest: XCTestCase {

    var cancellables: Set<AnyCancellable> = []
    
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
    
    func testUserDetailViewControllerDisplaysCorrectData() {
            // 1. Create mock user and view model
        let user = User(
                        id: 1,
                        firstName: "John",
                        lastName: "Smith",
                        email: "john@example.com",
                        image: "https://example.com/image.jpg"
                    )
        
        let userDetails = UserDetails(fullName: "\(user.firstName) \(user.lastName)", email: user.email, imageUrl: user.image)

     
        let viewModel = UserDetailViewModel(userDetails: userDetails)
     
            // 2. Create the view controller and assign the viewModel
            let vc = UserDetailViewController()
            vc.viewModel = viewModel
     
            // 3. Load the view lifecycle to trigger viewDidLoad()
            vc.loadViewIfNeeded()
     
            // 4. Expectation to allow Combine to publish
            let expectation = XCTestExpectation(description: "Wait for UI to update")
     
            // Wait for Combine to deliver the value
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                XCTAssertEqual(vc.lblName.text, "Name: John Smith")
                XCTAssertEqual(vc.lblEmail.text, "Email: john@example.com")
                expectation.fulfill()
            }
     
            wait(for: [expectation], timeout: 1.0)
        }
}
