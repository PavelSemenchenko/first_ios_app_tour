//
//  CollectionViewCell.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 15.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let reuseID = String(describing: CollectionViewCell.self)
    let nib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
    
    @IBOutlet weak var ibLabel: UILabel!
    @IBOutlet weak var ibImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
        
    }
    var data: Profile! {
        didSet {
            prepareForReuse()
        }
    }
    var profilesRopository: ProfilesRepository!
    override func prepareForReuse() {
        super.prepareForReuse()
        ibLabel.text = "\(data.title)"
        ibImageView.image = data.thumbnailUrl
    }
    
    func update(title: String, image: UIImage) {
        ibImageView.image = image
        ibLabel.text = title
    }
    
}
