//

import Foundation

class JobsViewModel: ObservableObject {
    
    @Published var jobs: [NYCJob] = []
    
    // Error Properties
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    let services: APIServices
    
    let dateFormatter = DateFormatter()
    
    init(services: APIServices = APIServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchJobs() async {
        
        defer {
            isLoading = false
        }
        
        do {
            isLoading = true
            jobs = try await services.fetchJobs()
            
        } catch {
            if let customError = error as? APIError {
                errorMessage = customError.errorMessage
                showErrorAlert.toggle()
            }
            
        }
    }
    
    func convertDate(job: NYCJob) -> Date? {
        let dateString = job.posting_updated ?? ""
      
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
        let date = dateFormatter.date(from: dateString)
        return date
    }
}
