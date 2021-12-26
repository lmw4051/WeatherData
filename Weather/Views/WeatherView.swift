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
