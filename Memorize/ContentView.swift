//
//  ContentView.swift
//  Memorize
//
//  Created by Nakul Agrawal on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["✈️", "🚘", "🚂", "🚁", "🚈", "🛩️", "🚀", "🛶", "🚢", "🚆", "🚖", "🛵", "🚜", "🛴", "🚛"]
    
    @State var emojiCount = 3

    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            HStack {
                Button{
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }
                       label: {Image(systemName: "minus.circle")}
                
                Spacer()
                
                Button {
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }
                       label: {Image(systemName: "plus.circle")}
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        
        
    }
}

//test 333



struct CardView: View {
    var content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
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
