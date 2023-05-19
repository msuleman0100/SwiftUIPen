//
//  ContentView.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 18/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var imageSaver: DrawingSavingVM
    @EnvironmentObject var drawingVM: DrawingVM
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                titleView()
                DrawingToolsView()
                MyCanvasView(canvasView: $drawingVM.canvasView)
                    .edgesIgnoringSafeArea(.horizontal)
                    .edgesIgnoringSafeArea(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.purple, .pink, .purple],
                                       startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .overlay(
                Color.black.edgesIgnoringSafeArea(.all)
                    .opacity(drawingVM.showPreview ? 0.8:0)
            )
            .onTapGesture { withAnimation { drawingVM.showPreview = false } }
            .alert(isPresented: $imageSaver.showSavedAlert) {
                Alert(title: Text("Success"),
                      message: Text("Drawing saved successfully to the Photos Library"))
            }
            
            
            if drawingVM.showPreview {
                PreviewDrawing()
            }
        }
        
    }
    
    
}

//MARK: TitleView
extension HomeView {
    @ViewBuilder func titleView() -> some View {
        HStack {
            Text("SwiftUI Pen")
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .tracking(1)
            Image(systemName: "bird.fill")
                .font(.system(size: 28))
            
            Spacer()
            
            Button {
                drawingVM.saveSignature() { status in
                    if status {
                        guard let inputImage = drawingVM.drawingImage else { return }
                        imageSaver.writeToPhotoAlbum(image: inputImage)
                    }
                }
                
            } label: {
                Image(systemName: "tray.and.arrow.down.fill")
                    .font(.system(size: 25))
            }
            
            
        }
        .padding([.leading, .top, .trailing])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}

