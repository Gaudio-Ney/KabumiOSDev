//
//  ProductModel.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 22/08/21.
//

import Foundation

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
