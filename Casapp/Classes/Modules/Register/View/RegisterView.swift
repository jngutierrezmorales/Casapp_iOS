//
//  RegisterView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerViewModel = RegisterViewModel()
    @State var username: String = ""
    @State var password: String = ""
    @State private var buttonPressed: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView(), tag: "showLogin", selection: $buttonPressed) { }
                NavigationLink(destination: MainView(), tag: "showMain", selection: $buttonPressed) { }
                
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
                            buttonPressed = "showLogin"
                        }
                        .frame(height: 45)
                        .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity)
                        .background(Color(.black))
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        .clipShape(Capsule())
                        
                        Button("Crear usuario") {
                            registerViewModel.signUp(email: username, password: password)
                            buttonPressed = "showMain"
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
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
