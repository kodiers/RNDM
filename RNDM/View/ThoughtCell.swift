//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 27.03.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {
    
    @IBOutlet private weak var usernameLbl: UILabel!
    @IBOutlet private weak var timestampLbl: UILabel!
    @IBOutlet private weak var thoughtTxtLbl: UILabel!
    @IBOutlet private weak var likesImg: UIImageView!
    @IBOutlet private weak var likesNumLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(thought: Thought) {
        self.usernameLbl.text = thought.username
        self.thoughtTxtLbl.text = thought.thoughtTxt
        self.likesNumLbl.text = String(thought.numLikes)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        self.timestampLbl.text = timestamp
    }

}
