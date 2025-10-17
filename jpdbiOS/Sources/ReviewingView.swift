//
//  ReviewingView.swift
//  jpdbiOS
//
//  Created by Arya Hanif on 17/10/25.
//
import SwiftUI

public struct ReviewingView: View {
    @State private var showExtraOptions = false
    @State private var showExamples = false

    public var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.09, blue: 0.09)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        // Answer Box - Vocabulary Card
                        VStack(spacing: 16) {
                            // Main vocabulary word with furigana
                            VStack(spacing: 8) {
                                HStack {
                                    Spacer()
                                    VStack(spacing: 2) {
                                        Text("つき")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white.opacity(0.7))
                                        Text("月")
                                            .font(.system(size: 48, weight: .regular))
                                            .foregroundColor(.white)
                                    }
                                    Image(systemName: "speaker.wave.2.fill")
                                        .foregroundColor(.blue)
                                        .padding(.leading, 12)
                                    Spacer()
                                }

                                // Example sentence
                                VStack(spacing: 8) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "speaker.wave.2.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.blue)

                                        HStack(spacing: 0) {
                                            FuriganaText(kanji: "月", reading: "つき", isHighlighted: true)
                                            Text("には")
                                            FuriganaText(kanji: "人", reading: "ひと", isHighlighted: false)
                                            Text("がいない。")
                                        }
                                        .foregroundColor(.white)

                                        Image(systemName: "pencil")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white.opacity(0.5))
                                    }

                                    Text("There are no people on the moon.")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(8)
                            }
                            .padding(.top, 20)

                            // Meanings Section
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)

                            // Kanji Used Section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Kanji used")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.6))
                                    .textCase(.uppercase)

                                HStack {
                                    Text("月")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                    Text("moon")
                                        .foregroundColor(.white.opacity(0.7))
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)

                            // Pitch Accent Section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Pitch accent")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.6))
                                    .textCase(.uppercase)

                                HStack(spacing: 12) {
                                    Image(systemName: "speaker.wave.2.fill")
                                        .foregroundColor(.blue)

                                    PitchAccentView()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)

                            // Examples Toggle
                            Button(action: {
                                withAnimation {
                                    showExamples.toggle()
                                }
                            }) {
                                Text("Click to toggle examples...")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.5))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding(.top, 8)

                            if showExamples {
                                VStack(alignment: .leading, spacing: 16) {
                                    ExampleSentence(
                                        japanese: "太陽は昼に輝き、月は夜に輝く。",
                                        english: "The sun shines in the daytime and the moon at night."
                                    )

                                    ExampleSentence(
                                        japanese: "昼間は太陽が、夜は月が光を与えてくれる。",
                                        english: "The sun gives light by day, and the moon by night."
                                    )

                                    ExampleSentence(
                                        japanese: "彼女は月の光を楽しむために電灯を消した。",
                                        english: "She turned off the lights so she could enjoy the moonlight."
                                    )
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(8)
                                .transition(.opacity)
                            }

                            // Footer info
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Do not confuse with: 月 (げつ)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white.opacity(0.75))

                                Text("Part of the Japanese Language Proficiency Test - N4 deck")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 16)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    }
                }
                VStack {
                    answerList
                    extraOptionToggle
                    .padding(.horizontal, 16)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    private var answerList: some View {
        VStack{
            HStack(spacing: 12) {
                GradeButton(grade: "✘ Nothing", color: .red, key: "1")
                GradeButton(grade: "✘ Something", color: .red, key: "2")
            }

            HStack(spacing: 12) {
                GradeButton(grade: "✔ Hard", color: .orange, key: "3")
                GradeButton(grade: "✔ Okay", color: .green, key: "4")
                GradeButton(grade: "✔ Easy", color: .green, key: "5")
            }
        }
    }
    private var extraOptionToggle: some View {
        VStack(spacing: 12) {
            // Extra options toggle
            Button(action: {
                withAnimation {
                    showExtraOptions.toggle()
                }
            }) {
                HStack {
                    Text(showExtraOptions ? "▲" : "▼")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.05))
                .cornerRadius(4)
            }
            .foregroundColor(.white.opacity(0.6))

            if showExtraOptions {
                HStack(spacing: 12) {
                    GradeButton(grade: "Blacklist", color: .red, key: "b")
                    GradeButton(grade: "I'll never forget", color: .gray, key: "k")
                }
                .transition(.opacity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
