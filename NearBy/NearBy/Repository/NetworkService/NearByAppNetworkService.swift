//
//  NearByAppNetworkService.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import Foundation

struct NetworkErrorMsg {
    static let urlNotFond = "Something is wrong, URL not fouund"
    static let somethingWentWrong = "Servier issue: something went wrong."
    static let statusCodeError = "Server response failed - status code error"
    static let dataParsingError = "Server data parsing error"
}

struct NetworkConfig {
    static let clientId = "Mzg0OTc0Njl8MTcwMDgxMTg5NC44MDk2NjY5"
    static let baseURL = "https://api.seatgeek.com/2/venues?"
    static let defaultPerPageCount = 0
    static let defaultDistance = 0
}

enum NearByAPI {
    case getPlaces(lat: Double, lng: Double, pageNo: Int, distance: Int, perPage: Int,filter: String)
    
    func makeURLRequest() -> URLRequest?{
        switch self {
            case let .getPlaces(lat,lng,pageNo,distance,perPage,filter) :
            let urlString = NetworkConfig.baseURL.makeGETUrl(lat: lat, lng: lng, pageNo: pageNo, distance: distance, perPage: perPage, filter: filter)
            guard let url = URL(string: urlString) else { return nil }
            return URLRequest(url: url)
        }
    }
}

class NearbyAppNetworkService: NearByPlacesRepositoryProtocol {
    
    func getPlaces(forLatitude latitude: Double, forLongitude longitude: Double, pageNo: Int,distance: Int = NetworkConfig.defaultDistance, perPage: Int = NetworkConfig.defaultPerPageCount, filter: String = "", completion: @escaping NearByPlacesRepositoryCompletion) {
        
        guard let request = NearByAPI.getPlaces(lat: latitude, lng: longitude, pageNo: pageNo, distance: distance, perPage: perPage, filter: filter).makeURLRequest()
        else {
            completion(.failure(.networkIssue(errorMsg: NetworkErrorMsg.urlNotFond)))
            return
        }
        
        URLSession.shared.dataTask(with: request) { responseData, urlResponse, error in
            if error != nil{
                completion(.failure(.networkIssue(errorMsg: NetworkErrorMsg.somethingWentWrong)))
            }
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? -1
            if !((200 ... 300).contains(statusCode)) {
                completion(.failure(.networkIssue(errorMsg: NetworkErrorMsg.statusCodeError)))
            }
            guard let response = try? JSONDecoder().decode(NearByVenuesResponseApiModel.self, from: responseData!) else {
                completion(.failure(.networkIssue(errorMsg: NetworkErrorMsg.dataParsingError)))
                return
            }
            if response.venues.isEmpty {
                completion(.failure(.placesNotFound))
            }else{
                completion(.success(response.venues))
            }
        }.resume()
    }
}
