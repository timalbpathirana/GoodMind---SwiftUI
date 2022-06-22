//
//  ControlsView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 21/6/2022.
//

import SwiftUI

struct ControlsView: View {
    
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 30))
            .foregroundColor(.accentColor)
        
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(icon: "person").viewModify()
    }
}
