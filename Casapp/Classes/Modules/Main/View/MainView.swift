//
//  MainView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel = MainViewModel()
    @State private var buttonPressed: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView(), tag: "showLogin", selection: $buttonPressed) { }
                
                Button("Logout") {
                    mainViewModel.signOut()
                    buttonPressed = "showLogin"
                }
                
                TabView {
                    Text()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
