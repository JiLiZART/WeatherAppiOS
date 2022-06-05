//
//  ModalData.swift
//  WeatherApp
//
//  Created by Nikolay Kostyurin on 05.06.2022.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldnt find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error load \(filename) from main bundle \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Error decode \(filename) as \(T.self) \n\(error)")
    }
}
