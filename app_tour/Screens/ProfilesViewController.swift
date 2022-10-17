//
//  ProfilesViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import UIKit

class ProfilesViewController: UICollectionViewController {
    
    @IBOutlet var profilesCollection: UICollectionView!
    
    let profilesRepository = ProfilesRepository()
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "profileCell", bundle: nil)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getProfiles()
        
    }
    func getProfiles() {
        profilesRepository.loadAll { allProfiles in
            self.profiles = allProfiles
            self.profilesCollection.reloadData()
        }
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return CollectionViewCell
    }
}
