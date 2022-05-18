//
//  FeedUploadModel.swift
//  CatStargram
//
//  Created by 황유란 on 2022/05/09.
//
struct FeeduploadModel : Decodable{
    var isSuccess: Bool
    var code : Int
    var message : String
    var result :FeedUploadResult
}

struct FeedUploadResult :Decodable{
    var postIdx:Int?
}
