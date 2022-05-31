//
//  AppConstants.swift
//  PracticalTest
//
//  Created by Shakhawat Hossain Shahin on 31/5/22.
//

import Foundation

struct AppConstants {
    static private let baseUrl = "https://api.themoviedb.org/"
    static private let version = "3"
    static private let api_key = "38e61227f85671163c275f9bd95a8803"
    
    // Query Paths
    static let search = baseUrl + version + "/search/movie?api_key=\(api_key)&query=marvel"
}
