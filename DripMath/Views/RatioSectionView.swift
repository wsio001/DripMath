// Views/RatioSectionView.swift
import SwiftUI

struct RatioSectionView: View {
    @ObservedObject var viewModel: CoffeeCalculatorViewModel
    
    private var buttonStyle: some PrimitiveButtonStyle {
        if #available(iOS 26.0, *) {
            return .glass
        }else {
            return .bordered
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            // Ratio label
            Text("Ratio")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))
            
            // Ratio value with tap gesture
            Button(action: {
                viewModel.showRatioSelector()
            }) {
                Text(viewModel.selectedRatio.displayText)
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                Image(systemName: "hand.rays.fill")
            }
            .buttonStyle(buttonStyle)
        }
    }
}

#Preview {
    RatioSectionView(viewModel: CoffeeCalculatorViewModel())
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .preferredColorScheme(.dark)
}
