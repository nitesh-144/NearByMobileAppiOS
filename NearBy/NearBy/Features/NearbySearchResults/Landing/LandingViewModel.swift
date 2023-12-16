//
//  LandingViewModel.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import UIKit

protocol LandingViewModelProtocol {
    var dataSource: LandingViewModelDataSourceProtocol { get set }
    var dependency :LandingViewModelDependencyProtocol { get set }
    var delegate: LandingViewModelDelegateProtocol? { get set }
    var listener: LandingViewModelListenerProtocol? { get }
    var records: [NearByVenue] { get set }
    
    func getAllVanues(completion: @escaping NearByPlacesRepositoryCompletion)
}

protocol LandingViewModelDataSourceProtocol {
    var backgroundColor: UIColor { get set }
    var screenTitle: String { get set }
}

protocol LandingViewModelDependencyProtocol {
    var repository: NearByPlacesRepositoryProtocol { get set }
}

protocol LandingViewModelDelegateProtocol{
    
}

protocol LandingViewModelListenerProtocol {
    
}

class LandingViewModel: LandingViewModelProtocol {
    var records: [NearByVenue] = []
    
    var listener: LandingViewModelListenerProtocol?
    var dataSource: LandingViewModelDataSourceProtocol
    var dependency: LandingViewModelDependencyProtocol
    var delegate: LandingViewModelDelegateProtocol?
    
    
    init(withDataSource ds: LandingViewModelDataSourceProtocol,andDependency dependency: LandingViewModelDependencyProtocol, listener: LandingViewModelListenerProtocol?) {
        self.dependency = dependency
        self.dataSource = ds
    }
    
    func getAllVanues(completion: @escaping NearByPlacesRepositoryCompletion) {
        dependency.repository.getPlaces(forLatitude: 12.971599, forLongitude: 77.594566, pageNo: 1, distance: 12, perPage: 10, filter: "") { result in
            completion(result)
        }
    }
}
