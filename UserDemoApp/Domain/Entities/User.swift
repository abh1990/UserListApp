
public struct Users:Codable, Hashable {
    public let users: [User]
}

public struct User: Codable, Hashable {
  public let id: Int
  public let firstName: String
  public let lastName: String
  public let email: String
  public let image: String
}
