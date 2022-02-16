//
//  YellowLight.swift
//  TrafficLights
//
//  Created by Дмитрий Бессонов on 16.02.2022.
//

import SwiftUI

struct YellowLight: View {
    var body: some View {
        Circle()
            .foregroundColor(.yellow)
            .frame(width: 150, height: 150)
            .overlay(Circle().stroke(Color.white,lineWidth: 5))
//            .opacity(0.5)
    }
}

struct YellowLight_Previews: PreviewProvider {
    static var previews: some View {
        YellowLight()
    }
}
