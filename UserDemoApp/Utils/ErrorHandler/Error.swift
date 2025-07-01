import Foundation
 
enum NetworkError: Error {
    case badURL
    case requestFailed(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case noData
    case decodingFailed(Error)
    case timeout
    case unauthorized
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "The URL provided was invalid."
        case .requestFailed(let error):
            return "The network request failed with error: \(error.localizedDescription)"
        case .invalidResponse:
            return "The response from the server was invalid."
        case .invalidStatusCode(let code):
            return "Received an unexpected status code: \(code)"
        case .noData:
            return "No data was received from the server."
        case .decodingFailed(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .timeout:
            return "The request timed out."
        case .unauthorized:
            return "You are not authorized to perform this action."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
