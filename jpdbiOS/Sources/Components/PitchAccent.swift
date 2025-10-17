//
//  PitchAccentView.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//
import SwiftUI

struct PitchAccent: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("つ")
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.blue.opacity(0.3))
                )
            Text("き")
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.red.opacity(0.3))
                )
        }
        .foregroundColor(.white)
    }
}
