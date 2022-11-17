//
//  HomeView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            ForEach(0..<15) { i in
                Section {
                    Image("img_test")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            ZStack {
                                Text("COMPARTIR")
                                    .padding(8)
                                    .foregroundColor(.white)
                            }
                                .background(.black)
                                .opacity(0.9)
                                .cornerRadius(10.0)
                                .padding(8),
                            alignment: .bottomTrailing
                        )
                    
                    HStack {
                        Spacer()
                        
                        Label("Madrid", systemImage: "map.fill")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Label("99m", systemImage: "house.and.flag.fill")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Label("199.999", systemImage: "eurosign")
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                }
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.insetGrouped)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
