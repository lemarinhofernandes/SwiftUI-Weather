//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel(weatherService: WeatherService())
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray :  Color("lightblue"))
            VStack() {
                CityTextView(cityName: viewModel.weather?.location?.name)
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    ForEach(viewModel.forecastDays ?? [Forecastday](), id: \.date) { forecastday in
                        WeatherDayView(day: viewModel.getWeekDay(forecastday.date),
                                       image: viewModel.getIcon(forecastday.day?.condition?.text),
                                       degrees: forecastday.day?.avgtempC ?? 0)
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
            
        }.onAppear {
            viewModel.fetchForecast()
        }.environment(viewModel)
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
    var degrees: Double
    
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
            Text("\(String(format: "%.1f", degrees))°")
                .font(.system(size: 24, weight: .medium))
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
    var cityName: String?
    
    var body: some View {
        Text(cityName ?? String())
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(String(format: "%.1f",viewModel.weather?.current?.tempC ?? 0))°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
