//
//  MapView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        NavigationView {
            Text("Mapa")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
