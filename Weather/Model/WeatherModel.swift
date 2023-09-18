//
//  WeatherModel.swift
//  Weather
//
//  Created by Darshan Patel on 2023-09-18.
//

import Foundation

struct WeatherModel {
    let conditionId : Int
    let cityName: String
    let temperature: Double
    let country: String
    
    var conditionName: String {
        
        switch conditionId {
        case 200...299:
            return "cloud.blot.rain"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "cloud.snow"
        case 700...799:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...805:
            return "cloud.bolt"
        default:
            return "clouds"
        }
    }
    
    // Convert temperature double to single decimal string value
    var temperatureString : String {
        return String(format:"%.1f", temperature)
    }
}
