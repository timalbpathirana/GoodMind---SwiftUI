//
//  CreditView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 20/6/2022.
//
import SwiftUI


struct CreditView: View {
    
    var body: some View {
        ZStack{
            Color("Blue")
                .ignoresSafeArea(.all, edges: .all)
            
            Circle()
                .stroke(.black.opacity(0.1), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(.black.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            Image("Credit")
                .resizable()
                .scaledToFit()
                .offset(x: 60)
                .padding(120)
            
            VStack{
                
                Text("Developed by ".uppercased())
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
                
                Text("Timal Pathirana")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                
                Text("Building amazing apps for amazing people 🚀✨")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
              

                }
                
               
        }
        
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
