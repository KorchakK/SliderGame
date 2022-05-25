//
//  GameManager.swift
//  SliderGame
//
//  Created by Konstantin Korchak on 24.05.2022.
//

import UIKit
import Combine

final class GameManager: ObservableObject {
    
    @Published var targetValue: Int
    @Published var sliderValue: Float = 50
    
    var alphaForSlider: CGFloat {
        CGFloat(computeScore()) / 100
    }
    
    var scoreResult: Int {
        computeScore()
    }
    
    init() {
        targetValue = Int.random(in: 0...100)
    }
    
    func updateValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
}
