import XCTest

@testable import UserDemoApp

final class UIImageViewTests: XCTestCase {

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

    func testLoadImageSetsPlaceholderImmediately() async {
        let imageView = await UIImageView()
        let url = "https://example.com/invalid-url.jpg"
        let placeholder = UIImage(named: "user.png")

        // When
        let expectation = XCTestExpectation(
            description: "Image loaded from URL")
        await imageView.loadImage(from: url)

        // Wait a bit for async image load
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if imageView.image != nil {
                expectation.fulfill()
            }
        }

        // Then

        await fulfillment(of: [expectation], timeout: 3.0)

        await MainActor.run {
            XCTAssertNotNil(
                imageView.image, "Expected imageView.image to be set")
            XCTAssertEqual(
                imageView.image?.pngData(),
                placeholder?.pngData(),
                "Expected placeholder image to be set immediately"
            )
        }

    }

    func testLoadImageLoadsValidImageFromNetwork() async throws {
        // Given
        let imageView = await UIImageView()
        let url = "https://via.placeholder.com/150"

        // When
        let expectation = XCTestExpectation(
            description: "Image loaded from URL")
        await imageView.loadImage(from: url)

        // Wait a bit for async image load
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if imageView.image != nil {
                expectation.fulfill()
            }
        }

        // Then
        await fulfillment(of: [expectation], timeout: 3.0)

        await MainActor.run {
            XCTAssertNotNil(
                imageView.image, "Expected image to be loaded from network")
        }
    }
}
