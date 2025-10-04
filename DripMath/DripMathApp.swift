//
//  DripMathApp.swift
//  DripMath
//
//  Created by William Sio on 9/4/25.
//

import SwiftUI

@main
struct DripMathApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
