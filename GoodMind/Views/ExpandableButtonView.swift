//
//  ExpandableButtonView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 21/6/2022.
//

import SwiftUI

extension Image {
    func buttonIconMod() -> some View {
        self
            .foregroundColor(.white)
    }
}



struct ExpandableButtonView: View {
    
    let secondaryButton: [ExpandableButtonItem]
    @State var isExpanded: Bool = false
    
    // Defining button sizes
    let buttonSize:CGFloat = 60.0
    var buttonRadius:CGFloat {
        get {
            buttonSize / 2
        }
    }
    
    var body: some View {
        HStack {
            
            if isExpanded {
                ForEach(secondaryButton) { button in
                    Button(action: {
                        //action
                        button.action
                        
                    }, label: {
                        withAnimation(.linear(duration: 2)){
                            button.itemImage.buttonIconMod()
                        }
                        
                    })
                    .frame(width: buttonSize, height: buttonSize)
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .cornerRadius(buttonRadius)
                    .shadow(radius: 5)
                }
            }
            Image(systemName: "plus")
                .padding()
                .onTapGesture {
                    withAnimation(.spring()){
                        isExpanded.toggle()
                    }
                    
                }
            
        }// END Zstack
        .background(Color.purple)
        .opacity(0.8)
        .cornerRadius(buttonRadius)
        .shadow(radius: 5)
    }
}



struct ExpandableButtonItem: Identifiable {
    let id = UUID()
    let itemImage: Image
    var imageName: String
    var index: Int = 1
    var action: String {
        get {
            imageName
        }
    }
    
    mutating func setImageName (name: String){
        imageName = name
    }
    
}



struct ExpandableButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableButtonView(secondaryButton: [ExpandableButtonItem(itemImage: Image(systemName: "person"), imageName: "nature1")])
    }
}
