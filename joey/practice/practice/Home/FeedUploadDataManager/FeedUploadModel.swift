//
//  FeedUploadModel.swift
//  practice
//
//  Created by 유탁 on 5/9/22.
//

import Foundation

struct FeedUploadModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
}
