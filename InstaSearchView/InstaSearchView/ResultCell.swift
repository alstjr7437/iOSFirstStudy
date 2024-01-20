//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by KimMinSeok on 1/20/24.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImgView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImgView.image = nil
    }
    
    func configure(_ imageName: String){
        thumbnailImgView.image = UIImage(named: imageName)
    }
}
