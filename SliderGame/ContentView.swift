//
//  ContentView.swift
//  SliderGame
//
//  Created by Konstantin Korchak on 24.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var gameManager = GameManager()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack(spacing: 40) {
                Text("Подвиньте слайдер как можно ближе к: \(gameManager.targetValue)")
                HStack {
                    Text("0")
                    SliderView(gameManager: gameManager)
                    Text("100")
                }
                Button("Проверь меня!") { showAlert.toggle() }
                    .alert("Your Score", isPresented: $showAlert, actions: {}) {
                        Text("\(gameManager.scoreResult)")
                    }
                    .padding(.top, 50)
                Button("Начать заново") { gameManager.updateValue() }
            }
        }
        .padding()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
