//
//  AnimalTableViewCell.swift
//  LazyLoading&Caching
//
//  Created by Maliks on 12/09/2023.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTitle: LazyImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
