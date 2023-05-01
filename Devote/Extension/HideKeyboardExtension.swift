//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Jared Infantino on 2023-05-01.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // dissmiss keyboard when we run the function
    }
}
#endif
