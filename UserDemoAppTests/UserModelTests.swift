import XCTest

@testable import UserDemoApp

final class UserModelTests: XCTestCase {
    
    func testUserDecodingFromJSON() throws {
        let json = """
         {
           "users": [
               {
                   "id": 1,
                   "firstName": "Arun",
                   "lastName": "Kumar",
                   "email": "arun.kumar@example.com",
                    "image": "https://example.com/arun.jpg"
               },
               {
                   "id": 2,
                   "firstName": "Jane",
                   "lastName": "Smith",
                   "email": "jane.smith@example.com",
                   "image": "https://example.com/jane.jpg"
               }
           ]
        }        
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Users.self, from: json)
        
        XCTAssertEqual(decoded.users.count, 2)
        XCTAssertEqual(decoded.users[0].firstName, "Arun")
        XCTAssertEqual(decoded.users[1].email, "jane.smith@example.com")
    }
    
    func testUserEncodingToJSON() throws {
        
        let users = Users(users: [
     User(id: 1, firstName: "Alice", lastName: "Brown", email: "alice@example.com", image: "https://example.com/alice.jpg"),
     User(id: 2, firstName: "Bob", lastName: "Green", email: "bob@example.com", image: "https://example.com/bob.jpg")
         ])
             let encoder = JSONEncoder()
             encoder.outputFormatting = .prettyPrinted
             
             let data = try encoder.encode(users)
             let jsonString = String(data: data, encoding: .utf8)!
             
            XCTAssertTrue(jsonString.contains("Alice"))
            XCTAssertTrue(jsonString.contains("bob@example.com"))
         }

    func testUserEncodeDecodeRoundTrip() throws {
        let users = Users(users: [
User(id: 1, firstName: "Alice", lastName: "Brown", email: "alice@example.com", image: "https://example.com/alice.jpg"),
User(id: 2, firstName: "Bob", lastName: "Green", email: "bob@example.com", image: "https://example.com/bob.jpg")
    ])
        
        let data = try JSONEncoder().encode(users)
        let decoded = try JSONDecoder().decode(Users.self, from: data)
        
       XCTAssertEqual(decoded.users.count, 2)
        XCTAssertEqual(decoded.users[0].firstName, "Alice")
        XCTAssertEqual(decoded.users[1].email, "bob@example.com")

    }
}
