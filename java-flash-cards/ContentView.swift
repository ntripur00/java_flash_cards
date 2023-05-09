//
//  ContentView.swift
//  java-flash-cards
//
//  Created by Nischal Tripuraneni on 5/8/23.
//

import SwiftUI


struct ContentView: View {
    private let flashCards = loadJson(filename: "java17")
    @State private var currentIndex = 0
    @State private var offset: CGSize = CGSize.zero
    
    private func nextCard() {
        withAnimation {
            if currentIndex < flashCards.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
        }
    }
    
    private func previousCard() {
        withAnimation {
            if currentIndex > 0 {
                currentIndex -= 1
            } else {
                currentIndex = flashCards.count - 1
            }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    ForEach((0..<flashCards.count).reversed(), id: \.self) { index in
                        if index == currentIndex {
                            FlashCardView(flashCard: flashCards[index])
                                .offset(offset)
                                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                                            .onChanged { value in
                                                offset = value.translation
                                            }
                                            .onEnded { value in
                                                if value.translation.width < -50 {
                                                    nextCard()
                                                } else if value.translation.width > 50 {
                                                    previousCard()
                                                }
                                                offset = .zero
                                            })
                        } else {
                            FlashCardView(flashCard: flashCards[index])
                                .hidden()
                        }
                    }
                }
                
                HStack {
                    Button(action: previousCard) {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: nextCard) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}




func loadJson(filename: String) -> [FlashCard] {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        let dictionary = try decoder.decode([String: String].self, from: data)
        return dictionary.map { (question: $0.key, answer: $0.value) }
    } catch {
        fatalError("Couldn't parse \(filename) as [FlashCard]:\n\(error)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
