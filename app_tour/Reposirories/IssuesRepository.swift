//
//  IssuesRepository.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.09.2022.
//

import Foundation
import Alamofire

struct User: Codable {
    let login: String
    let id: Int
    let url: String
}

struct Issue : Codable {
    let title: String
    let node_id: String
    let state: String
    let number: Int
    let user: User
    
}

struct NewIssue : Codable {
    let title: String
    let body: String
}

struct CloseIssue : Codable {
    let state: String
}

class IssuesRepository {
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer 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",
    ]
    
    
    func loadAll(completion: @escaping ([Issue]) -> Void) {
        
        // get
        let request = AF.request("https://api.github.com/repos/PavelSemenchenko/first_ios_app_tour/issues", headers: headers)
        request.responseDecodable(of: [Issue].self) {issuesResponse in
            completion(issuesResponse.value ?? [])
            
        }
    }
    
    func create(title: String, body: String, completion: @escaping (Issue) -> Void) {
        // post
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
    
    // clode issue
    func delete(nubmer: Int, completion: @escaping (Issue) -> Void) {
        
        let deteleteIssue = CloseIssue(state: "close")
        
        let request = AF.request("https://api.github.com/repos/PavelSemenchenko/first_ios_app_tour/issues/\(number)",
                                 method: .patch,
                                 parameters: deteleteIssue,
                                 headers: headers)
        
        request.responseDecodable(of: Issue.self) { issuesResponse in
            completion(issuesResponse.value!)
        }
    }
}
