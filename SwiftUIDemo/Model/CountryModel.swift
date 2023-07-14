//
//  CountryModel.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 11/07/23.
//

import Foundation

final class CountryModel: ObservableObject {
    @Published var countryList: [CountryList] = BundleDecoderFromJson.decodeCountryListFromBundleToJson()

//    public var flag: String {
//        return code.unicodeScalars.map({ 127397 + $0.value }).compactMap(UnicodeScalar.init).map(String.init).joined()
//    }
//    public let code: String
//    public var name: String {
//        Locale.localizedString(forRegionCode: code) ?? ""
//    }
//    public var title: String {
//        String(format: "%@ %@", self.flag, self.name)
//    }
//    public let dialCode: String?
    
}
