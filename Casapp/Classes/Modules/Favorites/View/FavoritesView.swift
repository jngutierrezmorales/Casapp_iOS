//
//  FavoritesView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var viewModel = FavoritesViewModel()
    @State private var navigateTo: String? = nil
    @State private var home: Home = Home()
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: DetailView(home: self.$home), tag: "showDetail", selection: $navigateTo) { }
                
                NavigationView {
                    List(viewModel.favorites, id: \.homeId) { home in
                        Section {
                            AsyncImage(url: URL(string: home.image ?? "img_test")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 160)
                            .overlay(
                                ZStack {
                                    Text(home.state ?? "")
                                        .padding(8)
                                        .font(Font.body.bold())
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
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.home = home
                            navigateTo = "showDetail"
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .listStyle(.insetGrouped)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
