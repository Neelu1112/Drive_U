//
//  FeaturesCollectionViewCell.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import Foundation
import UIKit
import SDWebImage

class FeaturesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var social_image_view: UIImageView!
    
    @IBOutlet weak var social_name: UILabel!
    
    override func prepareForReuse() {
        social_image_view.image = nil
    }
    
    //MARK:-
    func setUp(_ feature: Feature)
    {
        social_image_view.layer.cornerRadius = 10
        
        social_image_view.clipsToBounds = true
        
        if let url = URL(string: feature.imageUrl ?? "") {
            social_image_view.sd_setImage(with: url) { image, error, type, url in
                //
            }
        }
        social_name.text = feature.screenName
    }
}
