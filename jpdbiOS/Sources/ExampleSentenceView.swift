//
//  ExampleSentenceView.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//
import SwiftUI

struct ExampleSentence: View {
    let japanese: String
    let english: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
                Text(japanese)
                    .foregroundColor(.white)
            }
            Text(english)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
        }
    }
}
