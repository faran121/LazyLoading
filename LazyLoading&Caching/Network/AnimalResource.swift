//
//  AnimalResource.swift
//  LazyLoading&Caching
//
//  Created by Maliks on 12/09/2023.
//

import Foundation

struct AnimalResource {
    func getAnimals(completionHandler: @escaping (AnimalResponse?) -> ()) {
        let animalApiUrl = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!
        
        URLSession.shared.dataTask(with: animalApiUrl) { (data, response, error) in
            if error == nil && data != nil {
                do {
                    let result = try JSONDecoder().decode(AnimalResponse.self, from: data!)
                    completionHandler(result)
                }
                catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
