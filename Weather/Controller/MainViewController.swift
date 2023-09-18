//
//  MainViewController.swift
//  Weather
//
//  Created by Darshan Patel on 2023-08-31.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate{
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    

    @IBAction func searchPressed(_ sender: UIButton) {
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != ""){
            return true
            
        } else {
            textField.placeholder = "Enter a city?"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // We should have the weather data for the city they entered
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.cityName)
    }
}
