//
//  CommentTableViewCell.swift
//  JsonSampleDemo
//
//  Created by Nguyễn Việt on 8/13/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var mBodyLb: UILabel!
    @IBOutlet weak var mEmailLb: UILabel!
    @IBOutlet weak var mNameLb: UILabel!
    func setData(data: CommentVO) {
        mNameLb.text = data.name
        mEmailLb.text = data.email
        mBodyLb.text = data.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
