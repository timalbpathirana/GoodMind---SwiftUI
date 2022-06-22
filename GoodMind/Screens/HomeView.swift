//
//  HomeView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

extension Text {
    func headerMod() -> some View {
        self
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.black)
    }
    func bodyMod() -> some View {
        self
            .font(.title3)
            .fontWeight(.regular)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        
    }
}

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isSettingsVisible: Bool = false
    @State private var isCreditssVisible: Bool = false

    @State var timeRemaining = 20
    
    var body: some View {
        
        VStack {
            ZStack{
                // 2 circles
                Circle()
                    .stroke(.black.opacity(0.1), lineWidth: 40)
                    .frame(width: 260, height: 260, alignment: .center)
                
                Circle()
                    .stroke(.black.opacity(0.2), lineWidth: 80)
                    .frame(width: 260, height: 260, alignment: .center)
                Image("Richie_4")
                    .resizable()
                    .scaledToFit()
                    .offset(x: 60)
                
            }//ZSTACK
            Spacer()
            Text("This time is good to take a little rest").headerMod()
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()

            
            HStack{
                Image(systemName: "timer")
                    .font(.system(size: 40))
                    .onTapGesture {
                        isSettingsVisible.toggle()

                    }
                    .sheet(isPresented: $isSettingsVisible, content: {
                        TimerView()
                    })
                Spacer()
                // Credit
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(size: 40))
                    .onTapGesture {
                        isCreditssVisible.toggle()

                    }
                    .fullScreenCover(isPresented: $isCreditssVisible, content: {
                       GestureView()
                    })
                    
            
            }
            .padding(.horizontal, 50)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
