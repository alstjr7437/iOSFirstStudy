//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by KimMinSeok on 1/12/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    // uicomponent 연결
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var compantImgView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    // uicomponent 에 데이터 업데이트 하는 코드를 넣자.
    func configure(_ stock: StockModel){
        rankLabel.text = "\(stock.rank)"
        compantImgView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = "\(stock.name)"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
//        let color: UIColor
//        if stock.diff > 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    // 숫자 표시 위한 코드
    func convertToCurrencyFormat(price: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}
