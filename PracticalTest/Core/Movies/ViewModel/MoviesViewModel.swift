//
//  MoviesViewModel.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var movieList: ResponseModel<MovieModel>?
    
    private let movieDbService = MovieDbService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        movieDbService.$movieResponse
            .sink { [weak self] (returnedMovies) in
                self?.movieList = returnedMovies
            }
            .store(in: &cancellables)
        
    }
}
