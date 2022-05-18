//
//  DeleteUserFeed.swift
//  week05
//
//  Created by 맥프로 on 2022/05/11.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
