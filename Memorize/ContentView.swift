//
//  ContentView.swift
//  Memorize
//
//  Created by Nakul Agrawal on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emojis = ["✈️", "🚘", "🚂", "🚁", "✈️", "🚘", "🚂", "🚁"].shuffled()
    
    @State var emojiCount = 7
    
    var body: some View {
        VStack {
            
            
            Text("Memorize").font(.system(size: 40, weight: .bold, design: .default))
                .padding()
            
            cardThemeAdjusters
            
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
    
    // code to adjust count of cards
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
    
    
    // code to adjust theme of cards
    
    var cardThemeAdjusters: some View {
        HStack {
            
                        theme1
            Spacer()

            
                        theme2
            Spacer()

                        theme3
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    
    
    
    func cardThemeAdjuster(theme: [String], symbol: String) -> some View {
        Button(action: {
            emojis = theme
        }, label: {
            Image(systemName: symbol)
        })
    }
    
    var theme1: some View {
        VStack{
            cardThemeAdjuster(theme: ["✈️", "🚘", "🚂", "🚁", "✈️", "🚘", "🚂", "🚁"].shuffled(), symbol: "car.fill")
            Text("Vehicles").font(.system(size: 15))
        }
    }
    
    var theme2: some View {
        VStack{
            cardThemeAdjuster(theme: ["⚽️", "🏀", "🏈", "🏏", "🎳", "⚽️", "🏀", "🏈", "🏏", "🎳"].shuffled(), symbol: "soccerball")
            Text("Sports").font(.system(size: 15))
        }
//        need to replace emojis with games
    }
    
    var theme3: some View {
        VStack{
            cardThemeAdjuster(theme: ["0️⃣", "1️⃣", "2️⃣", "3️⃣", "0️⃣", "1️⃣", "2️⃣", "3️⃣"].shuffled(), symbol: "numbersign")
            Text("Numbers").font(.system(size: 15))
        }
    }
    
}



//









struct CardView: View {
    let content: String
    @State var isFaceUp = false
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
