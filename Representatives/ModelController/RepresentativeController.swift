//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let shared = RepresentativeController(); private init() {}
    
    private let baseURLString = "https://whoismyrepresentative.com/"
    
    func searchRepresentatives(forState state: State, completion: @escaping ([Representative]?) -> Void) {
     
        
    }
}
