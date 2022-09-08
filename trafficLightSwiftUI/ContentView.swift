//
//  ContentView.swift
//  trafficLightSwiftUI
//
//  Created by Дмитрий Дуров on 08.09.2022.
//

import SwiftUI

enum CurrentLight {
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State var redOpacity = 0.3
    @State var yellowOpacity = 0.3
    @State var greenOpacity = 0.3
    @State var currentLight: CurrentLight = .red
    @State var buttonTitle = "START"
    
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                trafficLight
                
                buttonSettings
                
                
            }
        }
    }
    
    private var trafficLight: some View {
        VStack {
            ColorCircleView(
                color: .init(.sRGB, red: 1, green: 0, blue: 0, opacity: redOpacity)
            )
            ColorCircleView(
                color: .init(.sRGB, red: 1, green: 1, blue: 0, opacity: yellowOpacity)
            )
            ColorCircleView(
                color: .init(.sRGB, red: 0, green: 1, blue: 0, opacity: greenOpacity)
            )
            Spacer()
        }
    }
    
    private var buttonSettings: some View {
        Button(action: { buttonAction() }) {
            Text(buttonTitle)
                .font(.title)
            
        }
        
        .foregroundColor(.white)
        .padding()
        .frame(width: 200, height: 40)
        .background(.blue)
        .cornerRadius(25)
//        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: 10).cornerRadius(19)
//        .border(.white, width: 5).cornerRadius(20)
        
        
        
    }
    
    
    private func buttonAction() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        buttonTitle = "NEXT"
        
        switch currentLight {
        case .red:
            redOpacity = lightIsOn
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOff
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            greenOpacity = lightIsOff
            currentLight = .green
        case .green:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

