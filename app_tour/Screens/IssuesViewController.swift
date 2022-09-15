//
//  ViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 22.08.2022.
//

import UIKit

class IssuesViewController: UIViewController, UITableViewDataSource {
    
      
    let issuesRepository = IssuesRepository()
    var issues: [Issue] = []
    
    @IBOutlet weak var issuesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issuesTable.dataSource = self
        let cellNib = UINib(nibName: "IssueCell", bundle: nil)
        issuesTable.register(cellNib, forCellReuseIdentifier: "issueCell")
        
        issuesRepository.loadAll { allIssues in
            self.issues = allIssues
            self.issuesTable.reloadData()
       }
        
    }
   
    
    
    @IBAction func newIssueButtonClicked(_ sender: Any) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "newIssueStoryboardId") as! NewIssueViewController
       
       navigationController?.pushViewController(vc, animated: false)
       
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

