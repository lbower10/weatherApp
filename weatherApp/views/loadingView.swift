//
//  loadingView.swift
//  weatherApp
//
//  Created by Cindy Bowers on 6/28/23.
//

import SwiftUI

struct loadingView: View {
    var body: some View {
		ProgressView().progressViewStyle(CircularProgressViewStyle(tint:.black))
			.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct loadingView_Previews: PreviewProvider {
    static var previews: some View {
        loadingView()
    }
}
