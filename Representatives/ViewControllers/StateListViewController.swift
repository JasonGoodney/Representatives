//
//  StateListViewController.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class StateListViewController: UIViewController {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "stateCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
}

// MARK: - UITableViewDataSource
extension StateListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = States.all[indexPath.row]
        
        return cell
    }
    
}

// MARK: - Update View
private extension StateListViewController {
    func updateView() {
        
        [tableView].forEach({ view.addSubview($0) })
        
        setupTableViewConstraints()
        
        navigationItem.title = "State"
    }
    
    func setupTableViewConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - Navigation
extension StateListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
