//
//  OffersCollectionViewCell.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offers_tableView: UITableView!
    
    var offers: [Offer]?
    var OffersCellIdentifier = "OffersTableViewCell"
    
    //MARK:-
    func setUp(_ offers: [Offer])
    {
        self.offers = offers
        offers_tableView.reloadData()
    }
}

extension OffersCollectionViewCell: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OffersCellIdentifier) as! OffersTableViewCell
        guard let offer = self.offers?[indexPath.row] else{return UITableViewCell()}
        cell.setUp(offer)
        return cell
    }
}
