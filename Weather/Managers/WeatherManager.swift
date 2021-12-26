//
//  WeatherManager.swift
//  Weather
//
//  Created by David on 2021/12/26.
//

import Foundation
import CoreLocation

class WeatherManager {
  func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=4da7710f4fa40e27997ea7bc92eb4588&units=metric") else { fatalError("Missing URL") }
    
    let urlRequest = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
    
    let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
    return decodedData
  }
}
