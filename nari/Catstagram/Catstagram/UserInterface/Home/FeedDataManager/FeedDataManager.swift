//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by 이민아 on 2022/05/10.
//

import Alamofire

class FeedDataManager{
    func feedDataManager(_ viewController : HomeViewController, _ parameters: FeedAPIInput){
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result{
            case .success(let result):
                viewController.sucessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
