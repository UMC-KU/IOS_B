//
//  FeedUploadDataManager.swift
//  Catstagram
//
//  Created by 이민아 on 2022/05/10.
//

import Alamofire

class FeedUploadDataManager{
    func feedUploadDataManager(_ viewController: HomeViewController, _ parameter: FeedUploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts",
                   method: .post,
                   parameters: parameter,
                   encoder:JSONParameterEncoder.default, headers: nil)
            .validate()
            .responseDecodable(of: FeedUploadModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print(result)
                } else {
                
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
