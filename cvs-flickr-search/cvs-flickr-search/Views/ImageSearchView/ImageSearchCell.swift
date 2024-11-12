//
//  ImageSearchCell.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import SwiftUI

struct ImageSearchCell: View {
    var imageData: ImageData
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageData.media.m)) { response in
                switch response {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    VStack {
                        Image(systemName: "questionmark")
                            .padding()
                            .aspectRatio(contentMode: .fit)
                    }
                @unknown default:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(width: width - 20, height: height - 20)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 15)
    }
}
