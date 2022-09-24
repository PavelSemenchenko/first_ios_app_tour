//
//  NewIssueViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.09.2022.
//

import Foundation
import UIKit

class NewIssueViewController: UIViewController {
    
    let repository = IssuesRepository()
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyField: UITextView!
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let title = titleField.text!
        let body = bodyField.text!
        
        repository.create(title: title, body: body) { _ in }
        navigationController?.popViewController(animated: true)
    }
        
}

