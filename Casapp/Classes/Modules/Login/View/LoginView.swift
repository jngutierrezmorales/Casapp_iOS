//
//  LoginView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct LoginView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var loginViewModel = LoginViewModel()
    @State var username: String = "test@test.com"
    @State var password: String = "test123"
    @State private var buttonPressed: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RegisterView(), tag: "showRegister", selection: $buttonPressed) { }
                NavigationLink(destination: MainView(), tag: "showMain", selection: $buttonPressed) { }
                
                Text("Casapp")
                    .font(.system(size: 72))
                    .bold()
                
                Spacer()
                
                Image("img_login")
                    .resizable()
                    .frame(width: 360, height: 360)
                
                Spacer()
                
                Group {
                    Text("Usuario:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.horizontal)
                    
                    TextField("Introduce email", text: $username)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                    
                    Text("Contraseña:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.horizontal)
                    
                    SecureField("Introduce contraseña", text: $password)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    Button("Acceder") {
                        loginViewModel.signIn(email: username, password: password)
                        buttonPressed = "showMain"
                    }
                    .frame(height: 45)
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .clipShape(Capsule())
                    
                    Button("Crear usuario") {
                        buttonPressed = "showRegister"
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
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
