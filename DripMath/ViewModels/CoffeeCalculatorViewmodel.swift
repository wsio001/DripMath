// ViewModels/CoffeeCalculatorViewModel.swift
import SwiftUI
import Combine

// MARK: - Coffee Calculator View Model
final class CoffeeCalculatorViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var coffeeAmount: Double = 25
    @Published var coffeeAmountString: String = "25" {
        didSet {
            coffeeAmount = Double(coffeeAmountString) ?? 0
        }
    }
    @Published var selectedRatio: CoffeeRatio = CoffeeRatio.defaultRatio
    @Published var currentCalculation: CoffeeCalculation = CoffeeCalculation.defaultCalculation
    @Published var isShowingRatioSelector: Bool = false
    
    // MARK: - Services
    private let calculationService: CalculationServiceProtocol
    private let ratioService: RatioServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Computed Properties
    
    var formattedWaterAmount: String {
        currentCalculation.formattedWaterAmount
    }
    
    var availableRatios: [CoffeeRatio] {
        ratioService.getAllRatios()
    }

    
    // MARK: - Initialization
    init(
        calculationService: CalculationServiceProtocol = CalculationService(),
        ratioService: RatioServiceProtocol = RatioService()
    ) {
        self.calculationService = calculationService
        self.ratioService = ratioService
        
        setupBindings()
        calculateWaterAmount()
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        // Watch for changes in coffee amount and ratio
        Publishers.CombineLatest($coffeeAmount, $selectedRatio)
            .debounce(for: .milliseconds(100), scheduler: DispatchQueue.main)
            .sink { [weak self] _, _ in
                self?.calculateWaterAmount()
            }
            .store(in: &cancellables)
    }
    
    private func calculateWaterAmount() {
        currentCalculation = calculationService.calculateWaterAmount(
            coffeeAmount: coffeeAmount,
            ratio: selectedRatio
        )
    }
    
    // MARK: - Public Methods
    func incrementCoffeeAmount() {
        let newAmount = calculationService.incrementCoffeeAmount(coffeeAmount)
        if newAmount != coffeeAmount {
            withAnimation(.easeInOut(duration: 0.2)) {
                coffeeAmount = newAmount
                coffeeAmountString = String(format: "%.0f", coffeeAmount)
            }
        }
    }
    
    func decrementCoffeeAmount() {
        let newAmount = calculationService.decrementCoffeeAmount(coffeeAmount)
        if newAmount != coffeeAmount {
            withAnimation(.easeInOut(duration: 0.2)) {
                coffeeAmount = newAmount
                coffeeAmountString = String(format: "%.0f", coffeeAmount)
            }
        }
    }
    
    func resetCoffeeAmountString() {
        coffeeAmountString = ""
    }
    func selectRatio(_ ratio: CoffeeRatio) {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedRatio = ratio
        }
        hideRatioSelector()
    }
    
    func showRatioSelector() {
        isShowingRatioSelector = true
    }
    
    func hideRatioSelector() {
        isShowingRatioSelector = false
    }
    
    func formattedCoffeeAmount(string: String) {
        var newString = string.filter {
            Set("0123456789").contains($0)
        }
        
        while newString.hasPrefix("0") && newString.count > 1 {
            newString.removeFirst()
        }
        
        coffeeAmountString = newString
    }
    
    func nextRatio() {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedRatio = ratioService.getNextRatio(current: selectedRatio)
        }
    }
    
    func previousRatio() {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedRatio = ratioService.getPreviousRatio(current: selectedRatio)
        }
    }
}
