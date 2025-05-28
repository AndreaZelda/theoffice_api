//
//  AppTheOffice.swift
//  TheOffice
//
//  Created by alumno on 5/28/25.
//

import Foundation
import SwiftUI

struct Navegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView {
            NavigationStack {
                PantallaInicio()
            }
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("Inicio", systemImage: "house.fill")
            }
            
            NavigationStack {
                Personajes()
            }
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("Personajes", systemImage: "person.2.fill")
            }
            
            NavigationStack {
                Episodios()
            }
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("Episodios", systemImage: "play.tv.fill")
            }
            
            NavigationStack {
                Temporadas()
            }
            .toolbarBackground(.visible, for: .tabBar)
            
            .tabItem {
                Label("Temporadas", systemImage: "play.square.stack.fill")
            }
        }
        .accentColor(Color("CafeOscuro"))
        
        
    }
}

#Preview {
    Navegacion()
        .environment(ControladorAplicacion())
}

