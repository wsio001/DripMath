// Services/CalculationService.swift
import Foundation

// MARK: - Calculation Service Protocol
protocol CalculationServiceProtocol {
    func calculateWaterAmount(coffeeAmount: Double, ratio: CoffeeRatio) -> CoffeeCalculation
    func incrementCoffeeAmount(_ currentAmount: Double) -> Double
    func decrementCoffeeAmount(_ currentAmount: Double) -> Double
}

// MARK: - Calculation Service Implementation
class CalculationService: CalculationServiceProtocol {
    
    private let incrementStep: Double = 1
    
    func calculateWaterAmount(coffeeAmount: Double, ratio: CoffeeRatio) -> CoffeeCalculation {
        return CoffeeCalculation(coffeeAmount: coffeeAmount, ratio: ratio)
    }
    
    func incrementCoffeeAmount(_ currentAmount: Double) -> Double {
        return currentAmount + incrementStep
    }
    
    func decrementCoffeeAmount(_ currentAmount: Double) -> Double {
        return currentAmount - incrementStep
    }
    
}
