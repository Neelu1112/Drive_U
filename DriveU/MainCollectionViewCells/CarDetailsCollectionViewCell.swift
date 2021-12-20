//
//  CarDetailsCollectionViewCell.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import UIKit
import SDWebImage

class CarDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var car_image_view: UIImageView!
    
    @IBOutlet weak var car_name: UILabel!
    
    @IBOutlet weak var car_number: UILabel!
    
    @IBOutlet weak var car_detail: UILabel!
    
    override func prepareForReuse() {
        car_image_view.image = nil
    }
    
    //MARK:-
    func setUp(_ carInfo: Car)
    {
        if let url = URL(string: carInfo.image ?? "") {
            car_image_view.sd_setImage(with: url) { image, error, type, url in
                //
            }
        }
        
        car_name.text = carInfo.make ?? ""
        car_number.text = carInfo.regNo ?? ""
        car_detail.text = "\(carInfo.transmission ?? "") - \(carInfo.fuelType ?? "")"
    }
    
}
