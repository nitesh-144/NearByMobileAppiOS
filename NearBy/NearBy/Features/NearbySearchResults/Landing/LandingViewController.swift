//
//  LandingViewController.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import UIKit

class LandingViewController: UIViewController {
    
    var viewModel: LandingViewModelProtocol
    
    private lazy var tableview: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.rowHeight = UITableView.automaticDimension
        tv.separatorStyle = .none
        return tv
    }()
    
    init(viewModel: LandingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.view.backgroundColor = viewModel.dataSource.backgroundColor
        self.title = viewModel.dataSource.screenTitle
        tableview.register(PlaceTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableview)
        tableview.anchor(top: view.safeAreaLayoutGuide.topAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        viewModel.getAllVanues { [weak self] result in
            switch result {
            case let .success(places):
                self?.viewModel.records = places
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
        
    }
}
extension LandingViewController: LandingViewModelDelegateProtocol {
    
}
extension LandingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! PlaceTableViewCell
        cell.setupCell(withPlace: viewModel.records[indexPath.row])
        return cell
    }
}
