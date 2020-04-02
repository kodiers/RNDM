//
//  CommentCell.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 03.04.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet private weak var usernameLbl: UILabel!
    @IBOutlet private weak var timestampLbl: UILabel!
    @IBOutlet private weak var commentLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(comment: Comment) {
        self.usernameLbl.text = comment.username
        self.commentLbl.text = comment.commentTxt
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        self.timestampLbl.text = timestamp
    }

}
