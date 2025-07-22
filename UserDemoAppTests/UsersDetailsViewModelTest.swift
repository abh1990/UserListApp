import XCTest

@testable import UserDemoApp

final class UsersDetailsViewModelTest: XCTestCase {

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

        let viewModel = UserDetailViewModel(user: user)

        XCTAssertEqual(viewModel.fullName, "Jane Doe")
        XCTAssertEqual(viewModel.email, "jane@example.com")
        XCTAssertEqual(viewModel.imageUrl, "https://dummyjson.com/image.jpg")
    }

    func test_init_shouldFailWithIncorrectProperties() {
        let user = User(
            id: 1,
            firstName: "Jane",
            lastName: "Doe",
            email: "jane@example.com",
            image: "https://dummyjson.com/image.jpg")

        let viewModel = UserDetailViewModel(user: user)

        XCTAssertNotEqual(viewModel.fullName, "Janet Doe")
        XCTAssertNotEqual(viewModel.email, "janet@example.com")
        XCTAssertNotEqual(
            viewModel.imageUrl, "https://dummyjson.com/image1.jpg")
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
        let viewModel = UserDetailViewModel(user: mockUser)

        // Then
        XCTAssertEqual(viewModel.fullName, "Jane Doe")
        XCTAssertEqual(viewModel.email, "jane.doe@example.com")
        XCTAssertEqual(viewModel.imageUrl, "https://example.com/jane.jpg")
    }

    func testInit_withNilUser_setsEmptyProperties() {
        let viewModel = UserDetailViewModel()

        XCTAssertEqual(viewModel.fullName, " ")
        XCTAssertEqual(viewModel.email, "")
        XCTAssertEqual(viewModel.imageUrl, "")
    }

    func testInit_withMissingLastName() {
        let user = User(id: 1,
            firstName: "Jane", lastName: "", email: "jane@example.com",
            image: "")
        let viewModel = UserDetailViewModel(user: user)

        XCTAssertEqual(viewModel.fullName, "Jane ")
        XCTAssertEqual(viewModel.email, "jane@example.com")
        XCTAssertEqual(viewModel.imageUrl, "")
    }
}
