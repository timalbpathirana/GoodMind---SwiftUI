//
//  OnboardingView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 20/6/2022.
//

import SwiftUI


extension Text {
    func headerModifier() -> some View {
        self
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
    func bodyModifier() -> some View {
        self
            .font(.title3)
            .fontWeight(.regular)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
    }
}


struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    
    var body: some View {
        ZStack {
            Color("Blue")
                .ignoresSafeArea(.all, edges: .all)
            VStack (spacing: 20) {
                // Header
                Spacer()
                VStack{
                    Text("Hello".uppercased()).headerModifier()
                    Text("""
                        This is bunch of bulshit
                        """).bodyModifier()
                       
                }//VSTACK Header
                ZStack{
                    
                    Circle()
                        .stroke(.white.opacity(0.2), lineWidth: 40)
                        .frame(width: 260, height: 260, alignment: .center)
                    Circle()
                        .stroke(.white.opacity(0.2), lineWidth: 80)
                        .frame(width: 240, height: 240, alignment: .center)
                    Image("Richie_1")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 80)
                }//ZSTACK CENTRE
                
                Spacer()
                
                // Footer
                ZStack{
                    
                    Button(action: {
                        
                        isOnboardingViewActive = false
                    }, label: {
                        Text("Next".uppercased())
                            .font(.system(size: 40))
                            .frame(height: 40, alignment: .center)
                            .padding()
                            .background(Color("Red"))
                            .cornerRadius(20)
                        
                    })

                    
                        
                    
                }// END FOODTER
                .foregroundColor(.white)
                .padding()
                
               
                
            }//VSTACK
        }//ZSTACK
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
