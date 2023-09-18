//
//  WeatherData.swift
//  Weather
//
//  Created by Darshan Patel on 2023-09-06.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    let main : Main
    let weather : [Weather]
    let sys : Sys
}

// Define why we use codable
struct Main : Codable {
    let temp :Double
}

struct Weather : Codable {
    let description : String
    let main : String
    let id : Int
}

struct Sys : Codable {
    let country : String
}
