//
//  DetailView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI
import MessageUI

struct DetailView: View {
    @ObservedObject private var viewModel = DetailViewModel()
    @State private var navigateTo: String? = nil
    @State private var isFavorite: Bool = false
    @State private var emailBody: String = ""
    @Binding var home: Home
    @State private var sendEmail = false
    let constants = Constants.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: MapView(), tag: "showMap", selection: $navigateTo) { }
                    
                    Group {
                        ZStack {
                            AsyncImage(url: URL(string: viewModel.home.image ?? "img_test")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .overlay(
                                Button(action: {
                                    if home.isFavorite ?? false {
                                        home.isFavorite = false
                                        
                                        viewModel.updateFavorite(home: viewModel.home, isFavorite: false)
                                    } else {
                                        home.isFavorite = true
                                        
                                        viewModel.updateFavorite(home: viewModel.home, isFavorite: true)
                                    }
                                }) {
                                    if home.isFavorite ?? false {
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
                        
                        Text(viewModel.home.title ?? "")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                    }
                    
                    Group {
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(viewModel.home.state ?? "")
                                .padding()
                            
                            Image(systemName: "eurosign.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(viewModel.home.price ?? "")
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("\(viewModel.home.size ?? "") metros")
                                .padding()
                            
                            Image(systemName: "location.square.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(viewModel.home.location ?? "")
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
                        
                        Text(viewModel.home.description ?? "")
                            .padding()
                        
                        Divider()
                    }
                    
                    Group {
                        Text("Contactar por teléfono")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                        
                        Button(viewModel.home.phone ?? "") {
                            
                        }
                        .frame(height: 45)
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
                        
                        HStack {
                            if MFMailComposeViewController.canSendMail() {
                                Button {
                                    sendEmail.toggle()
                                } label: {
                                    Text(constants.sendButtonText)
                                }
                                .frame(height: 45)
                                .frame(maxWidth: .infinity)
                                .background(Color(.black))
                                .foregroundColor(.white)
                                .font(Font.body.bold())
                                .clipShape(Capsule())
                                .padding(.horizontal)
                            } else {
                                Text(constants.noSupportText)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .sheet(isPresented: $sendEmail) {
                            MailView(content: constants.contentPreText, to: constants.email, subject: constants.subject)
                        }
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
        .onAppear {
            viewModel.fetchHomeDetail(homeId: home.homeId)
        }
    }
}
