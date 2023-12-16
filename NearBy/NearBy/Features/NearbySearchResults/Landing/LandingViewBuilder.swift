//
//  LandingViewBuilder.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import Foundation

class LandingViewBuilder {
    
    func build(dataSource: LandingViewModelDataSourceProtocol, dependency: LandingViewModelDependencyProtocol, listener: LandingViewModelListenerProtocol) -> LandingViewController{
        
        let landingViewModel = LandingViewModel(withDataSource: dataSource, andDependency: dependency, listener: listener)
        let landingVC = LandingViewController(viewModel: landingViewModel)
        landingViewModel.delegate = landingVC
        
        return landingVC
    }
}
