//
//  ProfilesRepository.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit.UIImage

struct Profile: Codable {
    let title: String
    let url: String
    let thumbnailUrl: String
}

class ProfilesRepository {
    func loadAll(completion: @escaping ([Profile]) -> Void) {
        let request = AF.request("https://jsonplaceholder.typicode.com/photos")
        request.responseDecodable(of: [Profile].self) {response in
            completion(response.value ?? [])
            
            #if DEBUG
            print(response)
            #endif
        }
    }
    
}



