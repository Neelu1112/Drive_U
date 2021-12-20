//
//  SocialMediaCollectionViewCell.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import UIKit

class SocialMediaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var socialMedia_cv: UICollectionView!
    
    var features: [Feature]?
    var FeaturesCellIdentifier = "FeaturesCollectionViewCell"
    
    //MARK:-
    func setUp(_ features: [Feature])
    {
        self.features = features
        socialMedia_cv.reloadData()
    }
}

//MARK:- UICollectionViewDataSource
extension SocialMediaCollectionViewCell: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturesCellIdentifier, for: indexPath) as! FeaturesCollectionViewCell
        guard let feature = self.features?[indexPath.row] else{return UICollectionViewCell()}
        cell.setUp(feature)
        
        return cell
    }
}
