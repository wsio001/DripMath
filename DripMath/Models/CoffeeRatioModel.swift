// Models/CoffeeRatio.swift
import Foundation

// MARK: - Coffee Ratio Model
struct CoffeeRatio: Identifiable, Equatable {
    let id = UUID()
    let displayText: String
    let multiplier: Double
    let description: String
    
    // MARK: - Static Instances
    static let ratio1to12 = CoffeeRatio(
        displayText: "1:12",
        multiplier: 12,
        description: "Strong"
    )
    
    static let ratio1to14 = CoffeeRatio(
        displayText: "1:14",
        multiplier: 14,
        description: "Medium Strong"
    )
    
    static let ratio1to15 = CoffeeRatio(
        displayText: "1:15",
        multiplier: 15,
        description: "Balanced"
    )
    
    static let ratio1to16 = CoffeeRatio(
        displayText: "1:16",
        multiplier: 16,
        description: "Standard"
    )
    
    static let ratio1to18 = CoffeeRatio(
        displayText: "1:18",
        multiplier: 18,
        description: "Light"
    )
    
    // MARK: - All Cases
    static let allCases: [CoffeeRatio] = [
        .ratio1to12, .ratio1to14, .ratio1to15, .ratio1to16, .ratio1to18
    ]
    
    static let defaultRatio = ratio1to16
}
