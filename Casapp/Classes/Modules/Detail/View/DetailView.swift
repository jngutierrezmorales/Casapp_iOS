//
//  DetailView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel = DetailViewModel()
    @State private var navigateTo: String? = nil
    @State private var isFavorite: Bool = false
    @State private var emailBody: String = ""
    @Binding var home: Home
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: MapView(), tag: "showMap", selection: $navigateTo) { }
                    
                    Group {
                        ZStack {
                            AsyncImage(url: URL(string: home.image ?? "img_test")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .overlay(
                                Button(action: {
                                    
                                }) {
                                    if isFavorite {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .frame(width: 25, height: 22)
                                            .foregroundColor(Color(.black))
                                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                                            .padding()
                                    } else {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 25, height: 22)
                                            .foregroundColor(Color(.black))
                                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                                            .padding()
                                    }
                                },
                                alignment: .topTrailing
                            )
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        
                        Text(home.title ?? "")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                    }
                    
                    Group {
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(home.state ?? "")
                                .padding()
                            
                            Image(systemName: "eurosign.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(home.price ?? "")
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("\(home.size ?? "") metros")
                                .padding()
                            
                            Image(systemName: "location.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(home.location ?? "")
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    }
                    
                    Group {
                        Divider()
                        
                        Text("Descripcion de la vivienda")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        
                        Text(home.description ?? "")
                            .padding()
                        
                        Divider()
                    }
                    
                    Group {
                        Text("Contactar por teléfono")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        
                        Button(home.phone ?? "") {
                            
                        }
                        .frame(height: 45)
                        .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity)
                        .background(Color(.black))
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        .clipShape(Capsule())
                        .padding(.horizontal)
                    }
                    
                    Group {
                        Spacer()
                        Divider()
                        
                        Text("Contactar por email")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        
                        TextField("Escribe aquí", text: $emailBody)
                            .padding(.horizontal)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Enviar mensaje") {
                            
                        }
                        .frame(height: 45)
                        .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity)
                        .background(Color(.black))
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        .clipShape(Capsule())
                        .padding(.horizontal)
                    }
                    
                    Group {
                        Spacer()
                        Divider()
                        
                        Text("Localización")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        
                        Button("Mostrar mapa") {
                            navigateTo = "showMap"
                        }
                        .frame(height: 45)
                        .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity)
                        .background(Color(.black))
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(maxHeight: .infinity)
                }
            }
        }
    }
}
