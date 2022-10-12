//
//  ColorCircleView.swift
//  trafficLightSwiftUI
//
//  Created by Дмитрий Дуров on 08.09.2022.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct ColorCircleViewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ColorCircleView(color: .red, opacity: 1)
        }
    }
}
