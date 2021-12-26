//
//  WeatherView.swift
//  Weather
//
//  Created by David on 2021/12/26.
//

import SwiftUI

struct WeatherView: View {
  var weather: ResponseBody
  
  var body: some View {
    ZStack(alignment: .leading) {
      VStack {
        PlaceAndTimeView(weather: weather)
        
        Spacer()
        
        VStack {
          WeatherDataView(weather: weather)
          
          Spacer()
            .frame(height: 80)
          
          AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_1280.png")) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
          } placeholder: {
            ProgressView()
          }
          
          Spacer()
        }
        .frame(maxWidth: .infinity)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      
      VStack {
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {
          Text("Weather now")
            .bold()
            .padding(.bottom)
          
          HStack {
            WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
            Spacer()
            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
          }
          
          HStack {
            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
            Spacer()
            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 20)
        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .background(.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
      }
    }
    .edgesIgnoringSafeArea(.bottom)
    .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
    .preferredColorScheme(.dark)
  }
}

struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView(weather: previewWeather)
  }
}

struct PlaceAndTimeView: View {
  var weather: ResponseBody
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(weather.name)
        .bold()
        .font(.title)
      
      Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
        .fontWeight(.light)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct WeatherDataView: View {
  var weather: ResponseBody
  
  var body: some View {
    HStack {
      VStack(spacing: 20) {
        Image(systemName: "sun.max")
          .font(.system(size: 40))
        Text(weather.weather[0].main)
      }
      .frame(width: 150, alignment: .leading)
      
      Spacer()
      
      Text(weather.main.feelsLike
            .roundDouble() + "°")
        .font(.system(size: 100))
        .fontWeight(.bold)
        .padding()
    }
  }
}

struct WeatherRow: View {
  var logo: String
  var name: String
  var value: String
  
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: logo)
        .font(.title2)
        .frame(width: 20, height: 20)
        .padding()
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
        .cornerRadius(50)
      
      
      VStack(alignment: .leading, spacing: 8) {
        Text(name)
          .font(.caption)
        
        Text(value)
          .bold()
          .font(.title)
      }
    }
  }
}
