//
//  AlbumsCells.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class AlbumsCells: UITableViewCell {

    @IBOutlet weak var getPhotoButton: UIButton!
    @IBOutlet weak var titleAlbumLabel: UILabel!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var artiste: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.panelView.layer.borderWidth = 1
        self.panelView.layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        self.panelView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
