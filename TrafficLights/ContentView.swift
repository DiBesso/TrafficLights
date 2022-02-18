//
//  ContentView.swift
//  TrafficLights
//
//  Created by Дмитрий Бессонов on 16.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green, `nil`
}

struct ContentView: View {
    @State private var buttonLabel = "Start"
    
    @State private var redOpacity = 0.5
    @State private var yellowOpacity = 0.5
    @State private var greenOpacity = 0.5
    
    @State private var currentLight = CurrentLight.red
    
    var body: some View {

        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                ColorLights(opacity: redOpacity, color: .red)
                    .padding(.bottom)
                ColorLights(opacity: yellowOpacity, color: .yellow)
                    .padding(.bottom)
                ColorLights(opacity: greenOpacity, color: .green)
                
                Spacer()
                
                Button(action: {
                    buttonLabel = "Next"
                    buttonAction()
                }) {
                    Text (buttonLabel)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 70)
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 5))
                            )
                }
            }
        }
    }

    private func buttonAction () {
        let lightIsOn: Double = 1
        let lightIsOff: Double = 0.5
        
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
            currentLight = .nil
        case .nil:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOff
            currentLight = .red
            buttonLabel = "Start"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
