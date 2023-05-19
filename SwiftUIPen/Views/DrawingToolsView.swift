//
//  DrawingToolsView.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import SwiftUI
import PencilKit

struct DrawingToolsView: View {
    
    @Environment(\.undoManager) private var undoManager
    @EnvironmentObject var drawingVM: DrawingVM
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                Button { drawingVM.canvasView.drawing = PKDrawing() } label: {
                    Text("Clear")
                        .modifier(PencilKitButtonStyle())
                }
                
                Button { undoManager?.undo() } label: {
                    Text("Undo")
                        .modifier(PencilKitButtonStyle())
                }
                
                Button { undoManager?.redo() } label: {
                    Text("Redo")
                        .modifier(PencilKitButtonStyle())
                }
                
                Button {
                    drawingVM.saveSignature() { status in
                        if status {
                            withAnimation { drawingVM.showPreview.toggle() }
                        }
                    }
                } label: {
                    Text("Preview")
                        .modifier(PencilKitButtonStyle())
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 14)
            .padding(.top, 26)
        }
    }
}

struct DrawingToolsView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingToolsView()
    }
}
