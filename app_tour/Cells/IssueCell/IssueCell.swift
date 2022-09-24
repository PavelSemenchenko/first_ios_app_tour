//
//  IssueCell.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 11.09.2022.
//

import UIKit

class IssueCell: UITableViewCell {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    
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
        
        stateLabel.text = "Title is: \(data.title)"
        urlLabel.text = "# \(data.number)"
        creatorLabel.text = "The state is \(data.state)"
    }
    
    @IBOutlet weak var closeIssueButton: UIButton!
    
    
    @IBAction func deleteCellButton(_ sender: Any) {
        issuesRepository.delete(nubmer: data.number) { _ in
            
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
