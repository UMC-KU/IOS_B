//
//  FeedUploadDataManager.swift
//  practice
//
//  Created by 유탁 on 5/9/22.
//

import Foundation
import Alamofire

class FeedUploadDataManager {
    
    func post(_ viewController: HomeViewController, _ parameters: FeedUploadInput) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil)
            .validate().responseDecodable(of: FeedUploadModel.self) { response in
                switch response.result {
                case .success(let result):
                    if result.isSuccess{
                        print("성공")
                    } else {
                        print(result.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
}
