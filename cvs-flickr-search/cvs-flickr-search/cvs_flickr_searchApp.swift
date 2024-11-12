//
//  cvs_flickr_searchApp.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import SwiftUI

@main
struct cvs_flickr_searchApp: App {
    var body: some Scene {
        WindowGroup {
            ImageSearchView(viewModel: ImageSearchViewModel(imageDataManager: ImageDataManager(endpoint: ImageDataAPI())))
        }
    }
}
