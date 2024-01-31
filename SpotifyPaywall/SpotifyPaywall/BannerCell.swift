//
//  BannerCell.swift
//  SpotifyPaywall
//
//  Created by Minseok Kim on 2024/01/30.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 16
    }
    
    func configure(_ info: BannerInfo){
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        thumbnailImgView.image = UIImage(named: info.imageName)
    }
    
}
