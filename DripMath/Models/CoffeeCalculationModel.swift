// Models/CoffeeCalculation.swift
import Foundation

// MARK: - Coffee Calculation Model
struct CoffeeCalculation: Equatable {
    let coffeeAmount: Double
    let waterAmount: Double
    let ratio: CoffeeRatio
    
    init(coffeeAmount: Double, ratio: CoffeeRatio) {
        self.coffeeAmount = coffeeAmount
        self.ratio = ratio
        self.waterAmount = coffeeAmount * ratio.multiplier
    }
    
    // MARK: - Formatted Values
    var formattedCoffeeAmount: String {
        return String(format: "%.0f", coffeeAmount)
    }
    
    var formattedWaterAmount: String {
        return String(format: "%.0f", waterAmount)
    }
    
    static let defaultCalculation = CoffeeCalculation(
        coffeeAmount: 24,
        ratio: .defaultRatio
    )
}
