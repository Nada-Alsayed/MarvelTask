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
    @IBOutlet weak var collapsedView: UIView!
    
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var creatorRole: UILabel!
    @IBOutlet weak var creatorName: UILabel!
    @IBOutlet weak var imageEx: UIImageView!
    @IBOutlet weak var titleEx: UILabel!
    
    static var cellID = String(describing: TableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
    
    }
    
    func configureCollapsedView(with movie: Result) {
        
        let myImgURL = "\(movie.thumbnail?.path ?? "").\(movie.thumbnail?.thumbnailExtension?.rawValue ?? "")"
        label.text = movie.title
        img?.kf.setImage(with: URL(string: myImgURL))
        
    }
    
    func configureExpandedView(with movie: Result) {
        let myImgURL = "\(movie.thumbnail?.path ?? "").\(movie.thumbnail?.thumbnailExtension?.rawValue ?? "")"
        var creatorName = "Not Available"
        var creatorRole = "Not Available"
        if let firstCreator = movie.creators?.items?.first {
            creatorName = firstCreator.name ?? "Not Available"
            creatorRole = firstCreator.role ?? "Not Available"
        }
        titleEx.text = movie.title
        imageEx?.kf.setImage(with: URL(string: myImgURL))
        price.text = "\(movie.prices?[0].price ?? 0.0) LE"
        format.text = movie.format
        guard movie.creators?.items != nil else { return }
        self.creatorName.text = creatorName
        self.creatorRole.text = creatorRole
    }
  
//    override var frame: CGRect{
//        get{
//            return super.frame
//        }
//        set(newFrame){
//            var frame = newFrame
//            frame.origin.x += 8
//            frame.size.width -= 2 * 8
//            frame.origin.y += 8
//            frame.size.height -= 2 * 8
//            super.frame = frame
//        }
//    }
}
