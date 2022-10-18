//
//  ProfilesRepository.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import Foundation
import Alamofire
import AlamofireImage

struct Profile: Codable {
    let title: String
    let thumbnailUrl: String
}

class ProfilesRepository {
    func loadAll(completion: @escaping ([Profile]) -> Void) {
        let urlEndPoint = "https://jsonplaceholder.typicode.com/photos"
        let request = AF.request(urlEndPoint)
        request.responseDecodable(of: [Profile].self) {response in
            let photos = response.value ?? []
            completion(photos)
            
            #if DEBUG
            print(response)
            #endif
        }
    }
    
}



