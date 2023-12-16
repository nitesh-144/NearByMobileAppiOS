//
//  PlaceTableViewCell.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    private lazy var parentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var placeName: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.black
        lbl.font = UIFont.boldSystemFont(ofSize: 17.0)
        return lbl
    }()
    private lazy var placeAddress: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 15.0)
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(parentView)
        parentView.addSubview(placeName)
        parentView.addSubview(placeAddress)
        
        parentView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, topPadding: 5, leftPadding: 5,rightPadding: 5, bottomPadding: 5)
        placeName.anchor(top: parentView.topAnchor, left: parentView.leftAnchor, right: parentView.rightAnchor, topPadding: 8, leftPadding: 8, rightPadding: 8)
        placeAddress.anchor(top: placeName.bottomAnchor,bottom: parentView.bottomAnchor, left: parentView.leftAnchor, right: parentView.rightAnchor, topPadding: 5, leftPadding: 8, rightPadding: 8, bottomPadding: 8)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor.yellow
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupCell(withPlace place: NearByVenue) {
        placeName.text = place.name
        placeAddress.text = place.address
    }
}
