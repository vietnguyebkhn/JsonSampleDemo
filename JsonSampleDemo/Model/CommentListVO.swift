//
//  CommentListVO.swift
//  JsonSampleDemo
//
//  Created by Nguyễn Việt on 8/13/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class CommentListVO{
    var list: [CommentVO]
    
    init(response: [[String: AnyObject]]) {
        
        var listTemp = [CommentVO]()
        for item in response {
            listTemp.append(CommentVO.init(data: item))
        }
        self.list = listTemp
        Utils.SHOW_LOG(content: "Post list has ben inited")
    }
}
