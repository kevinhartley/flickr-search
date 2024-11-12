//
//  ImageSearchView.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import SwiftUI

struct ImageSearchView: View {
    
    @StateObject var viewModel: ImageSearchViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.imageData, id: \.self) { image in
                            NavigationLink(destination: {
                                ImageDetailView(imageData: image)
                            }) {
                                ImageSearchCell(imageData: image, height: 400, width: proxy.size.width)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .background(.sand)
                .searchable(text: $viewModel.searchText)
                .onSubmit(of: .search) {
                    viewModel.search(from: viewModel.searchText)
                }
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Image Search")
            }
        }
    }
}

#Preview {
    ImageSearchView(viewModel: ImageSearchViewModel(imageDataManager: ImageDataManager(endpoint: ImageDataAPI())))
}

