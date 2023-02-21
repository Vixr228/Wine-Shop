//
//  DataProvider.swift
//  WineShop
//
//  Created by Kostyan on 17.01.2023.
//

import Foundation

class DataProvider {
    var wines: [WineInfo] = [
        WineInfo(name: "MORANERA GAVI", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
        WineInfo(name: "Astrale Bieanco", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "MORANERA GAVI", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine2()),
        WineInfo(name: "Astrale Bieanco", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
        WineInfo(name: "Waipara hils", country: "Italy", year: 1965, colour: "Красное", sugar: "Сухое", grapeType: "Pinot Noir", alcoStrength: 14.5, volume: 0.75, price: 34399, image: R.image.wine1()),
    
    
    ]


    func getWines() -> [WineInfo]{
        return wines
    }
}
