//
//  SlidingButton.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//

import SwiftUI

struct SlidingButton: View {
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Track
            Rectangle()
                .fill(offset > 100 ? Color.red : Color.blue)
                .frame(width: 250, height: 50)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isDragging = true
                            offset = min(max(0, value.location.x), 210)
                            print("offset: \(offset)")
                        }
                        .onEnded { _ in
                            isDragging = false
                            if offset > 100 {
                                print("Graded: I don't know ")
                            }
                            else {
                                print("Graded: I think I've seen it")
                            }
                        }
                )
        }
    }
}
