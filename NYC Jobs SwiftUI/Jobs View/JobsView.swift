//

import SwiftUI

struct JobsView: View {
    
    @StateObject var viewModel: JobsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.jobs.isEmpty {
                    List(viewModel.jobs) { job in
                        NavigationLink {
                            JobDetailView(job: job)
                        } label: {
                            JobRowView(viewModel: viewModel, job: job)
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ContentUnavailableView(LocalizedStringKey("No Jobs Found"), systemImage: "magnifyingglass", description: Text("Please retry or check your internet connection"))
                }
                
            }
            .navigationTitle(Text("Jobs"))
            .navigationBarTitleDisplayMode(.automatic)
            .task {
                await viewModel.fetchJobs()
            }
            .refreshable {
                await viewModel.fetchJobs()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching Jobs..."))
                }
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
        }
    }
}

#Preview {
    JobsView(viewModel: JobsViewModel())
}
