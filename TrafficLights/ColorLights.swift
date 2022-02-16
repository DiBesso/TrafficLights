//
//  RedLight.swift
//  TrafficLights
//
//  Created by Дмитрий Бессонов on 16.02.2022.
//

import SwiftUI

struct ColorLights: View {
    let opacity: Double
    let color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white,lineWidth: 5))
            .opacity(opacity)
    }
}

struct RedLight_Previews: PreviewProvider {
    static var previews: some View {
        ColorLights(opacity: 0.5, color: .red)
    }
}
