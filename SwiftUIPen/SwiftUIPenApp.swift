//
//  SwiftUIPenApp.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import SwiftUI

@main
struct SwiftUIPenApp: App {
    
    @StateObject var imageSaverVM = DrawingSavingVM()
    @StateObject var drawingVM = DrawingVM()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(imageSaverVM)
                .environmentObject(drawingVM)
        }
    }
}


//Test change...
