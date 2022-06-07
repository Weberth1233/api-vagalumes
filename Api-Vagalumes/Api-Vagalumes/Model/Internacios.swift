//
//  Internacios.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 24/05/22.
//

import Foundation
struct Internacioais: Decodable {
  let count: Int
  let all: [Welcome]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
