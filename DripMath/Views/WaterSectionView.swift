// Views/WaterSectionView.swift
import SwiftUI

struct WaterSectionView: View {
    @ObservedObject var viewModel: CoffeeCalculatorViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            // Water amount display
            Text(viewModel.formattedWaterAmount)
                .font(.system(size: 120, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.4, green: 0.7, blue: 0.9))
                .animation(.easeInOut(duration: 0.2), value: viewModel.formattedWaterAmount)
            
            Text("ml")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))
                .offset(y: -10)
        }
    }
}

#Preview {
    WaterSectionView(viewModel: CoffeeCalculatorViewModel())
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .preferredColorScheme(.dark)
}
