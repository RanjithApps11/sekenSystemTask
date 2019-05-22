//
//  Networkmanager.swift
//  SekenSystemtask
//
//  Created by Karna Yarramsetty on 21/05/19.
//  Copyright © 2019 Invences. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    
    class func getRequest(completionHandler: @escaping (AnyObject?,AnyObject?) -> Void ) {
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
//            if error != nil {
//                DispatchQueue.main.async {
//                    if error!.localizedDescription == NSURLErrorDomain {
//                        completionHandler(nil,"Apologies something went wrong. Please try again later..." as AnyObject)
//                    }else{
//                        completionHandler(nil,"Apologies something went wrong. Please try again later..." as AnyObject)
//                    }
//                }
//            }
//            else
//            {
                do{
                    let jsonResult: Any = (try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers))
                    DispatchQueue.main.async(execute: {
                        let responseDictionary = jsonResult as! [String:AnyObject]
//                        if responseDictionary["status"] as? Int != 200 {
//                            //                            print(responseDictionary["message"] as! String)
//                            completionHandler(nil,"Apologies something went wrong. Please try again later..." as AnyObject)
//                            //                            delegate.networkError(errorMessage: "no Records Found")
//                        }else{
//                            completionHandler(responseDictionary as AnyObject,nil)
//                        }
                    })
                }catch{
                    DispatchQueue.main.async(execute: {
                        completionHandler(nil,"Apologies something went wrong. Please try again later..." as AnyObject)
                    })
                }
//            }
            
        }
        task.resume()
    }

}
