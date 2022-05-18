//
//  FeedUploadInput.swift
//  practice
//
//  Created by 유탁 on 5/9/22.
//

import Foundation

struct FeedUploadInput: Encodable {
    var content: String?
    var postImgsUrl: [String]?
}
