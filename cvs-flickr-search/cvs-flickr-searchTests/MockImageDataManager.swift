//
//  MockImageDataManager.swift
//  cvs-flickr-searchTests
//
//  Created by Kevin Hartley on 11/12/24.
//

import Foundation
@testable import cvs_flickr_search

class MockImageDataManager: ImageDataManageable {
    
    var dummyImageData: [ImageData] = []
    
    func search(from text: String) async throws -> [ImageData] {
        if dummyImageData.isEmpty {
            return dummyImageData
        } else {
            throw ImageDataError.noData
        }
    }
}
