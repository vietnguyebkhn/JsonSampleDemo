//
//  Service.swift
//  JsonSampleDemo
//
//  Created by Nguyễn Việt on 8/13/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation
import  Alamofire

class Service {
    
    static let baseAPI = "https://jsonplaceholder.typicode.com/"
    
    //defineAPI
    //comments
    static let comments = "Comments"
    static func requestComment( complete: @escaping (_ error: Error?, _ resData: CommentListVO?) -> Void)  {
        let urlRequest = baseAPI + comments
        
        Alamofire.request(urlRequest, method: .get, parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(let JSON):
                Utils.SHOW_LOG(title: "response", content: response)
                var commentListData : CommentListVO?
                let result = JSON as? [[String: AnyObject]] ?? nil
                if result != nil {
                    commentListData = CommentListVO(response: result!)
                }
                
                complete(nil, commentListData)
                case .failure(let error):
                Utils.SHOW_LOG(content: error)
                
                complete(error, nil)
            }
        }
    }
    }
    

