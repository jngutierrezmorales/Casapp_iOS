//
//  ProfileView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var mainViewModel = ProfileViewModel()
    @State private var navigateTo: String? = nil
    
    var body: some View {
            VStack {
                NavigationLink(destination: LoginView(), tag: "showLogin", selection: $navigateTo) { }
                
                Button("Logout") {
                    if logout() {
                        navigateTo = "showLogin"
                    }
                }
                .frame(height: 45)
                .buttonStyle(.bordered)
                .frame(maxWidth: .infinity)
                .background(Color(.black))
                .foregroundColor(.white)
                .font(Font.body.bold())
                .clipShape(Capsule())
            }
            .padding(.horizontal)
    }
    
    private func logout() -> Bool {
        return mainViewModel.signOut()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
