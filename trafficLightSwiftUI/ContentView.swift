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
    
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    @State private var currentLight: CurrentLight = .red
    
    @State private var buttonTitle = "START"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                trafficLight
            }
        }
    }
    
    private var trafficLight: some View {
        VStack(spacing: 20) {
            
            ColorCircleView(color: .red, opacity: redOpacity)
            
            ColorCircleView(color: .yellow, opacity: yellowOpacity)
            
            ColorCircleView(color: .green, opacity: greenOpacity)
            
            Spacer()
            
            StartButtonView(buttonTitle: buttonTitle) {
                if buttonTitle == "START" {
                    buttonTitle = "NEXT"
                }
                buttonAction()
            }
        }
        .padding()
    }
    
    private func buttonAction() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            redOpacity = lightIsOn
            greenOpacity = lightIsOff
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
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

