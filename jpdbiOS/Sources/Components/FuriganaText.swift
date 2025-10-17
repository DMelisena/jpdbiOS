//
//  Furigana.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//
import SwiftUI

struct FuriganaText: View {
    let kanji: String
    let reading: String
    let isHighlighted: Bool

    var body: some View {
        ZStack{
            Text(kanji)
                .font(.system(size: 16))
                .foregroundColor(isHighlighted ? .yellow : .white)
            VStack(spacing: 0) {
                Text(reading)
                    .font(.system(size: 10))
                    .foregroundColor(isHighlighted ? .yellow : .white.opacity(0.7))
                Text(" ")
                    .font(.system(size: 20))
                    .foregroundColor(isHighlighted ? .yellow : .white)
            }

        }
    }
}
