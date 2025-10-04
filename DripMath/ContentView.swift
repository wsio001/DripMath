// Views/ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoffeeCalculatorViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Dark background matching the image
                Color(red: 0.15, green: 0.15, blue: 0.15)
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Spacer()
                    
                    // Ratio Section
                    RatioSectionView(viewModel: viewModel)
                    
                    // Coffee Amount Section
                    CoffeeSectionView(viewModel: viewModel)
                    
                    // Water Result Section
                    WaterSectionView(viewModel: viewModel)
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $viewModel.isShowingRatioSelector) {
            RatioPickerView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
