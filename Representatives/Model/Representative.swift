//
//  Representative.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

struct State: Decodable {
    private enum CodingKeys: String, CodingKey {
        case representatives = "results"
    }
    
    let representatives: [Representative]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        representatives = try container.decode([Representative].self, forKey: .representatives)
    }
}

struct Representative: Decodable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
