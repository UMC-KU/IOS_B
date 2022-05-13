//
//  UserFeedModel.swift
//  practice
//
//  Created by 유탁 on 5/10/22.
//

import Foundation

struct UserFeedModel: Decodable {

        let isSuccess: Bool?
        let code: Int?
        let message: String?
        let result: UserFeedModelResult?
}

struct UserFeedModelResult: Decodable {
    let _isMyFeed: Bool?
    let getUserInfo: GetUserInfo?
    let getUserPosts: [GetUserPost]?

}

struct GetUserInfo: Decodable {
        let userIdx: Int?
        let nickName: String?
        let name: String?
        let profileImgUrl: String?
        let website: String?
        let introduction: String?
        let followerCount: Int?
        let followeeCount: Int?
        let postCount: Int?
}

struct GetUserPost: Decodable {
    let postIdx: Int?
    let postImgUrl: String?
}
