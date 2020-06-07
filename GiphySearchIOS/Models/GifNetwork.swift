//
//  GifNetwork.swift
//  GiphySearchIOS
//
//  Created by Anika Morris on 6/7/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

class GifNetwork {
    let apiKey = "XP6xYxxMMKhGZsqMOU7vyWGol1lE2LUs"
    /**
    Fetches gifs from the Giphy api
    -Parameter searchTerm: What  we should query gifs of.
    -Returns: Optional array of gifs
    */
    func fetchGifs(searchTerm: String, completion: @escaping (_ response: GifArray?) -> Void) {
        // Create a GET url request
        let url = urlBuilder(searchTerm: searchTerm)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print("Error fetching from Giphy: ", err.localizedDescription)
            }
            do {
                // Decode the data into array of Gifs
                DispatchQueue.main.async {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
        }.resume()
    }
    
    /**
    Returns a url with our API key and search term
    - Parameter searchTerm: The string to search gifs of
    - Returns: URL of search term & api key
    */
    func urlBuilder(searchTerm: String) -> URL {
        let apikey = apiKey
        var components = URLComponents()
           components.scheme = "https"
           components.host = "api.giphy.com"
           components.path = "/v1/gifs/search"
           components.queryItems = [
               URLQueryItem(name: "api_key", value: apikey),
               URLQueryItem(name: "q", value: searchTerm),
               URLQueryItem(name: "limit", value: "5") // Edit limit to display more gifs
           ]
        return components.url!
    }
}
