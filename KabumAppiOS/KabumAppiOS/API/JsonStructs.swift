//
//  JsonStructs.swift
//  Testes CommandLine
//
//  Created by Ricardo Venieris on 23/08/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Request: Codable {
    let produtos: [Produto]
    let flagBlackfriday: Int
    let sucesso: Bool

    enum CodingKeys: String, CodingKey {
        case produtos
        case flagBlackfriday = "flag_blackfriday"
        case sucesso
    }
}

// MARK: - Produto
struct Produto: Codable {
    let codigo: Int
    let img: String
    let nome: String
    let alt: Int
    let temFreteGratis, freteGratisSomentePrime: Bool
    let linkDescricao, precoAntigo, preco, precoPrime: String
    let precoDesconto, precoDescontoPrime, precoFormatado, precoPrimeFormatado: String
    let precoDescontoFormatado, precoDescontoPrimeFormatado: String
    let avaliacaoNumero, avaliacaoNota: Int
    let isOpenbox: Bool
    let fabricante: Fabricante
    let menu: String
    let disponibilidade: Bool
//    let oferta: Oferta
    let vendedorNome: String
    let offerID: OfferID
    let idSeller: Int
    let porcentagemDesconto: String

    enum CodingKeys: String, CodingKey {
        case codigo, img, nome, alt
        case temFreteGratis = "tem_frete_gratis"
        case freteGratisSomentePrime = "frete_gratis_somente_prime"
        case linkDescricao = "link_descricao"
        case precoAntigo = "preco_antigo"
        case preco
        case precoPrime = "preco_prime"
        case precoDesconto = "preco_desconto"
        case precoDescontoPrime = "preco_desconto_prime"
        case precoFormatado = "preco_formatado"
        case precoPrimeFormatado = "preco_prime_formatado"
        case precoDescontoFormatado = "preco_desconto_formatado"
        case precoDescontoPrimeFormatado = "preco_desconto_prime_formatado"
        case avaliacaoNumero = "avaliacao_numero"
        case avaliacaoNota = "avaliacao_nota"
        case isOpenbox = "is_openbox"
        case fabricante, menu, disponibilidade//, oferta
        case vendedorNome = "vendedor_nome"
        case offerID = "offer_id"
        case idSeller = "id_seller"
        case porcentagemDesconto = "porcentagem_desconto"
    }
}

// MARK: - Fabricante
struct Fabricante: Codable {
    let codigo: Int
    let nome: String
    let img: String
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


