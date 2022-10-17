//
//  ViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 22.08.2022.
//

import UIKit

class IssuesViewController: UIViewController, UITableViewDataSource {
        
    @IBOutlet weak var issuesTable: UITableView!
    
    let issuesRepository = IssuesRepository()
    var issues: [Issue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "IssueCell", bundle: nil)
        issuesTable.dataSource = self
        issuesTable.register(cellNib, forCellReuseIdentifier: "issueCell")
        
        getIssues()
       
    }
   
    func getIssues() {
        issuesRepository.loadAll { allIssues in
            self.issues = allIssues
            self.issuesTable.reloadData()
        }
    }
    
    @IBAction func newIssueButtonClicked(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "newIssueStoryboardId") as! NewIssueViewController
       
        self.navigationController?.pushViewController(controller, animated: false)
       
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        getIssues()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issueCell", for: indexPath) as! IssueCell
        cell.data = issues[indexPath.row]
        cell.issuesRepository = issuesRepository
        return cell
    }
    
    
}

