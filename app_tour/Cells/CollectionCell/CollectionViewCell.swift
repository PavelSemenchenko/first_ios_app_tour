//
//  CollectionViewCell.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 15.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var data: Profile! {
        didSet {
            prepareForReuse()
        }
    }
    var profilesRopository: ProfilesRepository! // unused -2 remove!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileLabel.text = data.title
        guard let url = URL(string: data.thumbnailUrl) else {
            profileImage.image = nil
            return
        }
        profileImage.af.setImage(withURL: url)
    }
}

