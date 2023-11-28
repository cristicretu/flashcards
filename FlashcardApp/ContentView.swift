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
    @State private var isPressed = false
    @State private var showAnswer = false

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(showAnswer ? Color.black : Color.white)
                    .frame(height: 600)
                    .shadow(radius: 10)
                    .overlay(
                        Text(showAnswer ? "Douglas Engelbart" : "Who invented the mouse?")
                            .font(.title)
                            .foregroundColor(showAnswer ? .white : .black)
                            .padding(20),
                        alignment: .center
                    )

                Circle()
                    .fill(showAnswer ? Color.white : Color.black)
                    .frame(width: isPressed ? geometry.size.width * 2 : 30, height: isPressed ? geometry.size.height * 2 : 30)
                   .offset(x: isPressed ? 0 : geometry.size.width / 2 - 15, y: isPressed ? 0 : geometry.size.height / 2 - 15)
                    .animation(.easeInOut(duration: 0.5), value: isPressed)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    .clipped()
            }
        }
        .frame(height: 600)
        .onLongPressGesture(minimumDuration: 0.5) {_ in
//            if isPressed {
//                self.isPressed.toggle()
//            } else {
//                withAnimation(.easeInOut(duration: 0.5)) {
//                    self.isPressed.toggle()
//                }
//            }
            self.isPressed.toggle()
        } perform: {
            self.showAnswer.toggle()
        }
    }
}

struct ContentView: View {
    @State private var isPressed = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { index in
                    CardView()
                        .padding()
                        .onLongPressGesture(minimumDuration: 0.5, pressing: { isPressing in
                            withAnimation(.easeInOut) {
                                self.isPressed = isPressing
                            }
                        }, perform: {
                            // Perform the action to reveal the answer here
                        })
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .background(Color.white.ignoresSafeArea())
        .frame(width: .infinity, height: 800)
        .modelContainer(for: Item.self, inMemory: true)
}
