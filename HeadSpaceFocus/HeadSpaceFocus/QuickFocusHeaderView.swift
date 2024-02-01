//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by KimMinSeok on 2/1/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String){
        titleLabel.text = title
    }
    
}
