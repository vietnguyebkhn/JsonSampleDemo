//
//  ViewController.swift
//  JsonSampleDemo
//
//  Created by Nguyễn Việt on 8/13/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mCommentData : CommentListVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.requestComment {[weak self] (error, dataResponse) in
            guard let strongSelf = self else {
                return
            }
            
            if dataResponse != nil {
                strongSelf.mCommentData = dataResponse
                //                strongSelf.mLabel.text = dataResponse!.name
            } else if error != nil {
                let alert = UIAlertController(title: "Thong bao", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dong y", style: .cancel, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
                
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

