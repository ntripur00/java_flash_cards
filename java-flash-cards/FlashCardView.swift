//
//  FlashCardView.swift
//  java-flash-cards
//
//  Created by Nischal Tripuraneni on 5/8/23.
//

import SwiftUI


struct FlashCardView: View {
    let flashCard: FlashCard
    @State private var showAnswer = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(showAnswer ? flashCard.answer : flashCard.question)
                .font(showAnswer ? .title2 : .title) // Smaller font for the answer
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showAnswer.toggle()
                    }
                }
            
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(25)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
        .padding()
//        AdView()
    }
}

//struct FlashCardView: View {
//    let flashCard: FlashCard
//    @State private var isShowingAnswer = false
//
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
//
//            ZStack {
//                Group {
//                    Text(flashCard.question)
//                        .font(.custom("ArialRoundedMTBold", size: 25))
//                        .fontWeight(.semibold)
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.8))
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
//                }
//                .opacity(isShowingAnswer ? 0 : 1)
//                .rotation3DEffect(.degrees(isShowingAnswer ? -90 : 0), axis: (x: 0, y: 1, z: 0))
//
//                Group {
//                    Text(flashCard.answer)
//                        .font(.custom("ArialRoundedMTBold", size: 20))
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.leading)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.black.opacity(0.8))
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
//                }
//                .opacity(isShowingAnswer ? 1 : 0)
//                .rotation3DEffect(.degrees(isShowingAnswer ? 0 : 90), axis: (x: 0, y: 1, z: 0))
//            }
//            .frame(width: 350, height: 250)
//            .onTapGesture {
//                withAnimation(.spring()) {
//                    isShowingAnswer.toggle()
//                }
//            }
//        }
//    }
//}


struct FlashCardDeckView: View {
    var flashCard: FlashCard
    
    var body: some View {
        FlashCardView(flashCard: flashCard)
    }
}


//struct FlashCardDeckView: View {
//    @State private var cardBox: CardBox
//
//    var body: some View {
//        VStack {
//            ForEach(cardBox.cards.indices, id: \.self) { index in
//                FlashCardView(flashCard: cardBox.cards[index])
//            }
//        }
//    }
//}




//import SwiftUI
//
//struct FlashCardView: View {
//    let flashCard: FlashCard
//    @State private var showAnswer = false
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text(flashCard.question)
//                .font(.title)
//                .fontWeight(.semibold)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.center)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.white.opacity(0.8))
//                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
//
//            if showAnswer {
//                Text(flashCard.answer)
//                    .font(.body)
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.leading)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white.opacity(0.8))
//                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
//            }
//        }
//        .padding(.vertical)
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(25)
//        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
//        .padding()
//        .onTapGesture {
//            withAnimation(.spring()) {
//                showAnswer.toggle()
//            }
//        }
//    }
//}
