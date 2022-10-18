//
//  CollectionViewCell.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 15.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: CollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
          
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        
    }
    var data: Profile! {
        didSet {
            prepareForReuse()
        }
    }
    var profilesRopository: ProfilesRepository!
       
    
    
    
    
    
    
    
}
