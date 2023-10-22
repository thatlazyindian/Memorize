//
//  ContentView.swift
//  Memorize
//
//  Created by Nakul Agrawal on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["✈️", "🚘", "🚂", "🚁", "🚈", "🛩️", "🚀", "🛶", "🚢", "🚆", "🚖", "🛵", "🚜", "🛴", "🚛"]
    
    @State var emojiCount = 7

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
            
            cardCountAdjusters
        }
        .padding(.horizontal)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<emojiCount, id: \.self) { emoji in
                CardView(content: emojis[emoji]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            emojiCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(emojiCount + offset < 1 || emojiCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.circle")
    }
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
