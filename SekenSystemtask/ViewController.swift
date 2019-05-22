//
//  ViewController.swift
//  SekenSystemtask
//
//  Created by Karna Yarramsetty on 21/05/19.
//  Copyright © 2019 Invences. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import GoogleMaps

class ViewController: UIViewController {
     var restarentArray = [restarent]()

    @IBOutlet weak var restarentCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   getRequest()
    }
    
    func getRequest() {
        //Url object creation
        let url = NSURL(string: "http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/restaurants.json")
        print(url as Any)
        let request = NSMutableURLRequest(url:url! as URL)
        //Conver params to json data
        request.httpMethod = "GET"
        //Start requesting
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            //Connection failed case
                do{
                    let jsonResult: Any = (try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers))
                    
                    print(jsonResult)
                        let responseDictionary = jsonResult as! [String:AnyObject]
                        
                if let DictionariesArray = responseDictionary["restaurants"] as? [AnyObject] {
                            self.restarentArray = DictionariesArray.map({return restarent(json: JSON($0))})
                    DispatchQueue.main.sync {
                                self.restarentCollectionView.reloadData()
                    }
                    
//                            self.hideProgress()
                        }
                    
                }catch{
                    DispatchQueue.main.async(execute: {
//                        completionHandler(nil,"Apologies something went wrong. Please try again later..." as AnyObject)
                    })
                }
        }
        task.resume()
    }
/*
    func getApiCall() {
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "a975d13c-435d-52be-6bfe-1e899d3efe62"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/restaurants.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            guard data != nil else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    print("Response: \(json)")
                    
                    guard let jsonArray = json["restaurants"] as? [[String: Any]] else {
                        return
                    }
                    print(jsonArray)
                    self.restarentArray = jsonArray.map({restarent($0)})
//                    for dic in jsonArray{
////                        self.restarentArray.append(restarent(json: dic))
//                    }
//                    self.restarentArray = (json["restaurants"] as? NSArray ?? NSArray()) as! [restarent]
//                    print(self.restarentArray)
//                    DispatchQueue.main.async {
////                        self.restarentCollectionView.reloadData()
//                    }
                }
            } catch let parseError {
                print(parseError)
            }
        }
        
        task.resume()
    }
    */
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(restarentArray.count)
    return restarentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let userImage = cell.contentView.viewWithTag(10) as! UIImageView
        let name = cell.contentView.viewWithTag(11) as! UILabel
        let category = cell.contentView.viewWithTag(12) as! UILabel
        
        name.text = restarentArray[indexPath.row].name
        category.text = restarentArray[indexPath.row].category
        
        userImage.kf.indicatorType = .activity
        userImage.kf.setImage(with:NSURL(string: restarentArray[indexPath.row].backgroundImageURL) as URL? , placeholder: #imageLiteral(resourceName: "Offers"), options: [.transition(ImageTransition.fade(1))], progressBlock: { (receivedSize, totalSize) in
        }) { (image, error, cacheType, imageURL) in
        }
        
        return cell
    }
    
    
}

