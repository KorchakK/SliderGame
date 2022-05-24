//
//  SliderView.swift
//  SliderGame
//
//  Created by Konstantin Korchak on 24.05.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @ObservedObject var gameManager: GameManager
    
    func makeUIView(context: Context) -> UISlider {
        let sliderUI = UISlider()
        sliderUI.minimumValue = 0
        sliderUI.maximumValue = 100
              
        sliderUI.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderDidChange(_:)),
            for: .allEvents
        )
        
        return sliderUI
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = gameManager.sliderValue
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: gameManager.alphaForSlider
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $gameManager.sliderValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderDidChange(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(gameManager: GameManager())
    }
}
