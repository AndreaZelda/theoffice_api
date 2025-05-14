//
//  PantallaDetallesPersonaje.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

struct PantallaDetallesPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_personaje != nil){
            NavigationStack{
                ScrollView{
                    HStack{
                        Text("\(controlador.personaje?.name ?? "Nombrecito")")
                    }
                    HStack{
                        Text("\(controlador.personaje?.gender ?? "Generito")")
                        Text("\(controlador.personaje?.marital ?? "Enamorade")")
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaDetallesPersonaje()
        .environment(ControladorAplicacion())
}
