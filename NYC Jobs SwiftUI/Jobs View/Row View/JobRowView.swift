//

import SwiftUI

struct JobRowView: View {
    
    @ObservedObject var viewModel: JobsViewModel
    let job: NYCJob
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(job.business_title.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Spacer()
                
                Group {
                    Text(Decimal(Double(job.salary_range_from) ?? 0), format: .currency(code: "USD"))
                        +
                    Text("-")
                    +
                    Text(Decimal(Double(job.salary_range_to) ?? 0), format: .currency(code: "USD"))
                        
                }
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(3)
                .background(Color.green)
                .cornerRadius(4)
                    
                
                

            }
            .padding(.bottom, 5)
            
            
            Text(job.work_location)
                .padding(.bottom, 5)
            
    
            HStack(alignment: .top) {
                Text(job.agency)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                
                if let jobDate = viewModel.convertDate(job: job) {
                    Text(jobDate, style: .date)
                        .font(.caption)
                }
            }
            
        }
    }
}

#Preview {
    JobRowView(viewModel: JobsViewModel(), job: NYCJob(job_id: "636457", agency: "DEPT OF ENVIRONMENT PROTECTION", business_title: "ASSISTANT PROJECT MANAGER", civil_service_title: "MECHANICAL ENGINEERING INTERN", job_category: "Engineering, Architecture, & Planning Public Safety, Inspections, & Enforcement", full_time_part_time_indicator: .fullTime, career_level: "Entry-Level", salary_range_from: "56181", salary_range_to: "68034", salary_frequency: "Annual", work_location: "199 River Road North", division_work_unit: "UPSTATE CAPITAL CONSTR. - IFA", job_description: "hnsdisdinsd ", minimum_qual_requirements: nil, residency_requirement: "idsbnsdiknsd", posting_date: "2024-05-22T00:00:00.000", posting_updated: "2024-05-22T00:00:00.000"))
        .padding()
}
