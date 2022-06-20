//
//  ImageSyncView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 20/6/2022.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 120)
            .foregroundColor(.accentColor)
            .opacity(0.5)
    }
}



struct ImageSyncView: View {
    private var imageUrl: String = "https://credo.academy/credo-academy@3x.png"

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { AsyncImagePhase in
                // Success phase
                // Fail phase
                // No image loading
                switch AsyncImagePhase {
                case.success(let image):
                    image.imageModifier()
                       // .transition(.move(edge: .bottom))
                        .transition(.scale)
                case.failure(_):
                    Image(systemName: "ant.circle.fill").iconModifier()
                case.empty:
                    Image(systemName: "photo.circle.fill").iconModifier()
                @unknown default:
                    ProgressView("Loading...")
                }
            }
            .padding(40)
        }
    }
}

struct ImageSyncView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSyncView()
    }
}
