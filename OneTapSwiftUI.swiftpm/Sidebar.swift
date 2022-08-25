import SwiftUI

struct Sidebar: View {
    var body: some View {
        List{
            Section("Text input and output"){
                NavigationLink("Text"){
                    TextControlView()
                }
            }
            
            Section("Layout containers"){
                NavigationLink("VStack"){
                    VStackControlView()
                }
            }
        }.listStyle(.insetGrouped)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
