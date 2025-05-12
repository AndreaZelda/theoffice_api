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
        Text("Holaaaa desde detalles")
    }
}

#Preview {
    PantallaDetallesPersonaje()
        .environment(ControladorAplicacion())
}
