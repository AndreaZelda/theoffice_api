//
//  PantallaDetallesPersonaje.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

let personaje_falso = Oficinista(id: 55, name: "Michael", gender: "Male", marital: "Holly", job: nil, workplace: nil, firstAppearance: "Pilot", lastAppearance: "Goodbye Michael", actor: "Steve Carrell", episodes: nil)

struct PantallaDetallesPersonaje: View {
    let personaje: Oficinista
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_personaje != nil){
            NavigationStack{
                ScrollView{
                    HStack{
                        Text("\(personaje.name ?? "Nombrecito")")
                    }
                    Text("Genero: \(personaje.gender ?? "N/A")")
                    Text("Pareja: \(personaje.marital ?? "Soltero")")
                    Image(imagenes_The_Office[personaje.id] ?? "1_Andy")
                    
                    if let trabajos = personaje.job {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Trabajos:")
                                .bold()
                            ForEach(trabajos, id: \.self) { trabajo in
                                Text("• \(trabajo)")
                            }
                        }
                        .padding(.top)
                    }

                    if let lugares = personaje.workplace {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Lugares de trabajo:")
                                .bold()
                            ForEach(lugares, id: \.self) { lugar in
                                Text("• \(lugar)")
                            }
                        }
                        .padding(.top)
                    }
                    Text("Primera aparición: \(personaje.firstAppearance ?? "Desconocida")")
                    Text("Última aparición: \(personaje.lastAppearance ?? "Desconocida")")
                    Text("Actor: \(personaje.actor ?? "Desconocid@")")


                }
            }
        }
    }
}

#Preview {
    PantallaDetallesPersonaje(personaje: personaje_falso)
        .environment(ControladorAplicacion())
}
