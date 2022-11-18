//
//  HomeView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var navigateTo: String? = nil
    
    var body: some View {
        NavigationView {
            List(viewModel.homes, id: \.homeId) { home in
                    Section {
                        Image("img_test")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .overlay(
                                ZStack {
                                    Text(home.homeState ?? "")
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
                            Label(home.location ?? "", systemImage: "map.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 12))

                            Label(("\(home.size ?? "")m"), systemImage: "house.and.flag.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                            
                            Label("199.999", systemImage: "eurosign")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(.insetGrouped)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
