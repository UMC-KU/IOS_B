//
//  FeedUploadDataManager.swift
//  CatStargram
//
//  Created by 황유란 on 2022/05/09.
//

import Alamofire

class FeedUploadDataManager{
    func post(_ viewController : HomeViewController, _ parameter:FeeduploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeeduploadModel.self){ response in
            switch response.result{
            case .success(let result):
                if(result.isSuccess){
                    print("성공")
                    print(result)
                }
                else{
                    
                }
            
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
