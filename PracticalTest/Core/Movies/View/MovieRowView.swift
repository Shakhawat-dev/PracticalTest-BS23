//
//  MovieRowView.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import SwiftUI

struct MovieRowView: View {
    var movie: MovieModel?
    
    var body: some View {
        HStack {
            if let movie = movie {
                ImageLoaderView(url: AppConstants.imageW500Url + (movie.posterPath ?? ""))
                    .frame(width: 64, height: 128)
                
                VStack(alignment: .leading) {
                    Text(movie.title ?? "")
                        .font(.headline)
                    
                    Text(movie.overview ?? "")
                        .font(.caption)
                }
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView()
            .previewLayout(.sizeThatFits)
    }
}
