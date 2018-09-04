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
    let officeLabel = UILabel()
    let websiteLabel = UILabel()
    let phoneNumberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Update View
private extension RepresentativeDetailView {
    
    func updateView() {
        guard let rep = representative else { return }
        nameLabel.text = rep.name
        districtLabel.text = rep.district
        stateLabel.text = rep.state
        partyLabel.text = rep.party
        officeLabel.text = rep.office
        websiteLabel.text = rep.office
        phoneNumberLabel.text = rep.phone
        
        [nameLabel, districtLabel, stateLabel, partyLabel,
         officeLabel, websiteLabel, phoneNumberLabel].forEach({
            stackView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
         })
    }
    
    func setupStackView() {
        stateLabel
    }
    
}
