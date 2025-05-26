//
//  aplicacion_theoffice.swift
//  TheOffice
//
//  Created by alumno on 5/26/25.
//

import Foundation
import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            
            PantallaInicio()
                .tabItem { Label("Inicio", systemImage: "house.fill") }
            
            Personajes()
                .tabItem { Label("Personajes", systemImage: "person.2.fill") }
            
            Episodios()
                .tabItem { Label("Episodios", systemImage: "play.tv.fill") }
            
            Temporadas()
                .tabItem { Label("Temporadas", systemImage: "play.square.stack.fill") }
            
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}

