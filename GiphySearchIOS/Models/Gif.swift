//
//  Gif.swift
//  GiphySearchIOS
//
//  Created by Anika Morris on 6/7/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

/// Array of Gif objects.
struct GifArray: Decodable {
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}
/// Contains gif properties
struct Gif: Decodable {
    var gifSources: GifImages
    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
    }
    /// Returns download url of the originial gif
    func getGifURL() -> String{
        return gifSources.original.url
    }
}
/// Stores the original gif
struct GifImages: Decodable {
    var original: original
    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}
/// URL to data of gif
struct original: Decodable {
    var url: String
}
