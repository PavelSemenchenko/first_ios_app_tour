//
//  ProfilesViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import UIKit

class ProfilesViewController: UICollectionViewController {
    
    let profilesRepository = ProfilesRepository()
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ProfileCell", bundle: nil)
        collectionView.dataSource = self
        collectionView.register(cellNib, forCellWithReuseIdentifier: "ProfilesCell")
        
        getProfiles()
    }
    
    func getProfiles() {
        profilesRepository.loadAll { allProfiles in
            self.profiles = allProfiles
            self.collectionView.reloadData()
        }
    }
}
