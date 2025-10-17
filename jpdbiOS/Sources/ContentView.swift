import SwiftUI

public struct ContentView: View {
    @State private var showExtraOptions = false
    @State private var showExamples = false

    public init() {}

    public var body: some View {
        ReviewingView()
            .preferredColorScheme(.dark)
    }
}
