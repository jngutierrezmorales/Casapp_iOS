//
//  ContentView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Text("Casapp")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
