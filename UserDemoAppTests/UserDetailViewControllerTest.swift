import XCTest

@testable import UserDemoApp

final class UserDetailViewControllerTest: XCTestCase {

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

    func testViewModelPopulatesUIComponents() {
            // Given
            let mockUser = User(
                id: 1,
                firstName: "John",
                lastName: "Smith",
                email: "john@example.com",
                image: "https://example.com/image.jpg"
            )
            let viewModel = UserDetailViewModel(user: mockUser)
     
            // Instantiate the VC from storyboard manually
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
            vc.viewModel = viewModel
     
            // Load the view hierarchy
            _ = vc.view
     
            // Then
            XCTAssertEqual(vc.lblName.text, "Name: John Smith")
            XCTAssertEqual(vc.lblEmail.text, "Email: john@example.com")
        }
    
}
