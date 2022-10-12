//
//  ButtonUIView.swift
//  trafficLightSwiftUI
//
//  Created by Дмитрий Дуров on 11.09.2022.
//

import SwiftUI
struct StartButtonView: View {
    var buttonTitle: String
    var action: () -> Void
   
    var body: some View {
            Button(action: action) {
                Text(buttonTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 4)
            )
    }
}

struct StartButtonUIView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(buttonTitle: "START", action: {print("START")})
    }
}
