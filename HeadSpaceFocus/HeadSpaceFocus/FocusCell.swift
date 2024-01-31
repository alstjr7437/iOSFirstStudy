//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by KimMinSeok on 1/29/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus){
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        thumbnailImgView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
        
    }
}
