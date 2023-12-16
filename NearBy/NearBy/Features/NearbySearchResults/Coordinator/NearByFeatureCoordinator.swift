//
//  NearByFeatureCoordinator.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import UIKit

protocol NearbyFeatureCoordinatorDataSourceProtocol: LandingViewModelDataSourceProtocol {
    
}
protocol NearbyFeatureCoordinatorDependencyProtocol: LandingViewModelDependencyProtocol {
    
}

class NearbyFeatureCoordinator {
    private var navigationController: UINavigationController?
    var datasource: NearbyFeatureCoordinatorDataSourceProtocol
    var dependency: NearbyFeatureCoordinatorDependencyProtocol
    
    init(withDataSource ds: NearbyFeatureCoordinatorDataSourceProtocol, withDependency: NearbyFeatureCoordinatorDependencyProtocol) {
        self.datasource = ds
        self.dependency = withDependency
    }
        
    func startFlow() -> UINavigationController {
        
        let landingVC = LandingViewBuilder().build(dataSource: datasource, dependency: dependency, listener: self)
        navigationController = UINavigationController(rootViewController: landingVC)
        return navigationController!
    }
}
extension NearbyFeatureCoordinator: LandingViewModelListenerProtocol {
    
}
