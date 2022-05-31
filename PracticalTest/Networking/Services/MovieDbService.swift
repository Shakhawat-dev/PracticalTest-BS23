//
//  MovieDbService.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import Foundation
import Combine

class MovieDbService {
//    @Published var movieList: [MovieModel] = []
    @Published var movieResponse: ResponseModel<MovieModel>?
    
    var movieSubscription: AnyCancellable?
    
    init() {
        self.getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: AppConstants.search) else { return }
        
        movieSubscription = NetworkManager.download(url: url)
            .decode(type: ResponseModel<MovieModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedMovies in
                self?.movieResponse = returnedMovies
            })
    }
}
