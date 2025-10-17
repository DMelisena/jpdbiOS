//
//  SlidingButton.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//

import SwiftUI

enum grade {
    case nothing, something, hard, okay, easy
}

struct SlidingButton: View {
    @State private var dragDistance: CGFloat = 0
    @State private var startLocation: CGFloat = 0
    @State private var isDragging = false
    @State private var grade: grade = .something

    var body: some View {
        ZStack(alignment: .leading) {
            // Track
            Rectangle()
                .fill(dragDistance > -50 ? Color.red : Color.black)
                .frame(width: 250, height: 50)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if !isDragging {
                                isDragging = true
                                startLocation = value.location.x
                            }
                            dragDistance = value.location.x - startLocation
                            print("Distance dragged: \(dragDistance)")
                        }
                        .onEnded { _ in
                            isDragging = false
                            if dragDistance < -50 {
                                grade = .nothing
                            }
                            print("Final distance: \(dragDistance)")
                            print("Graded: \(grade)")
                            dragDistance = 0
                        }
                )
        }
    }
}
