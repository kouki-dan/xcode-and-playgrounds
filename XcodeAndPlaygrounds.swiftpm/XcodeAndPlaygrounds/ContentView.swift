import SwiftUI
import Photos

struct ContentView: View {
    @State
    var showStatusBarSimuiaton = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("from Playgrounds :)")
            Button("Photo Album Access") {
                Task {
                    await PHPhotoLibrary.requestAuthorization(for: .readWrite)
                }
            }
            Button("Show status bar simulation") {
                showStatusBarSimuiaton.toggle()
            }
        }
        .fullScreenCover(isPresented: $showStatusBarSimuiaton) {
            StatusBarSimulationPage()
        }
    }
}
