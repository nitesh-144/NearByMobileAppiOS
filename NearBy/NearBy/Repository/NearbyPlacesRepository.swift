//
//  NearbyPlacesRepository.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import Foundation

enum RepositoryError: Error {
    case placesNotFound
    case somethingWentWrong
    case networkIssue(errorMsg: String)
    case dbError(errorMsg: String)
}

typealias NearByPlacesRepositoryCompletion = (Result<[NearByVenue],RepositoryError>) -> Void

protocol NearByVenue {
    var name: String { get set }
    var address: String { get set }
    var ticketURL: String { get set }
}

protocol NearByPlacesRepositoryProtocol {
    func getPlaces(forLatitude latitude: Double, forLongitude longitude: Double, pageNo: Int, completion: @escaping NearByPlacesRepositoryCompletion)
}

class NearbyRepository: NearByPlacesRepositoryProtocol {
    func getPlaces(forLatitude latitude: Double, forLongitude longitude: Double, pageNo: Int, completion: @escaping NearByPlacesRepositoryCompletion) {
        
    }
}
