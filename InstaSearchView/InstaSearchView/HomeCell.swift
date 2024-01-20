//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by KimMinSeok on 1/20/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImgView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImgView.image = nil
    }
    
    func configure(_ imageName: String){
        thumbnailImgView.image = UIImage(named: imageName)
    }
}
