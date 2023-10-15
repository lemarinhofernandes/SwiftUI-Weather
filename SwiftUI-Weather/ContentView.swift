//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:  Gradient(colors:  [.blue, Color("lightblue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            VStack() {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    ForEach(WeatherProvider.components, id: \.self) { component in
                        WeatherDayView(day: component.day.rawValue, image: component.image, degrees: component.degrees)
                    }
                }
                Spacer()
                Button {
                    print("tapped")
                } label : {
                    Text("Change daytime")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .clipShape(.buttonBorder)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: String
    var image: String
    var degrees: String
    var body: some View {
        VStack(spacing: 8) {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(degrees)
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
