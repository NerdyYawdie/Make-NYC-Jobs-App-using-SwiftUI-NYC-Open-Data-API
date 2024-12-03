//

import Foundation

struct NYCJob: Decodable, Identifiable {
    let id = UUID()
    let job_id: String
    let agency: String
    let business_title: String
    let civil_service_title: String
    let job_category: String
    let full_time_part_time_indicator: PositionType
    let career_level: String
    let salary_range_from: String
    let salary_range_to: String
    let salary_frequency: String
    let work_location: String
    let division_work_unit: String
    let job_description: String
    let minimum_qual_requirements: String?
    let residency_requirement: String
    let posting_date: String?
    let posting_updated: String?
}

enum PositionType: String, Decodable {
    
    case fullTime = "F"
    case partTime = "P"
    
    var title: String {
        switch self {
        case .fullTime:
            return "Full Time"
        case .partTime:
            return "Part Time"
        }
    }
}
