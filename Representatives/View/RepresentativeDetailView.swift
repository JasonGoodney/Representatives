//
//  RepresentativeDetailView.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class RepresentativeDetailView: UIView {

    // MARK: - Properties
    var representative: Representative? {
        didSet {
            updateView()
        }
    }
    
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let districtLabel = UILabel()
    let stateLabel = UILabel()
    let partyLabel = UILabel()
    var officeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    let websiteLabel = UILabel()
    let phoneLabel = UILabel()
    
    init(representative: Representative) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        self.representative = representative
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Update View
private extension RepresentativeDetailView {
    
    func updateView() {
        addSubview(stackView)
        setupStackView()
        
        guard let rep = representative else { return }
        nameLabel.text = rep.name
        districtLabel.text = rep.district
        stateLabel.text = rep.state
        partyLabel.text = rep.party
        officeLabel.text = rep.office
        websiteLabel.text = rep.link
        phoneLabel.text = rep.phone
        
        [nameLabel, partyLabel, stateLabel, districtLabel,
         officeLabel, websiteLabel, phoneLabel].forEach({
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
         })
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
