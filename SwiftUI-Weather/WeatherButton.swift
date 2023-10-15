//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 15/10/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var completion: () -> Void
    var body: some View {
        Button {
            completion()
        } label : {
            Text("Change daytime")
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .clipShape(.buttonBorder)
        }
    }
}
