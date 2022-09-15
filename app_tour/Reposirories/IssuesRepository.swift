//
//  IssuesRepository.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.09.2022.
//

import Foundation
import Alamofire

struct Issue : Codable {
    let title: String
    let node_id: String
    let state: String
    
}

struct NewIssue : Codable {
    let title: String
    let body: String
}


class IssuesRepository {
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer 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",
    ]
    
    
    func loadAll(completion: @escaping ([Issue]) -> Void) {
        
        
        let request = AF.request("https://api.github.com/repos/PavelSemenchenko/first_ios_app_tour/issues", headers: headers)
        request.responseDecodable(of: [Issue].self) {issuesResponse in
            completion(issuesResponse.value ?? [])
            
        }
    }
    
    func create(title: String, body: String, completion: @escaping (Issue) -> Void) {
        //POST
        let newIssue = NewIssue(title: title, body: body)
        
        let request = AF.request("https://api.github.com/repos/PavelSemenchenko/first_ios_app_tour/issues",
                                 method: .post,
                                 parameters: newIssue,
                                 encoder: JSONParameterEncoder.default,
                                 headers: headers)
        request.responseDecodable(of: Issue.self) {issuesResponse in
            completion(issuesResponse.value!)
            
        }
    }
}
