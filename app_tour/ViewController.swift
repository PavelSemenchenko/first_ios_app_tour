//
//  ViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 22.08.2022.
//

import UIKit
import Alamofire

struct Issue : Codable {
    
    let title: String
    let node_id: String
    let state: String
    
}

class IssuesRepository {
    
    func loadAll(completion: @escaping ([Issue]) -> Void) {
        let request = AF.request("https://api.github.com/repos/Alamofire/Alamofire/issues")
        
        request.responseDecodable(of: [Issue].self) {issuesResponse in
            completion(issuesResponse.value ?? [])
            
            print(issuesResponse)
        }
    }
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let issuesRepository = IssuesRepository()
    
    var issues: [Issue] = []
    
    
    @IBOutlet weak var issuesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issuesTable.dataSource = self
        let cellNib = UINib(nibName: "IssueCell", bundle: nil)
        issuesTable.register(cellNib, forCellReuseIdentifier: "issueCell")
        
    }
    
    @IBAction func welcomeButtonClicked(_ sender: Any) {
        issuesRepository.loadAll { allIssues in
            self.issues = allIssues
            self.issuesTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issueCell", for: indexPath) as! IssueCell
        
        cell.stateLabel.text = issues[indexPath.row].title
        cell.urlLabel.text = issues[indexPath.row].node_id
        cell.creatorLabel.text = issues[indexPath.row].state
        
        
        return cell
        
    }
    
    
}







/*
 
 @IBDesignable
 class MyView: UIView {
 
 override init(frame: CGRect) {
 super.init(frame: frame)
 }
 
 required init?(coder: NSCoder) {
 super.init(coder: coder)
 
 
 frame.size.width = 30
 bounds.size.height = 30
 
 }
 
 @IBInspectable
 var myBGColor: UIColor = .green {
 didSet {
 backgroundColor = myBGColor
 }
 }
 
 @IBInspectable
 var corderRadius: CGFloat = 0 {
 didSet {
 self.layer.cornerRadius = corderRadius
 }
 }
 }
 
 */

