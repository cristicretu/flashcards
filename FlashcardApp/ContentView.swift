//
//  ContentView.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 27.11.2023.
//

import SwiftUI
import SwiftData
import LaTeXSwiftUI

struct CardView: View {
    @Binding var showResponse: Bool
    var text: String

    var body: some View {
        RoundedRectangle(cornerRadius: 13, style: .continuous)
            .fill(showResponse ? Color.blue : Color.white)
            .frame(width: 300, height: 500)
            .overlay(
                ZStack(alignment: .topLeading) {
                    LaTeX(text)
                        .fontDesign(.serif)
                        .font(.title)
                        .padding(16)
                        .foregroundColor(showResponse ? .white : .black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: showResponse ? .center : .topLeading)
                        .animation(.spring(), value: showResponse)

                    if !showResponse {
                        VStack {
                            Spacer()
                            HStack {
                                Text("Calculus")
                                    .font(.caption)
                                    .foregroundColor(.black.opacity(0.5))
                                Spacer()
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(16)
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Button(action: {
                                }) {
                                    Label("Again", systemImage: "hand.thumbsdown")
                                }
                                .buttonStyle(.bordered)
                                
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Label("Good", systemImage: "hand.thumbsup")
                                }
                                .buttonStyle(.bordered)
                                
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Label("Easy", systemImage: "lightbulb")
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                        .padding(16)
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    showResponse.toggle()
                }
            }
            .padding()
    }
}

// Main ContentView
struct ContentView: View {
    @State private var showResponse1 = false
    @State private var showResponse2 = false
    // Add more state variables if you have more cards.

    var body: some View {
        ScrollView {
            VStack {
                CardView(showResponse: $showResponse1, text: "What is the value of  $e^{i\\pi}+1$?")
                CardView(showResponse: $showResponse2, text: "Another question?")
                // Add more CardView instances if needed.
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
