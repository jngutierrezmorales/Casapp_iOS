//
//  MainView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favoritos")
                }
            
            AdsView()
                .tabItem {
                    Image(systemName: "note.text.badge.plus")
                    Text("Anuncios")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
