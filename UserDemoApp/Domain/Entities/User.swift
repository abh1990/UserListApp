
public struct Users:Codable {
    public let users: [User]
}

public struct User: Codable {
  public let id: Int
  public let firstName: String
  public let lastName: String
  public let email: String
  public let image: String
}
