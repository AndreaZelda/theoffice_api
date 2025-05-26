//
//  home.swift
//  TheOffice
//
//  Created by alumno on 5/21/25.
//

import Foundation
import SwiftUI

struct PantallaInicio: View {
    var body: some View {
        ZStack {
            // Fondo
            Image("fondotheoffice")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.7))

            VStack(spacing: 30) {
                Spacer()

                Text("Bienvenido a")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Image("logo_theoffice")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)

                Text("Conoce a los personajes de Dunder Mifflin,\ny un poco más sobre la serie.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                Spacer()

                VStack {
                    Text("Comienza a navegar")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Image(systemName: "arrow.down")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                }
                .padding(.bottom, 40)
            }
            .padding()
        }
    }
}

#Preview {
    PantallaInicio()
}
