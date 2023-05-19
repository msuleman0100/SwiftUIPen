//
//  MyCanvasView.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import SwiftUI
import PencilKit

struct MyCanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pencil, color: .purple, width: 10)
        return canvasView
    }
    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) { }
}

struct MyCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        MyCanvasView(canvasView: .constant(PKCanvasView()))
    }
}
