//
//  RepresentativeDetailViewController.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {
    
    // MARK: - Properties
    var representative: Representative?
    var contentView: RepresentativeDetailView {
        return view as! RepresentativeDetailView
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        guard let rep = representative else { return }
        view = RepresentativeDetailView(representative: rep)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let rep = representative else { return }
        navigationItem.title = rep.name
    }
}
