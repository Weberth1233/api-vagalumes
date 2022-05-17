//
//  Noticias.swift
//  Api-Vagalumes
//
//  Created by pat002900 on 17/05/22.
//

import Foundation
// MARK: - Welcome

struct Welcome: Codable {
    let news: [News]
}

// MARK: - News
struct News: Codable {
    let id, headline, kicker, featured: String
    let url: String
    let inserted, modified, picSrc, picWidth: String
    let picHeight, picCaption: String
    let images, tags: [String]

    enum CodingKeys: String, CodingKey {
        case id, headline, kicker, featured, url, inserted, modified
        case picSrc = "pic_src"
        case picWidth = "pic_width"
        case picHeight = "pic_height"
        case picCaption = "pic_caption"
        case images, tags
    }
}
