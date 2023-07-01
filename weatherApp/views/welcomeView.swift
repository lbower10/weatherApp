//
//  welcomeView.swift
//  weatherApp
//
//  Created by Cindy Bowers on 6/28/23.
//

import SwiftUI
import CoreLocationUI

struct welcomeView: View {
	@EnvironmentObject var locationManager: LocationManager

    var body: some View {
		VStack{
			VStack(spacing: 20){
				Text("Welcome to the Weather App")
					.bold().font(.title)
				
				Text("Please share your location for weather in area")
					.padding()
			}
			
			.multilineTextAlignment(.center)
			.padding()
			
			LocationButton(.shareCurrentLocation){
				locationManager.requestLocation()
			}
			.cornerRadius(30)
			.symbolVariant(.fill)
			.foregroundColor(.white)
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
    }
}
