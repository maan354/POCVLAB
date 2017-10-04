//
//  PostCell.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var artisteName: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
