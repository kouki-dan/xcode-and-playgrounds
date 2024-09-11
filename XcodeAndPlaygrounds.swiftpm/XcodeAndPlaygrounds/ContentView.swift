import SwiftUI
import Photos

struct ContentView: View {
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
        }
    }
}
