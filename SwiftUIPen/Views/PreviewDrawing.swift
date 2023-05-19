//
//  PreviewDrawing.swift
//  SwiftUIPen
//
//  Created by Muhammad Suleman on 19/05/2023.
//

import SwiftUI

struct PreviewDrawing: View {
    
    @EnvironmentObject var drawingVM: DrawingVM
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Preview")
                .font(.largeTitle)
                .foregroundStyle(LinearGradient(colors: [.purple, .pink, .red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.top)
            
            Image(uiImage: drawingVM.drawingImage ?? UIImage(systemName: "person")!)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 2))
          
            HStack {
                Spacer()
                Button {
                    withAnimation(Animation.easeInOut) { drawingVM.showPreview.toggle() }
                } label: {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                        Text("Close")
                            .font(.title2)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .padding(.bottom)
                }
                Spacer()
            }
        }
        .frame(height: fullHeight/1.5)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 32)
    }
}


struct PreviewDrawing_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDrawing()
    }
}
