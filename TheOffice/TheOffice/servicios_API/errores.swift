//
//  errores.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

enum ErroresDeRed: Error{
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
