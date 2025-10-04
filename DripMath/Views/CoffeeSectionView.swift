// Views/CoffeeSectionView.swift
import SwiftUI
import Combine

struct CoffeeSectionView: View {
    @ObservedObject var viewModel: CoffeeCalculatorViewModel
    @FocusState private var isCoffeeAmountFocused: Bool
    
    private var buttonStyle: some PrimitiveButtonStyle {
        if #available(iOS 26.0, *) {
            return .glass
        }else {
            return .bordered
        }
    }
    
    var body: some View {
        HStack(spacing: 30) {
            // Minus button (hidden - only plus button as shown in image)
            Button(action: {
                viewModel.decrementCoffeeAmount()
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.7))
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(buttonStyle)

            
            // Coffee amount display
            VStack(spacing: 8) {
                TextField("", text: $viewModel.coffeeAmountString)
                    .keyboardType(.numberPad)
                
                    .multilineTextAlignment(.center)
                    .font(.system(size: 120, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 0.85, green: 0.75, blue: 0.6))
                    .focused($isCoffeeAmountFocused)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button("Done") {
                                isCoffeeAmountFocused = false
                            }
                        }
                    }
                    .onChange(of: viewModel.coffeeAmountString) {
                        viewModel.formattedCoffeeAmount(string: viewModel.coffeeAmountString )
                    }
                
                Text("g")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.7))
                    .offset(y: -10)
            }
            
            // Plus button
            Button(action: {
                viewModel.incrementCoffeeAmount()
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.7))
                    .frame(width: 30, height: 30)
                
            }
            .buttonStyle(buttonStyle)
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        CoffeeSectionView(viewModel: CoffeeCalculatorViewModel())
            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
            .preferredColorScheme(.dark)
    } else {
        // Fallback on earlier versions
    }
}
