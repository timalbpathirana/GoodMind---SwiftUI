//
//  TimerView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 20/6/2022.
//

import SwiftUI

struct TimerView: View {
    
    @State var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
            Image("Richie_3")
                .resizable()
                .scaledToFit()
                .offset(x: 60)
            VStack{
                Text("Hello There".uppercased())
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Text("Here is a little timer for you")
                    .foregroundColor(.white)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                
                        Text("\(timeRemaining)")
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 100))
                            .padding(.vertical, 50)
                
                                
            }
            

        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
