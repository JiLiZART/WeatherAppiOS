//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Nikolay Kostyurin on 05.06.2022.
//

import Foundation
import CoreLocation

var API_KEY = "3f6dbae327db9aade442178c52035923"

class WeatherManager {
    func getCurrentWeather(lat: CLLocationDegrees, lng: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lng)&appid=\(API_KEY)&units=metric") else {
            fatalError("Missing url")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordResponse
    var weather: [WeatherItemResponse]
    var main: MainResponse
    var wind: WindResponse
    var base: String
    var visibility: Int
    var name: String
    
    
    struct CoordResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherItemResponse: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Int
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Int
    }
}
