//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    // AppleFramework에 Hashable
//    var dataSoutce: UICollectionViewDiffableDataSource<Section, AppleFramework>!
    var dataSoutce: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = AppleFramework
    
    enum Section {
        case main
    }
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
"""
diffable datasource -> presentation, data
    - presentation
snapshot
    - Data
compositional Layout
    - Layout
"""
        
        // Presentation, Data, Layout
        // Presentation
        dataSoutce = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            
//            let data = datalist[indexPath.item]
            cell.configure(itemIdentifier)
            return cell
        })
        
        // Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSoutce.apply(snapshot)
        
        // Layout
        collectionView.collectionViewLayout = layout()
    }
    
    //Layout
    private func layout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
