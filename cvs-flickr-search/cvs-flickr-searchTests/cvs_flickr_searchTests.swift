//
//  cvs_flickr_searchTests.swift
//  cvs-flickr-searchTests
//
//  Created by Kevin Hartley on 11/12/24.
//

import XCTest
@testable import cvs_flickr_search

final class cvs_flickr_searchTests: XCTestCase {
    
    func testCanReceiveItems() async throws {
        let mockManager = MockImageDataManager()
        let dummyImageData = ImageData(title: "TestItem", link: "", media: Media(m: ""), date_taken: "", description: "", author: "")
        mockManager.dummyImageData = [dummyImageData]
        let response = try await mockManager.search(from: "test")
        
        XCTAssertEqual(dummyImageData.title, response.first?.title)
    }
}
