//
//  Weather.swift
//  Weather
//
//  Created by DA MAC M1 157 on 2023/11/16.
//

import Foundation

//MARK: Weather
struct Weather: Codable {
    let current: Current
    let hourly: [Current]
    let daily: [Daily]
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let weather: [WeatherElement]
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let main: Main
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let weather: [WeatherElement]
}

// MARK: - Temp
struct Temp: Codable {
    let min: Double
    let max: Double
}


