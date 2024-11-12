//
//  ImageEndpoint.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import Foundation

protocol Endpoint {
    var baseURLString: String { get }
    func imageSearchPath(from query: String) -> String
}

class ImageDataAPI: Endpoint {
    var baseURLString: String {
        return "https://api.flickr.com/"
    }

    func imageSearchPath(from query: String) -> String {
        return "services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(query)/"
    }
}
