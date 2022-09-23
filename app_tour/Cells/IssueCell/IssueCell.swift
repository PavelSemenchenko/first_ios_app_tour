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
    
    
    @IBAction func closeIssueButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
   
    
}
