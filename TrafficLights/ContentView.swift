//
//  ContentView.swift
//  TrafficLights
//
//  Created by Дмитрий Бессонов on 16.02.2022.
//

import SwiftUI



struct ContentView: View {
    @State private var buttonLabel = "Start"
    
    @State private var redOpacity = 0.5
    @State private var yellowOpacity = 0.5
    @State private var greenOpacity = 0.5
    
    @State private var currentLight = "Red"
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
        switch currentLight {
        case "Red":
            redOpacity = 1
            yellowOpacity = 0.5
            greenOpacity = 0.5
            currentLight = "Yellow"
        case "Yellow":
            redOpacity = 0.5
            yellowOpacity = 1
            greenOpacity = 0.5
            currentLight = "Green"
        case "Green":
            redOpacity = 0.5
            yellowOpacity = 0.5
            greenOpacity = 1
            currentLight = "nil"
        case "nil":
            redOpacity = 0.5
            yellowOpacity = 0.5
            greenOpacity = 0.5
            currentLight = "Red"
            buttonLabel = "Start"
        default:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
