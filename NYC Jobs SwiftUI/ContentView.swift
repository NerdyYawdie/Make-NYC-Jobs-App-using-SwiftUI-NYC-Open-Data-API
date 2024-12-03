//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            JobsView(viewModel: JobsViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "briefcase")
                        
                        Text("Jobs")
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
