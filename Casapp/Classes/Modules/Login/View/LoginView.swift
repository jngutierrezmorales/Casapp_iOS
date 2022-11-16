//
//  LoginView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @State var username: String = "test@test.com"
    @State var password: String = "test123"
    @State private var navigateTo: String? = nil

    var body: some View {
        switch viewModel.currentState {
        case .SUCCESS:
            MainView()
        case .INITIAL:
            NavigationView {
                VStack {
                    NavigationLink(destination: RegisterView(), tag: "showRegister", selection: $navigateTo) { }
                    
                    Group {
                        Text("Casapp")
                            .font(.system(size: 72))
                            .bold()
                        
                        Spacer()
                        
                        Image("img_login")
                            .resizable()
                            .frame(width: 360, height: 360)
                        
                        Spacer()
                    }
                    
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
                    
                    Group {
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Button("Acceder") {
                                login(username: username, password: password)
                            }
                            .frame(height: 45)
                            .buttonStyle(.bordered)
                            .frame(maxWidth: .infinity)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .font(Font.body.bold())
                            .clipShape(Capsule())
                            .alert("Login incorrecto", isPresented: $viewModel.loginError, actions: {})
                            
                            Button("Crear usuario") {
                                navigateTo = "showRegister"
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
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func login(username: String, password: String) {
        viewModel.signIn(email: username, password: password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
