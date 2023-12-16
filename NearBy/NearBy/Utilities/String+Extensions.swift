//
//  String+Extensions.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import Foundation

extension String {
    
    func makeGETUrl(lat: Double,lng: Double, pageNo: Int,distance: Int, perPage: Int, filter: String) -> String{
        var result = self + "per_page=\(perPage)&page=\(pageNo)&lat=\(lat)&lon=\(lng)&range=\(distance)mi"
        if !filter.isEmpty{
            result += "&q=\(filter)"
        }
        return result
    }
}
