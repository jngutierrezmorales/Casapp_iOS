//
//  PublishView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct PublishView: View {
    @ObservedObject private var viewModel = PublishViewModel()
    @State private var title: String = "Titulo"
    @State private var description: String = "Descripcion"
    @State private var price: String = "199.555"
    @State private var size: String = "99"
    @State private var location: String = "Madrid"
    @State private var phone: String = "693 323 323"
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Publicar un nuevo anuncio")
                    .font(.system(size: 26, weight: .bold))
                    .padding()
                
                Spacer()
                
                TextField("Titulo", text: $title)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                TextField("Descripción", text: $description)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                TextField("Precio", text: $price)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
            }
            
            Group {
                Spacer()
                
                TextField("Tamaño", text: $size)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                TextField("Localización", text: $location)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                TextField("Teléfono", text: $phone)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
            }
            
            HStack(spacing: 10) {
                Button("Guardar") {
                    
                }
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(.red))
                .foregroundColor(.black)
                .font(Font.body.bold())
                .clipShape(Capsule())
                
                Button("Publicar") {
                    viewModel.publishHome(homeDto: HomeDto(
                        homeId: "test",
                        title: title,
                        description: description,
                        imageUrl: "",
                        price: price,
                        size: size,
                        location: location,
                        latitude: 0.0,
                        longitude: 0.0,
                        phone: phone,
                        homeState: "Nuevo",
                        userId: "",
                        owner: "",
                        publishTime: "",
                        isPublished: true,
                        isFavorite: false
                    ))
                }
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(.green))
                .foregroundColor(.black)
                .font(Font.body.bold())
                .clipShape(Capsule())
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image("img_publish")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

struct PublishView_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
    }
}
