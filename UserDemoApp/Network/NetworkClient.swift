import Foundation

public protocol NetworkClient {
  func get<T: Decodable>(_ url: URL) async throws -> T
}
 
public struct URLSessionNetworkClient: NetworkClient {
    public init() {}
    
    public func get<T>(_ url: URL) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
                throw NetworkError.invalidResponse
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as URLError {
            if error.code == .timedOut {
                throw NetworkError.timeout
            } else {
                throw NetworkError.requestFailed(error)
            }
        } catch {
            throw NetworkError.unknown
        }
    }
}
