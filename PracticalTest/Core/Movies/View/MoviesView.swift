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
            if let movies = vm.movieList {
                List(movies, id: \.id) { movie in
                    MovieRowView(movie: movie)
                        .onAppear() {
                            DispatchQueue.global().sync {
                                if movie.id == movies.last?.id {
                                    vm.goNext()
                                }
                            }
                        }
                }
                .listStyle(PlainListStyle())
            } else {
                NoDataView()
            }
            
        }
//        .searchable(text: $vm.searchText)
        .searchable(text: $vm.searchText, prompt: "Search Something")
        .navigationTitle("Movie List")
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewModel())
    }
}
