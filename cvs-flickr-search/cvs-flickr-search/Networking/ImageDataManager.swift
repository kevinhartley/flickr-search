//
//  ImageDataManager.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import Foundation

protocol ImageDataManageable {
    func search(from text: String) async throws -> [ImageData]
}

class ImageDataManager: ImageDataManageable {
    
    let endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func search(from text: String) async throws -> [ImageData] {
        guard let url = URL(string: endpoint.baseURLString + endpoint.imageSearchPath(from: text)) else {
            throw ImageDataError.invalidEndpoint
        }
        
        let response: ImageItems = try await load(from: url)
        
        return response.items
    }
}

extension ImageDataManager {
    func load<D: Decodable>(from url: URL) async throws -> D {
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
                200..<300 ~= httpResponse.statusCode else {
            throw ImageDataError.invalidResponse
        }
        
        return try JSONDecoder().decode(D.self, from: data)
    }
}
