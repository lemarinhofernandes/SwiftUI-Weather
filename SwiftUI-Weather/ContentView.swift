//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray :  Color("lightblue"))
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      degrees: 76)
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    ForEach(WeatherProvider.components, id: \.self) { component in
                        WeatherDayView(day: component.day.rawValue,
                                       image: component.image,
                                       degrees: component.degrees)
                    }
                }
                Spacer()
                WeatherButton(title: "Change day time",
                              textColor: .blue,
                              backgroundColor: .white) {
                    isNight.toggle()
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
    var degrees: Int
    
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
            Text("\(degrees)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient:  Gradient(colors:  [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var degrees: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(degrees)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
