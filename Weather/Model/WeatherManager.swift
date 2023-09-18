//
//  WeatherManager.swift
//  Weather
//
//  Created by Darshan Patel on 2023-09-02.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e6db9a497da7d1a09339dcb34cee9994&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
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
            let task = session.dataTask(with: url) { data, response, error in
                if (error != nil){
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            //Step 4: Start the task
            task.resume()
        }
    }
    
    
    func parseJSON (weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let countryName = decodedData.sys.country
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, country: countryName)
//            print(weather.conditionName)
//            print(weather.temperatureString)
//            print(weather.country)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
