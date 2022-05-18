//
//  FeedUploadModel.swift
//  week05
//
//  Created by 맥프로 on 2022/05/11.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?

}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
