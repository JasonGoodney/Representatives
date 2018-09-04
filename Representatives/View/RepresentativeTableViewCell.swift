//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    var representative: Representative? {
        didSet {
            updateView()
        }
    }
    var nameLabel = UILabel()
    var districtLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Update View
extension RepresentativeTableViewCell {
    func updateView() {
        guard let rep = representative else { return }
        
        nameLabel.text = rep.name
        districtLabel.text = rep.district
        
        [nameLabel, districtLabel].forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            districtLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            districtLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


