//
//  ProfilesViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import UIKit

class ProfilesViewController: UICollectionViewController {
    
    @IBOutlet var profilesCollection: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "profileCell")
        }
    }
    
    let profilesRepository = ProfilesRepository()
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
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
        profiles.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! CollectionViewCell
        cell.data = profiles[indexPath.item]
        cell.profilesRopository = profilesRepository
        return cell
    }
   
    
    
}
