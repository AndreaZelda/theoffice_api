//
//  TheOfficeApp.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

@main
struct TheOfficeApp: App {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
        }
    }
}
