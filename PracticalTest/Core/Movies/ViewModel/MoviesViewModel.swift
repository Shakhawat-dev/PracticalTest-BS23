//
//  MoviesViewModel.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var movieResponse: ResponseModel<MovieModel>?
    
    @Published var movieList: [MovieModel] = []
    
    private let movieDbService = MovieDbService()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText: String = ""
    @Published var page: Int = 1
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        movieDbService.$movieResponse
            .sink { [weak self] (returnedMovies) in
                self?.movieResponse = returnedMovies
                self?.movieList.append(contentsOf: self?.movieResponse?.results ?? [])
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] (text) in
                if text.isEmpty {
                    return
                }
                self?.movieList.removeAll()
                self?.page = 1
                self?.movieDbService.getCoins(query: text, page: self?.page ?? 1)
            }
            .store(in: &cancellables)
        
        $page
            .sink { [weak self] (page) in
                self?.movieDbService.getCoins(query: self?.searchText ?? "", page: page)
            }
            .store(in: &cancellables)

    }
    
    func goNext() {
        guard let listPage = movieResponse?.page else { return }
        
        if self.page <= listPage {
            page += 1
        }
    }
}
