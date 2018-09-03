//
//  State.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

struct State: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case name
        case representatives = "results"
    }
    
    let name: String
    let representatives: [Representative]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        representatives = try container.decode([Representative].self, forKey: .representatives)
    }
}
