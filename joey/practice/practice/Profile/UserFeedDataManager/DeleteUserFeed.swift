//
//  UserFeedDelete.swift
//  practice
//
//  Created by 유탁 on 5/10/22.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
