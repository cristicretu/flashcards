//
//  Home.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 30.11.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        HStack(spacing: 0){
            
            /// Side Bar
            if isMacOS() {
                Group {
                    SideBar()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            
            MainContent()
            
            
        }
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil, alignment: .leading)
        .background(Color(.white)).ignoresSafeArea()
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func MainContent() -> some View {
        VStack (spacing: 15) {
            // search
            HStack (spacing: 11) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 19, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                
                TextField("Search", text: .constant(""))
                    .font(.system(size: 19, weight: .medium, design: .rounded))

            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.bottom, isMacOS() ? 0 : 10)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
        .padding(.top, isMacOS() ? 40 : 15)
        .padding(.horizontal, 25)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack (spacing: 15) {
                Text("Decks")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                
                // cols
                let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS() ? 25 : 15), count: isMacOS() ? 3 : 1)
                
                LazyVGrid(columns: columns, spacing: 25) {
                    
                }

            }
            .padding(.top, isMacOS() ? 45 : 30)
        }
    }
    
    @ViewBuilder
    func SideBar() -> some View {
        VStack {
            
            Text("flashy")
                .font(.system(size: 24.0, weight: .medium, design: .rounded))
            
            
            // Add button
            AddButton()
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 23)
        .padding(.top, 35)
    }
    
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            
        } label: {
            
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .padding(isMacOS() ? 12 : 15)
                .background(Color.black)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
        }
    }
}

#Preview {
    Home()
}

extension View {
    func getRect() -> CGRect {
        #if os(iOS)
        return UISreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    func isMacOS() -> Bool {
        #if os(iOS)
        return false
        #endif
        return true
    }
}

// Hide focus ring
#if os(macOS)
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
#endif
