//
//  ContentView.swift
//  Weather
//
//  Created by David on 2021/12/26.
//

import SwiftUI

struct ContentView: View {
  @StateObject var locationManager = LocationManager()
  
  var body: some View {
    if let location = locationManager.location {
      Text("Your coordinates are: \(location.longitude), \(location.latitude)")
    } else {
      if locationManager.isLoading {
        ProgressView()
      } else {
        WelcomeView()
          .environmentObject(locationManager)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
