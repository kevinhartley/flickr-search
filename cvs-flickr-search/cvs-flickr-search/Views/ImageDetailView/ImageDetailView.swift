//
//  ImageDetailView.swift
//  cvs-flickr-search
//
//  Created by Kevin Hartley on 11/12/24.
//

import SwiftUI

struct ImageDetailView: View {
    
    var imageData: ImageData
    
    var body: some View {
        ScrollView {
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
                            .padding([.leading, .trailing])
                            .aspectRatio(contentMode: .fit)
                    }
                @unknown default:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 10)
            .padding([.leading, .trailing, .bottom])
            
            VStack(alignment: .leading) {
                Text("Title")
                    .bold()
                    .font(.title)
                Text(imageData.title)
                    .padding(.bottom)
                Text("Author")
                    .bold()
                    .font(.title)
                Text(imageData.author)
                    .padding(.bottom)
                Text("Date Taken")
                    .bold()
                    .font(.title)
                Text(getDate(from: imageData.date_taken) ?? "Couldn't format date")
                    .padding(.bottom)
                Text("Description")
                    .bold()
                    .font(.title)
                Text(imageData.description)
                    .padding(.bottom)
            }
            .padding([.leading, .trailing])
        }
        .background(.sand)
        .toolbar {
            ToolbarItem {
                if let linkURL = URL(string: imageData.link) {
                    ShareLink(item: linkURL) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
            }
        }
    }
    
    func getDate(from string: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "MMMM, dd, yyyy"
        let newStr = newDateFormatter.string(from: date)
        return newStr
    }
}
