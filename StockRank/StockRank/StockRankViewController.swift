//
//  StockRankViewController.swift
//  StockRank
//
//  Created by KimMinSeok on 1/12/24.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList:[StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    // Data, Presentation, Layout
    // Data -> 어떤 데이터?
    // Presentation -> 셀을 어떻게 표현?
    // Layout -> 셀을 어떻게 배치?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dataSource 와 delegate는 프로토콜, Data, Presentation
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

//DataSource 부분
extension StockRankViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        """
        ?는 캐스팅 한거  실패시 else 동작
        casting
        남자 사람
        남자 : 사람
        let joon = Namja()
        let joon = Saram()
        
        준이 남자인지 물어보는거
        joon as? Namja
        
        gaurd let nam = joon as? Namja else{
            군대 X
            return
        }
        군대 O
        
        
        gaurd <꼭 참이어야 하는 조건> else{
            return ~~~
        }
        """
       
        // 혹시 StockRankCollectionViewCell 인지 물어보고 casting 안되면 UICollectionViewCell()
        // casting 되면 데이터 업데이트 해서 cell 동작
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        return cell
    }

}

//Delegate 부분
extension StockRankViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionview
        // 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
        
    }
}
