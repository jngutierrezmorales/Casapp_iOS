//
//  SplashView.swift
//  Casapp
//
//  Created by Juan Gutierrez on 10/11/22.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject private var viewModel = SplashViewModel()
    @State private var user = false
    @State private var size = 0.7
    @State private var opacity = 0.5
    
    var body: some View {
        switch viewModel.currentState {
        case .SUCCESS:
            if user {
                MainView()
            } else {
                LoginView()
            }
        case .LOADING:
            ZStack {
                Color.blue
                    .ignoresSafeArea()

                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 250))
                        .foregroundColor(.white)

                    Text("Casapp")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.white)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        user = viewModel.getUser()
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
