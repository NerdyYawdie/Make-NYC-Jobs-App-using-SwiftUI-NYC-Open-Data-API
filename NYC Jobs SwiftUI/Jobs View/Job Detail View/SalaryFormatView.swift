//

import SwiftUI

struct SalaryFormatView: View {
    
    let job: NYCJob
    
    var body: some View {
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
}
