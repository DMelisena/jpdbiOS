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
    @State private var dragDistanceb: CGFloat = 0
    @State private var startLocationb: CGFloat = 0
    @State private var isDragging = false
    @State private var grade: grade = .something

    var body: some View {
        VStack(spacing: 12) {
            // First sliding button
            ZStack(alignment: .leading) {
                let currentColor: Color = dragDistance > -50 ? .red : .black

                RoundedRectangle(cornerRadius: 6)
                    .stroke(currentColor.opacity(0.6), lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(currentColor.opacity(0.15))
                    )
                    .frame(height: 50)
                    .overlay(
                        ZStack {
                            Text("I never seen this")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(max(0, min(1, -dragDistance / 100)))

                            Text("I think I've seen it")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(max(0, min(1, 1 - (-dragDistance / 100))))
                        }
                    )
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

            // Second sliding button
            ZStack(alignment: .leading) {
                let currentColor: Color = {
                    if dragDistanceb > 25 {
                        return .green
                    } else if dragDistanceb < -25 {
                        return .orange
                    } else {
                        return .blue
                    }
                }()

                RoundedRectangle(cornerRadius: 6)
                    .stroke(currentColor.opacity(0.6), lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(currentColor.opacity(0.15))
                    )
                    .frame(height: 50)
                    .overlay(
                        ZStack {
                            Text("Easy")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(dragDistanceb > 25 ? 1 : 0)

                            Text("Okay")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(dragDistanceb >= -25 && dragDistanceb <= 25 ? 1 : 0)

                            Text("Hard")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(dragDistanceb < -25 ? 1 : 0)
                        }
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isDragging {
                                    isDragging = true
                                    startLocationb = value.location.x
                                }
                                dragDistanceb = value.location.x - startLocationb
                                print("Distance dragged: \(dragDistanceb)")
                            }
                            .onEnded { _ in
                                isDragging = false
                                if dragDistanceb > 25 {
                                    grade = .easy
                                } else if dragDistanceb < -25 {
                                    grade = .okay
                                } else {
                                    grade = .hard
                                }
                                print("Final distance: \(dragDistanceb)")
                                print("Graded: \(grade)")
                                dragDistanceb = 0
                            }
                    )
            }
        }
    }
}
