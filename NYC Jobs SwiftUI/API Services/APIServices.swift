//

import Foundation

protocol APIServices {
    func fetchJobs() async throws -> [NYCJob]
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Bad URL Issue"
        case .invalidResponse:
            return "Bad Response Issue"
        case .custom(let error):
            return "Something went wrong: \(error)"
        }
    }
}

class APIServicesImpl: APIServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/kpav-sd4t.json"
    
    
    func fetchJobs() async throws -> [NYCJob] {
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            do {
                let jobs = try JSONDecoder().decode([NYCJob].self, from: data)
                return jobs
            } catch {
                throw APIError.custom(error.localizedDescription)
            }
            
        } catch {
            throw APIError.custom(error.localizedDescription)
        }
    }
}
