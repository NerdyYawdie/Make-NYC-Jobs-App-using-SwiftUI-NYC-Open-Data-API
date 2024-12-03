//

import SwiftUI

struct JobDetailView: View {
    
    let job: NYCJob
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 1) {
                    Text(job.business_title.capitalized)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    SalaryFormatView(job: job)
                        .padding(.bottom)
                    
                    if let jobURL = URL(string: "https://cityjobs.nyc.gov/job/\(job.job_id)") {
                        Link(LocalizedStringKey("Apply for Job"), destination: jobURL)
                            .buttonStyle(.borderedProminent)
                    }
                }
                
                
                Spacer()
                
                Text(job.full_time_part_time_indicator.title)
                    
            }
            .padding()
            
            
            Form {
                
                // Location
                Section {
                    Text(job.work_location)
                    Text(job.division_work_unit)
                } header: {
                    Text("Location")
                }
                
                // Resident Requirement
                Section {
                    Text(job.residency_requirement)
                } header: {
                    Text("Resident Requirement")
                }
                
                // Minimum Qualifications
                Section {
                    Text(job.minimum_qual_requirements ?? "")
                } header: {
                    Text("Qualifications")
                }

                // Description
                Section {
                    Text(job.job_description)
                } header: {
                    Text("Description")
                }
                
                

            }
            
            
        }
    }
        
}

#Preview {
    JobDetailView(job: NYCJob(job_id: "636457", agency: "DEPT OF ENVIRONMENT PROTECTION", business_title: "ASSISTANT PROJECT MANAGER", civil_service_title: "MECHANICAL ENGINEERING INTERN", job_category: "Engineering, Architecture, & Planning Public Safety, Inspections, & Enforcement", full_time_part_time_indicator: .fullTime, career_level: "Entry-Level", salary_range_from: "56181", salary_range_to: "68034", salary_frequency: "Annual", work_location: "199 River Road North", division_work_unit: "UPSTATE CAPITAL CONSTR. - IFA", job_description: "Some really long description ", minimum_qual_requirements: nil, residency_requirement: "New York City residency is generally required within 90 days of appointment. However, City Employees in certain titles who have worked for the City for 2 continuous years may also be eligible to reside in Nassau, Suffolk, Putnam, Westchester, Rockland, or Orange County. To determine if the residency requirement applies to you, please discuss with the agency representative at the time of interview.", posting_date: "2024-05-22T00:00:00.000", posting_updated: "2024-05-22T00:00:00.000"))
}
