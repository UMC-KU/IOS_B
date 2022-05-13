//
//  FeedAPIInput.swift
//  practice
//
//  Created by 유탁 on 5/9/22.
//

import Foundation

struct FeedAPIInput: Encodable {
    var limit: Int?
    var page: Int?
}
