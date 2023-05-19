//
//  DrawingSavingVM.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import Foundation
import SwiftUI

class DrawingSavingVM: NSObject, ObservableObject {
    
    @Published var showSavedAlert = false
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            print("\nError -> \(error?.localizedDescription ?? "nil")\n")
        } else {
            showSavedAlert.toggle()
        }
    }
}
