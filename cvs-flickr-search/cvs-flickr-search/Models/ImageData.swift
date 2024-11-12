//
//  ImageData.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import Foundation

struct ImageItems: Codable {
    let items: [ImageData]
}

struct ImageData: Codable, Hashable {
    let title: String
    let link: String
    let media: Media
    let date_taken: String
    let description: String
    let author: String
}

struct Media: Codable, Hashable {
    let m: String
}
