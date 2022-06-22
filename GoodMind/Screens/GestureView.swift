//
//  GustureView.swift
//  GoodMind
//
//  Created by Timal Pathirana on 20/6/2022.
//

import SwiftUI

struct GestureView: View {
    
    
    
    @State private var isAnimating:Bool = false
    @State private var isZommed:CGFloat = 1
    @State private var ImageOffSet: CGSize = .zero // Normal params - CGSize(width: 0, height: 0)
    @State private var isDrawerOpen: Bool = false
    
    
    let page : [PageData] = PageDataModel
    @State private var imageIndex: Int = 1
    
    
    
    
    func resetImageState() {
        return withAnimation(.spring()){
            isZommed = 1
            ImageOffSet = .zero
        }
    }

    func getCurrentImage() -> String {
        page[imageIndex - 1].image
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Color.clear
                
                // MARK: Image
                
                Image(getCurrentImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(color: .white, radius: 140, x: 50, y: 50)
                    .cornerRadius(10.0)
                    .opacity(isAnimating ? 1 : 0 ) // Adding animation
                    .scaleEffect(isZommed) // Adding zoom feature with Tap gesture, state var CGSize used
                    .offset(x: ImageOffSet.width, y: ImageOffSet.height) // Drag Gesture
                    .onTapGesture(count: 2, perform: {
                        if isZommed == 1 {
                            withAnimation(.spring()){
                                isZommed = 5
                            }
                            
                        } else {
                            resetImageState()
                            
                        }
                    })
                
                // MARK: Drag Gesture
                // Drag Gesture implementation
                // 1. User can drag and it automatically comes back to the normal size
                // 2. ImageScale is going back to normal if there are any chances, using .onEnded
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)){
                                    ImageOffSet = value.translation
                                }
                            })
                            .onEnded({ _ in
                                if isZommed <= 1 {
                                    resetImageState()
                                    
                                }
                            })
                        
                        
                    )
                // MARK: Magnifying Gesture
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)){
                                    if isZommed >= 1 && isZommed < 5 {
                                        isZommed = value
                                    } else if isZommed > 5 {
                                        isZommed = 5
                                    }
                                    else if isZommed < 1 {
                                        isZommed = 1
                                    }
                                    
                                }
                            })
                            .onEnded({_ in
                                withAnimation(.linear(duration: 1)){
                                    if isZommed > 5 {
                                        isZommed = 5
                                    } else if isZommed <= 1 {
                                        resetImageState()
                                    }
                                }
                            })
                        
                        
                    )
                
                
            }
            .navigationTitle("Zoom and Pinch")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 2.0)){
                    isAnimating = true
                }
            })
            .overlay(alignment: .topLeading, content: {
                InfoPanelView(ImageScale: isZommed, imageSize: ImageOffSet)
            }).padding()
            
            // MARK: Controlls
            // Controlls
                .overlay(alignment: .bottom, content: {
                    
                    Group{
                        HStack (spacing: 20){
                            // Scale down
                            Button(action: {
                                // action
                                withAnimation(.spring()){
                                    if isZommed > 1 {
                                        isZommed -= 1
                                    } else {
                                        resetImageState()
                                    }
                                    
                                }
                            }, label: {
                                ControlsView(icon: "minus.square")
                            })
                            // Reset
                            
                            Button(action: {
                                // action
                                withAnimation(.spring()){
                                    resetImageState()
                                }
                                
                            }, label: {
                                ControlsView(icon: "square")
                                
                            })
                            // Scale up
                            
                            Button(action: {
                                // action
                                withAnimation(.spring()){
                                    if isZommed < 5 {
                                        isZommed += 1
                                    } else if isZommed > 5 {
                                        isZommed = 5
                                    }
                                    
                                }
                            }, label: {
                                ControlsView(icon: "plus.square")
                            })
                        }// HStack end
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .opacity(isAnimating ? 1 : 0)
                        
                        
                    }// End Controls
                    
                })
                .padding()
            // MARK: Drawer
            
            
                .overlay(
                    HStack (spacing: 12){
                        
                        //MARK: Handel
                        Image(systemName: isDrawerOpen ?  "chevron.compact.right" : "chevron.compact.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .padding(5)
                            .foregroundColor(.secondary)
                            .onTapGesture(perform: {
                                withAnimation(.easeOut){
                                    isDrawerOpen.toggle()
                                }
                                
                                
                            })
                        
                        
                        ForEach (page) { pageItem in
                            Image(pageItem.image)
                                .resizable()
                                .cornerRadius(10)
                                .scaledToFit()
                                .frame(height: 70)
                                .onTapGesture(perform: {
                                    // action
                                    imageIndex = pageItem.id
                                    
                                })
                                
                        }
                        
                        //MARK: Thumbnails
                        Spacer()
                        Text("")
                        
                        
                    }// Drawer end
                        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                        .background(.ultraThinMaterial)
                        .frame(width: 230)
                        .cornerRadius(15)
                        .padding(.top)
                        .offset(x: isDrawerOpen ? 20 : 200)
                    , alignment: .topTrailing
                    
                        
                
                
                
                
                )
                
            
        }
        .navigationViewStyle(.stack)
        
    }
}

struct GustureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
            .preferredColorScheme(.light)
    }
}
