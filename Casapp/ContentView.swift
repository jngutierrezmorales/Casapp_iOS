//
//  ContentView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = "test@test.com"
    @State private var password: String = "test123"
    
    var body: some View {
        VStack {
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
                
                TextField("Usuario", text: $username)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                Text("Contraseña:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.horizontal)
                
                SecureField("Contraseña", text: $password)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                Button("Acceder") {
                    
                }
                .frame(height: 45)
                .buttonStyle(.bordered)
                .frame(maxWidth: .infinity)
                .background(Color(.black))
                .foregroundColor(.white)
                .font(Font.body.bold())
                .clipShape(Capsule())
                
                Button("Crear usuario") {
                    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
