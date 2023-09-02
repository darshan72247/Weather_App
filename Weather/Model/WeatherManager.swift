//
//  WeatherManager.swift
//  Weather
//
//  Created by Darshan Patel on 2023-09-02.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e6db9a497da7d1a09339dcb34cee9994&units=metric"
    
    func fetchWeather (cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //Step 1: Create a URL
        
        if let url = URL(string: urlString){
            //Step 2: Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //Step 3: Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //Step 4: Start the task
            task.resume()
        }
        
        
        
        
    }
    
    func handle(data:Data?, response:URLResponse? , error:Error?) {
        if (error != nil){
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data:safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
