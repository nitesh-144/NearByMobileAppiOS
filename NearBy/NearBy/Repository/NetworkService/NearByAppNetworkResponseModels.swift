//
//  NearByAppNetworkResponseModels.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import Foundation

struct NearByApiResponseGeoLocation :Codable {
    var lat: Double
    var lon: Double
    var city: String
    var country: String
}

struct NearByVenueMetaResponse :Codable {
    var total: Int
    var took: Int
    var page: Int
    var per_page: Int
    var geolocation: NearByApiResponseGeoLocation
}

struct NearByApiResponsePlaceVenue: NearByVenue, Codable {
    var name: String = ""
    var address: String = ""
    var ticketURL: String = ""
    
    private enum CodingKeys : String, CodingKey {
        case name, address = "extended_address", ticketURL = "url"
    }
}

struct NearByVenuesResponseApiModel: Codable {
    var venues: [NearByApiResponsePlaceVenue]
    var meta: NearByVenueMetaResponse
}
