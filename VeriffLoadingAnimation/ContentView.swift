//
//  ContentView.swift
//  VeriffLoadingAnimation
//
//  Created by Sajad Abedi on 13.03.2022.
//

import SwiftUI

struct Loading: View {
     
    @State var isAnimating: Bool = false
    let atlanticColor = Color(red: 0.004, green: 0.306, blue: 0.373) //#014E5F
    let persianColor = Color(red: 0, green: 0.706, blue: 0.667) // #00b4aa
    let brandHightlightColor = Color(red: 0.71, green: 0.949, blue: 0.89) // #b5f2e3
    let animationDuration: Double = 1
    let maxCounter = 3
    let frame: CGSize = CGSize(width: 80, height: 80)
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    
                    ZStack {
                        
                        Circle().fill(atlanticColor)
                            .frame(height: frame.height / 3.5)
                            .offset(x :0, y: isAnimating ? -frame.height / 3.5 : 0)
                        
                        Circle().fill(persianColor)
                            .frame(height: frame.height / 3.5)
                            .offset(x : isAnimating ? -frame.height / 3.5 : 0,
                                    y: isAnimating ? frame.height / 3.5 : 0)
                        
                        Circle().fill(brandHightlightColor)
                            .frame(height: frame.height / 3.5)
                            .offset(x : isAnimating ? frame.height / 3.5 : 0,
                                    y: isAnimating ? frame.height / 3.5 : 0)
                        
                    }
                    .animation(.easeInOut(duration: animationDuration)
                                .repeatForever(autoreverses: true), value: isAnimating)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(.easeInOut(duration: animationDuration)
                                .repeatForever(autoreverses: true), value: isAnimating)
                    .onAppear() {
                        isAnimating.toggle()
                    }
                    .accessibilityHint("Loading animation")
                }
                
                    
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment.center)
            
            Spacer() // Push to the bottom
            Group{
                Text("Powered by".uppercased())
                    .font(.footnote)
                    .tracking(1.5) +
                Text(" Veriff".uppercased()).font(.footnote).tracking(1.5).bold()
            }
            .opacity(0.3)
        }
        
        
    }
}


struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
