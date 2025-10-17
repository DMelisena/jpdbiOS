//
//  MeaningsView.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//

import SwiftUI

struct Meanings: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Meanings")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white.opacity(0.6))
                    .textCase(.uppercase)
                Image(systemName: "pencil")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.5))
            }

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Noun")
                        .font(.system(size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(4)
                    Text("Astronomy")
                        .font(.system(size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.purple.opacity(0.3))
                        .cornerRadius(4)
                }
                .foregroundColor(.white.opacity(0.9))
                Text("1.  moon")
                    .foregroundColor(.white.opacity(0.9))
                Text("2.  month")
                    .foregroundColor(.white.opacity(0.9))
            }
        }
    }
}
