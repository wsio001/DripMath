// Services/RatioService.swift
import Foundation

// MARK: - Ratio Service Protocol
protocol RatioServiceProtocol {
    func getAllRatios() -> [CoffeeRatio]
    func getDefaultRatio() -> CoffeeRatio
    func getNextRatio(current: CoffeeRatio) -> CoffeeRatio
    func getPreviousRatio(current: CoffeeRatio) -> CoffeeRatio
}

// MARK: - Ratio Service Implementation
class RatioService: RatioServiceProtocol {
    
    func getAllRatios() -> [CoffeeRatio] {
        return CoffeeRatio.allCases
    }
    
    func getDefaultRatio() -> CoffeeRatio {
        return CoffeeRatio.defaultRatio
    }
    
    func getNextRatio(current: CoffeeRatio) -> CoffeeRatio {
        let ratios = getAllRatios()
        guard let currentIndex = ratios.firstIndex(where: { $0.displayText == current.displayText }) else {
            return current
        }
        
        let nextIndex = (currentIndex + 1) % ratios.count
        return ratios[nextIndex]
    }
    
    func getPreviousRatio(current: CoffeeRatio) -> CoffeeRatio {
        let ratios = getAllRatios()
        guard let currentIndex = ratios.firstIndex(where: { $0.displayText == current.displayText }) else {
            return current
        }
        
        let previousIndex = currentIndex == 0 ? ratios.count - 1 : currentIndex - 1
        return ratios[previousIndex]
    }
}