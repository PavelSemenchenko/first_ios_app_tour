//
//  IssueCell.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 11.09.2022.
//

import UIKit

class IssueCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButtonCell: UILabel!
    @IBOutlet weak var numberButtonCell: UILabel!
    @IBOutlet weak var userButtonCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var data: Issue! {
        didSet {
            prepareForReuse()
        }
    }
    var issuesRepository: IssuesRepository!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleButtonCell.text = "The Title is: \(data.title)"
        numberButtonCell.text = "# \(data.number)"
        userButtonCell.text = "The state is \(data.state)"
    }
    
    
    @IBAction func deleteCellButton(_ sender: Any) {
        issuesRepository.delete(number: data.number) { _ in
            
        }
    }
    
    
}
