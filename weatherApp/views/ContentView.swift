//
//  ContentView.swift
//  weatherApp
//
//  Created by Cindy Bowers on 6/28/23.
//


import SwiftUI

struct ContentView: View {
	@StateObject var locationManager = LocationManager()
	var weatherManager = WeatherManager()
	@State var weather: ResponseBody?
	
    var body: some View {
		VStack{
			if let location = locationManager.location{
				if let weather = weather{
					WeatherView(weather: weather)
				}
				else{
					loadingView()
						.task {
							do{
								weather = try await weatherManager.getWeather(latitude: location.latitude, longitude: location.longitude)
							}
							catch{
								print("Could not fetch weather data")
							}
					}
				}
			}
			else{
				if locationManager.isLoading{
					loadingView()
				}
				else{
					welcomeView().environmentObject(locationManager)
				}
			}
        }
		.background(.black)
		.preferredColorScheme(.dark)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
