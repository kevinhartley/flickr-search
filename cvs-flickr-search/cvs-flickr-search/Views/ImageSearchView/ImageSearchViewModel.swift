//
//  ImageSearchViewModel.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import Foundation

@MainActor
class ImageSearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var imageData: [ImageData] = []
    @Published var isLoading: Bool = false
    @Published var error: ImageDataError?
    
    private let imageDataManager: ImageDataManageable
    
    init(imageDataManager: ImageDataManageable) {
        self.imageDataManager = imageDataManager
    }
    
    func search(from text: String) {
        self.isLoading = true
        Task {
            do {
                let response = try await imageDataManager.search(from: searchText)
                await MainActor.run {
                    self.imageData = response
                    self.isLoading = false
                }
            } catch {
                self.isLoading = false
                print(error)
                guard let imageError = error as? ImageDataError else {
                    self.error = .invalidResponse
                    return
                }
                self.error = imageError
            }
        }
    }
}
