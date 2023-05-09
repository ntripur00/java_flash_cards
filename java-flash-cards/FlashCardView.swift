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
            Text(flashCard.question)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)

            if showAnswer {
                Text(flashCard.answer)
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
            }
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(25)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
        .padding()
        .onTapGesture {
            withAnimation(.spring()) {
                showAnswer.toggle()
            }
        }
    }
}
