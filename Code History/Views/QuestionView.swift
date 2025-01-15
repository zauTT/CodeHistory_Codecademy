//
//  QuestionView.swift
//  Code History
//
//  Created by Giorgi Zautashvili on 13.12.24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        VStack{
            Text(question.questionText)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in Button(action: {
                    viewModel.makeGuess(atIndex: answerIndex)
                        print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                    
                }) {
                        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                        .background(viewModel.color(forOptionIndex: answerIndex))
                    }
                .disabled(viewModel.guessWasMade)
                }
            }
            if viewModel.guessWasMade {
                Button(action: { viewModel.displayNextScreen() }) {
                    BottomTextView(str: "Next")
                }
            }
        }
    }
}

struct QuestionViewPreviews: PreviewProvider {
    static var previews: some View{
        QuestionView(question: Game().currentQuestion)
            .environmentObject(GameViewModel())
    }
}
