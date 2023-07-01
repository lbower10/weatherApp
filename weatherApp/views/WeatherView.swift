//
//  WeatherView.swift
//  weatherApp
//
//  Created by Cindy Bowers on 6/28/23.
//

import SwiftUI

struct WeatherView: View {
	var weather: ResponseBody
	
    var body: some View {
		ZStack(alignment: .leading){
			VStack{
				VStack(alignment: .leading, spacing: 5){
					Text(weather.name)
						.bold().font(.title)
					
					Text("Today, \(Date().formatted(.dateTime.month().day().hour()))")
						.fontWeight(.light)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				
				Spacer()
				
				VStack{
					HStack{
						VStack(spacing: 20){
							if weather.weather[0].main == "Clouds"{
								Image(systemName: "cloud.fill")
									.font(.system(size: 40))
							}
							else if weather.weather[0].main == "Rain" || weather.weather[0].main == "Drizzle"{
								Image(systemName: "cloud.rain.fill")
									.font(.system(size: 40))
							}
							else if weather.weather[0].main == "Snow"{
								Image(systemName: "cloud.snow.fill")
									.font(.system(size: 40))
							}
							else if weather.weather[0].main == "Thunderstorm"{
								Image(systemName: "cloud.bolt.fill")
									.font(.system(size: 40))
							}
							else if weather.weather[0].main == "Clear"{
								Image(systemName: "sun.max.fill")
									.font(.system(size: 40))
							}
							else{
								Image(systemName: "exclamationmark.triangle.fill")
									.font(.system(size: 40))
							}
							
							
							Text(weather.weather[0].main)
						}
						.frame(width: 125, alignment: .leading)
						
						Spacer()
						
						Text(weather.main.feelsLike.roundDouble() + "°")
							.font(.system(size: 45))
							.fontWeight(.bold)
							.padding()
					}
					
					//Spacer().frame(height: 40)
					
					// TODO: Maybe use an API to get image of the city
					// Would then display that here
					AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
						image
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 350)
					} placeholder: {
						ProgressView()
					}
					
					Spacer()
					
				}
				//.frame(maxWidth: .infinity)
			}
			.padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			
			VStack{
				Spacer()
				
				VStack(alignment: .leading, spacing: 20){
					Text("Current Weather Details")
						.bold().padding(.bottom).font(.title)
					// min and max temps
					HStack{
						WeatherRow(logo: "thermometer.snowflake", name: "Low", value: (weather.main.tempMin.roundDouble() + "°"))
						Spacer()
						
					}
					
					// high temp
					HStack{
						WeatherRow(logo: "thermometer.sun.fill", name: "High", value: (weather.main.tempMax.roundDouble() + "°"))
						Spacer()
					}
					
					// Humidity
					HStack{
						WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
						Spacer()
						
					}
					
					// Wind
					HStack{
						WeatherRow(logo: "wind", name: "Winds", value: (weather.wind.speed.roundDouble() + "m/s"))
						Spacer()
					}
					
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
				.padding(.bottom, 20)
				.foregroundColor(.black)
				.background(.gray)
				// extensions
				.cornerRadius(20, corners: [.topLeft, .topRight])
			}
			
		}
		.edgesIgnoringSafeArea(.bottom)
		.background(.blue)
		.preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
