//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by KimMinSeok on 1/16/24.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //storyboard에서 깨어날 때
    override func awakeFromNib() {
        super.awakeFromNib()
        // 한줄로 변경
        nameLabel.numberOfLines = 1
        
        //폰트에 맞게 크기 변경
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework){
        thumbnailImgView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
