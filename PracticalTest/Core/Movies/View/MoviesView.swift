//
//  MoviesView.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject private var vm: MoviesViewModel
    
    var body: some View {
        ZStack {
            ScrollView() {
                VStack {
                    if let movies = vm.movieList?.results {
                        ForEach(movies, id: \.id) { movie in
                            Text("\(movie.title ?? "")")
                        }
                    }
                    
                    
                }
            }
            
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewModel())
    }
}
