//
//  ModelData.swift
//  Weather
//
//  Created by David on 2021/12/26.
//

import Foundation

var previewWeather: ResponseBody = load("GET_Weather_ValidResponse.json")

func load<T: Decodable>(_ fileName: String) -> T {
  let data: Data
  
  guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
    fatalError("Couldn't find \(fileName) in main bundle.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't find \(fileName) in main bundle.")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
  }
}
