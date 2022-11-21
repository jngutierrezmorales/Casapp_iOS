//
//  AdsView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct AdsView: View {
    @ObservedObject private var viewModel = AdsViewModel()
    @State private var navigateTo: String? = nil
    
    var body: some View {
        NavigationView {
            List(viewModel.ads, id: \.homeId) { home in
                    Section {
                        AsyncImage(url: URL(string: home.image ?? "img_test")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 160)
                        .overlay(
                            ZStack {
                                Text(home.state ?? "")
                                    .padding(8)
                                    .foregroundColor(.white)
                            }
                                .background(.black)
                                .opacity(0.9)
                                .cornerRadius(10.0)
                                .padding(8),
                            alignment: .bottomTrailing
                        )

                        HStack {
                            Label(home.location ?? "", systemImage: "map.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 12))

                            Label(("\(home.size ?? "")m"), systemImage: "house.and.flag.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                            
                            Label("199.999", systemImage: "eurosign")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(.insetGrouped)
        }
    }
}

struct AdsView_Previews: PreviewProvider {
    static var previews: some View {
        AdsView()
    }
}
