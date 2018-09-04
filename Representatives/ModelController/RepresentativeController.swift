//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    private enum GetAll: String {
        case repsByState = "getall_reps_bystate"
    }
    
    private enum Extension: String {
        case php = ".php"
    }
    
    static let shared = RepresentativeController(); private init() {}
    
    private let baseURLString = "https://whoismyrepresentative.com"
    
    func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
     
        guard let baseURL = URL(string: baseURLString) else { completion(nil); return }

        guard let url = createURL(baseURL: baseURL, byState: state)
            else { completion(nil);  return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error at data task \(#function): \(error) \(error.localizedDescription)")
                completion([]); return
            }
            
            guard let data = data else {
                print("Did not recieve data)")
                completion([]); return
            }
            
            guard let asciiData = String(data: data, encoding: .ascii),
                let jsonData = asciiData.data(using: .utf8) else {
                completion([]); return
            }
        
            do {
                let representatives = try JSONDecoder().decode(State.self, from: jsonData).representatives
                completion(representatives)
            } catch let error {
                print("😳\nThere was an error in \(#function): \(error)\n\n\(error.localizedDescription)\n👿")
            }
        }.resume()
    }
    
    // How to make to URL creation flexible?
    private func createURL(baseURL: URL, byState state: String) -> URL? {
       
        let url = baseURL
            .appendingPathComponent(GetAll.repsByState.rawValue + Extension.php.rawValue)
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let stateQueryItem = URLQueryItem(name: "state", value: "\(state)")
        let jsonQueryItem = URLQueryItem(name: "output", value: "json")
        urlComponents?.queryItems = [stateQueryItem, jsonQueryItem]
        
        guard let components = urlComponents else { return nil }
        
        return components.url
    }
}




































































