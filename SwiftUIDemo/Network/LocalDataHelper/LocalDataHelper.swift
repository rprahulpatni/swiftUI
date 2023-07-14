//
//  LocalDataHelper.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 07/06/23.
//

import Foundation

final class LocalDataHelper: ObservableObject {
    @Published var landmarks: [Landmark] = BundleDecoderFromJson.decodeLandmarkFromBundleToJson()
    
    var features: [Landmark] {
        landmarks.filter( { $0.isFeatured} )
    }
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks, by: { $0.category.rawValue }
        )
    }
}

struct BundleDecoderFromJson {
    static func decodeLandmarkFromBundleToJson() -> [Landmark] {
        let landmarkJson = Bundle.main.path(forResource: "landmarkData", ofType: "json")
        let landmarks = try! Data(contentsOf: URL(fileURLWithPath: landmarkJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([Landmark].self, from: landmarks)
    }
    
    static func decodeCountryListFromBundleToJson() -> [CountryList] {
        let countryJson = Bundle.main.path(forResource: "CountryCodes", ofType: "json")
        let countryData = try! Data(contentsOf: URL(fileURLWithPath: countryJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([CountryList].self, from: countryData)
    }
    
//    static func decodeCountryDataFromBundleToJson() -> [CountryModel] {
//        let countryJson = Bundle.main.path(forResource: "CountryCodes", ofType: "json")
//        let countryData = try! Data(contentsOf: URL(fileURLWithPath: countryJson!), options: .alwaysMapped)
//        return try! JSONDecoder().decode([CountryModel].self, from: countryData)
//    }
}
