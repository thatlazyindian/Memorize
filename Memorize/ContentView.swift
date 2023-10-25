//
//  ContentView.swift
//  Memorize
//
//  Created by Nakul Agrawal on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["✈️", "🚘", "🚂", "🚁", "✈️", "🚘", "🚂", "🚁"].shuffled()
        
    var body: some View {
            ScrollView {
                cards
        }
        .padding(.horizontal)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis.indices, id: \.self) { emoji in
                CardView(content: emojis[emoji]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    // code to adjust theme of cards
    

    }


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            Group {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            shape.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
