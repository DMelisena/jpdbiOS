//
//  GradeButton.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//
import SwiftUI

struct GradeButton: View {
    let grade: String
    let color: Color
    let key: String

    var body: some View {
        Button(action: {
            print("Graded: \(grade)")
        }) {
            Text(grade)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(color.opacity(0.6), lineWidth: 2)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(color.opacity(0.15))
                        )
                )
        }
    }
}
