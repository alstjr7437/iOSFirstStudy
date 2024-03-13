//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // Combine
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    var subscriptions = Set<AnyCancellable>()
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        bind()
        
    }
    
    // CollectionView Data 설정해주는 것
    private func bind(){
        // input : 사용자 인풋을 받아서, 처리해야할 것
        // - item 선택 되었을때 처리
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                vc.framework.send(framework)
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        // output : data, state 변경에 따라서, UI 업데이트 할 것
        // - items 세팅이 되었을때 컬렉션뷰를 업데이트
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
                self.applySectionItems(list)
        }.store(in: &subscriptions)
        
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main){
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    // CollectionView Presentation, Layout 설정주는 것
    private func configureCollectionView(){
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        // layer
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
    }
    
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count:   3)
        groupLayout.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = items.value[indexPath.item]
//        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
        didSelect.send(framework)
    }
}
