//
//  OffersTableViewCell.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import UIKit

class OffersTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var offer_image_view: UIImageView!
    
    @IBOutlet weak var offer_name: UILabel!
    
    override func prepareForReuse() {
        offer_image_view.image = nil
    }
    
    //MARK:-
    func setUp(_ offer: Offer)
    {
        if let url = URL(string: offer.image ?? "") {
            offer_image_view.sd_setImage(with: url) { image, error, type, url in
                //
            }
        }
        offer_name.text = offer.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
