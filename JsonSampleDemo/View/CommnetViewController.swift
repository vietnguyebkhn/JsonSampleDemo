//
//  CommnetViewController.swift
//  JsonSampleDemo
//
//  Created by Nguyễn Việt on 8/13/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class CommnetViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet weak var mViewTable: UITableView!
    var commentList: CommentListVO?
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commentList != nil {
       return commentList!.list.count
    }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.setData(data: commentList!.list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func requestComment() {
        Service.requestComment() {[weak self] (error, dataResponse) in
            guard let strongSelf = self else {
                return
            }
            
            if error != nil {
                let alert = UIAlertController(title: "Thong bao", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dong y", style: .cancel, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
                
            } else {
                strongSelf.commentList = dataResponse
                strongSelf.mViewTable.reloadData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mViewTable.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        mViewTable.separatorStyle = .none
        requestComment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestComment()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
