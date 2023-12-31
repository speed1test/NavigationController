//
//  ContentView.swift
//  NavigationController
//
//  Created by elsalvador on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView()) {
                    Text("Ir a la siguiente vista")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Vista Principal")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://images.alphacoders.com/121/1218911.jpg")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .frame(width: 300, height: 300) // Ajusta el tamaño según tus preferencias
                case .failure:
                    Image(systemName: "exclamationmark.icloud")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .frame(width: 200, height: 200) // Ajusta el tamaño según tus preferencias
                @unknown default:
                    EmptyView()
                }
            }
            
            Text("Detalles de la siguiente vista")
                .padding()
        }
        .navigationTitle("Detalles")
    }
}

#Preview {
    ContentView()
}
