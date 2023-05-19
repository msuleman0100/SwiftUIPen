//
//  PencilKitButtonStyle.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import SwiftUI

struct PencilKitButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}


//MARK: Constants
let fullWidth = UIScreen.main.bounds.width
let fullHeight = UIScreen.main.bounds.height
