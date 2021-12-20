//
//  ViewController.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:-
    @IBOutlet weak var main_collectionView: UICollectionView!
    
    //MARK:-
    var CardetailsCellIdentifier = "CarDetailsCell"
    var SocialMediaCellIdentifier = "SocialMediaCell"
    var OffersCellIdentifier = "OffersCell"
    
    private let urlString = "https://jsonkeeper.com/b/TMAP"
    
    var result: Home?
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDetails()
        
    }
    
    //MARK:-
    func fetchDetails()
    {
        guard let url = URL(string: urlString) else{return}
        var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
                //fetch data
                URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                    
                    if error != nil
                    {
                        //Handle error
                    }
                    else if let _data = data
                    {
                        do{
                            guard let jsonObj = try JSONSerialization.jsonObject(with: _data, options: .fragmentsAllowed) as? [String:Any] else{return}
                            print("\n\njsonObj: \(jsonObj)")
                            self?.result = Home(JSON: jsonObj, context: nil)
                            
                            print(self?.result?.feeds?.count ?? 0)
                            DispatchQueue.main.async {
                                self?.main_collectionView.reloadData()
                            }
                            
                        }
                        catch let error{
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                    else{
                        //show error
                    }
                    
                    
                }.resume()
    }
}

//MARK:- UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.feeds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let feed = result?.feeds?[indexPath.row]
        let screenName = feed?.screen
        
        switch screenName
        {
            case "carDetails":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardetailsCellIdentifier, for: indexPath) as! CarDetailsCollectionViewCell
            
            guard let carDetails = feed?.car else {return UICollectionViewCell()}
            cell.setUp(carDetails)
            
            return cell
            
            case "Social Apps":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialMediaCellIdentifier, for: indexPath) as! SocialMediaCollectionViewCell
            guard let features = feed?.features else {return UICollectionViewCell()}
            cell.setUp(features)
            return cell
            
            case "offers":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCellIdentifier, for: indexPath) as! OffersCollectionViewCell
            guard let offers = feed?.offers else {return UICollectionViewCell()}
            cell.setUp(offers)
            return cell
            
        case .none:
            print("Wrong category")
        case .some(_):
            print("Wrong category")
        }
        
        return UICollectionViewCell()
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 500)
    }
}
