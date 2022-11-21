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
    @State var password: String = ""
    @State private var darkMode: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink(destination: LoginView(), tag: "showLogin", selection: $navigateTo) { }
                
                Group {
                    Image("img_profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Spacer()
                    
                    Text("Ajustes")
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    Toggle(isOn: $darkMode) {
                        Text("Modo oscuro deshabilitado")
                    }
                }
                
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                
                Group {
                    Text("Usuario")
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    Text("Cambiar contraseña:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 18))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    TextField("Escribe aqui", text: $password)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                    
                    Button("Modificar contraseña") {
                        
                    }
                    .frame(height: 45)
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                
                Group {
                    Text("Sesión")
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    HStack {
                        Text("Finalizar sesión")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                            .padding(.horizontal)
                        
                        Button("Cerrar sesión") {
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
                    
                    Spacer()
                    
                    Button("Mostrar token de notificación") {
                        print("Token de usuario: ")
                    }
                    .frame(height: 45)
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .font(Font.body.bold())
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    private func logout() -> Bool {
        return mainViewModel.signOut()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
        ProfileView()
            .environment(\.colorScheme, .dark)
    }
}
