//
//  TableViewCell.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        // Apply corner radius
        containerView.layer.cornerRadius = 20
        img.layer.cornerRadius = 20
        layer.masksToBounds = true
        // Apply shadow
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 5
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
