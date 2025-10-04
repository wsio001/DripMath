// Views/RatioPickerView.swift
import SwiftUI

struct RatioPickerView: View {
    @ObservedObject var viewModel: CoffeeCalculatorViewModel
    
    var body: some View {
        ScrollView {
            // Dark background
            Color(red: 0.1, green: 0.1, blue: 0.1)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                // Handle
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 36, height: 4)
                
                // Title
                Text("Select Ratio")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                // Ratio Options
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.availableRatios, id: \.displayText) { ratio in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(ratio.displayText)
                                    .font(.system(size: 32, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text(ratio.description)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                            Spacer()
                            if ratio.displayText == viewModel.selectedRatio.displayText {
                                Circle()
                                    .fill(Color(red: 0.4, green: 0.7, blue: 0.9))
                                    .frame(width: 12, height: 12)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            print("tapped")
                            viewModel.selectRatio(ratio)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(
                                    ratio.displayText == viewModel.selectedRatio.displayText ?
                                    Color.white.opacity(0.1) : Color.white.opacity(0.03)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(
                                            ratio.displayText == viewModel.selectedRatio.displayText ?
                                            Color(red: 0.4, green: 0.7, blue: 0.9).opacity(0.7) : Color.clear,
                                            lineWidth: 1
                                        )
                                )
                        )
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
        .presentationDetents([.medium])
        .presentationDragIndicator(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    RatioPickerView(viewModel: CoffeeCalculatorViewModel())
}
