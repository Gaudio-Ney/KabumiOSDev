//
//  RequestModel.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 23/08/21.
//

import Foundation

// MARK: - Welcome

/// Set the Request properties and its Coding Keys.
/// The reques API must hava a "produtos", a "flagBlackfriday" and "sucesso" parameters.
struct Request: Codable {
    let produtos: [Produto]
    let flagBlackfriday: Int
    let sucesso: Bool

    ///Translate the Json properties to the Swift variables.
    enum CodingKeys: String, CodingKey {
        case produtos
        case flagBlackfriday = "flag_blackfriday"
        case sucesso
    }
}


// MARK: - Oferta
struct Oferta: Codable {
    let codigo, di: String?
    let eventoCodigo, dataInicio, dataFim, quantidade: Int?
    let evento: String?
    let logar: Int?

    enum CodingKeys: String, CodingKey {
        case codigo, di
        case eventoCodigo = "evento_codigo"
        case dataInicio = "data_inicio"
        case dataFim = "data_fim"
        case quantidade, evento, logar
    }
}

enum Evento: String, Codable {
    case smartParty = "Smart Party"
    case techWeek = "Tech Week"
    case ultimate = "Ultimate"
}

enum OfferID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(OfferID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for OfferID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


