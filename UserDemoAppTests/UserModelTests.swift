import XCTest

@testable import UserDemoApp

final class UserModelTests: XCTestCase {
    
    func testUserDecodingFromJSON() throws {
        let json = """
        {
            "id": 1,
            "name": "Arun",
            "email": "arun@example.com"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let user = try decoder.decode(User.self, from: json)
        
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Arun")
        XCTAssertEqual(user.email, "arun@example.com")
    }
    
    func testUserEncodingToJSON() throws {
        let user = User(id: 2, name: "Bobby", email: "bobby@example.com")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys // For consistent output
        
        let data = try encoder.encode(user)
        let jsonString = String(data: data, encoding: .utf8)!
        
        let expected = """
        {"email":"bobby@example.com","id":2,"name":"Bobby"}
        """
        XCTAssertEqual(jsonString, expected)
    }

    func testUserEncodeDecodeRoundTrip() throws {
        let originalUser = User(id: 3, name: "charu", email: "charu@example.com")
        
        let data = try JSONEncoder().encode(originalUser)
        let decodedUser = try JSONDecoder().decode(User.self, from: data)
        
        XCTAssertEqual(originalUser.id, decodedUser.id)
        XCTAssertEqual(originalUser.name, decodedUser.name)
        XCTAssertEqual(originalUser.email, decodedUser.email)
    }
}
