//
//  ProfilesViewController.swift
//  app_tour
//
//  Created by Pavel Semenchenko on 14.10.2022.
//

import UIKit

class ProfilesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var profilesCollection: UICollectionView!
    
    let profilesRepository = ProfilesRepository()
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.dataSource = self
        collectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        getProfiles()
        
    }
  
    func getProfiles() {
        profilesRepository.loadAll { allProfiles in
            self.profiles = allProfiles
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rawCell = profilesCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell",
                                                         for: indexPath)
        guard let cell = rawCell as? CollectionViewCell else {
            fatalError("bad story")
        }
        cell.data = profiles[indexPath.row]
        cell.profilesRopository = profilesRepository
        return cell
    }
   // size of cell
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2.6,
                      height: view.frame.height/4)
    }
     */
    
}
