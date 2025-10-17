import SwiftUI

public struct ContentView: View {
    @State private var showExtraOptions = false
    @State private var showExamples = false
    @ObserveInjection var forceRedraw
    public init() {}

    public var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.09, blue: 0.09)
                .ignoresSafeArea()
            ReviewingView()
                .preferredColorScheme(.dark)
        }
    }
}
