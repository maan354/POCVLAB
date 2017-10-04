//
//  HomeCell.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var panelButton: UIView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var albumsButton: UIButton!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        panelButton.layer.borderColor = UIColor(rgb: 0x555555).cgColor
        panelButton.layer.borderWidth = 1
        panelButton.layer.cornerRadius = 6
        
        postButton.layer.borderWidth = 1
        postButton.layer.cornerRadius = 6
        postButton.layer.borderColor = UIColor(rgb: 0x555555).cgColor

        albumsButton.layer.borderWidth = 1
        albumsButton.layer.cornerRadius = 6
        albumsButton.layer.borderColor = UIColor(rgb: 0x555555).cgColor

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
