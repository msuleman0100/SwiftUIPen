//
//  DrawingVM.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import Foundation
import SwiftUI
import PencilKit


class DrawingVM: ObservableObject {
    
    @Published var canvasView = PKCanvasView()
    @Published var drawingImage: UIImage? = UIImage(systemName: "person")
    
    
    @Published var showPreview = false
    
    func saveSignature(completion: (_ status: Bool) -> Void)  {
        let image = canvasView.drawing.image(from: .init(x: 0, y: 0,
                                                        width: canvasView.frame.width,
                                                        height: canvasView.frame.height),
                                            scale: 1.0)
        drawingImage = image
        completion(true)
    }
    
}
