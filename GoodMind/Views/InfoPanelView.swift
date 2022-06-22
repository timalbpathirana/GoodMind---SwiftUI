//
//  InfoPanelView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 21/6/2022.
//

import SwiftUI

extension View {
    func viewModify() -> some View {
        self
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
        .padding()
    }
}

struct InfoPanelView: View {
    
    var ImageScale: CGFloat
    var imageSize: CGSize
    @State private var isInfoViewVisible: Bool = false
    
    
    
    var body: some View {
        HStack{
            // Hotspot
            
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoViewVisible.toggle()
                    }
                }
            
            Spacer()
        
            // Iinfo panel
            HStack (spacing: 3){
                Image(systemName: "dot.arrowtriangles.up.right.down.left.circle")
                Text("\(ImageScale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right.circle")
                Text("\(imageSize.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down.circle")
                Text("\(imageSize.height)")
                
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .frame(maxWidth: 420)
            .opacity(isInfoViewVisible ? 1 : 0)
            
            
            Spacer()
            
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(ImageScale: 1.0, imageSize: .zero).viewModify()
    }
}
