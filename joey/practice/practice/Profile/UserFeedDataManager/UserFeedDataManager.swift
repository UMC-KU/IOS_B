//
//  UserFeedDataManager.swift
//  practice
//
//  Created by 유탁 on 5/10/22.
//

import Foundation
import Alamofire

class UserFeedDataManager {
    
    func getUserFeed(_ viewController: ProfileViewController, _ userId: Int = 2) {
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userId)",
                   method: .get,
                   parameters: nil)
            .validate().responseDecodable(
            of: UserFeedModel.self) { response in
                switch response.result {
                case .success(let result):
                    viewController.successFeedAPI(result)
                    print("성공", result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
   
    func deleteUserFeed(_ viewController: ProfileViewController, _ postIdx: Int) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil)
            .validate().responseDecodable(
            of: DeleteUserFeed.self) { response in
                switch response.result {
                case .success(let result):
                    viewController.successDeletePostAPI(result.isSuccess ?? false)
                    print("삭제 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
}
