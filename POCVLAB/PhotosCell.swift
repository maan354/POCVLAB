//
//  PhotosCell.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class PhotosCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageBox: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
