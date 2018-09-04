//
//  StateDetailViewController.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class StateDetailViewController: UIViewController {
    
    // MARK: - Properties
    var representatives: [Representative] = [] {
        didSet {
            reloadTableView()
        }
    }
    var state: String?
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.dataSource = self
        view.register(RepresentativeTableViewCell.self, forCellReuseIdentifier: "representativeCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        
        guard let state = state else { return }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        RepresentativeController.shared.searchRepresentatives(forState: state) { reps in
            guard let reps = reps else { return }
            self.representatives = reps
            self.reloadTableView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
extension StateDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as! RepresentativeTableViewCell
        
        cell.representative = representatives[indexPath.row]
        
        return cell
    }
}

// MARK: - Update View
private extension StateDetailViewController {
    func updateView() {
        
        [tableView].forEach({ self.view.addSubview($0) })
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func reloadTableView() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

// MARK: - Navigation
extension StateDetailViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
