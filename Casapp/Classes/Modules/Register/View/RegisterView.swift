//
//  RegisterView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterViewModel()
    @State var username: String = ""
    @State var password: String = ""
    @State private var navigateTo: String? = nil
    
    var body: some View {
        switch viewModel.currentState {
        case .SUCCESS:
            MainView()
        case .INITIAL:
            NavigationView {
                VStack {
                    NavigationLink(destination: LoginView(), tag: "showLogin", selection: $navigateTo) { }
                    NavigationLink(destination: MainView(), tag: "showMain", selection: $navigateTo) { }
                    
                    Spacer()

                    Text("Crea una nueva cuenta")
                        .font(.system(size: 30))
                        .bold()
                    
                    Image("img_register")
                        .resizable()
                        .frame(width: 360, height: 330)
                    
                    Spacer()
                    
                    Group {
                        Text("Email:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18, weight: .bold))
                            .padding(.horizontal)
                        
                        TextField("Introduce email", text: $username)
                            .autocapitalization(.none)
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
                    
                    Group {
                        HStack(spacing: 10) {
                            Button("Volver") {
                                navigateTo = "showLogin"
                            }
                            .frame(height: 45)
                            .buttonStyle(.bordered)
                            .frame(maxWidth: .infinity)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .font(Font.body.bold())
                            .clipShape(Capsule())
                            
                            Button("Confirmar") {
                                register(username: username, password: password)
                            
                                if viewModel.user != nil {
                                    navigateTo = "showMain"
                                }
                            }
                            .frame(height: 45)
                            .buttonStyle(.bordered)
                            .frame(maxWidth: .infinity)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .font(Font.body.bold())
                            .clipShape(Capsule())
                            .alert("Datos incorrectos", isPresented: $viewModel.registerError, actions: {})
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func register(username: String, password: String) {
        viewModel.signUp(email: username, password: password)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
