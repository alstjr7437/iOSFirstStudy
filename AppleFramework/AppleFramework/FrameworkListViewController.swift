//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by KimMinSeok on 1/16/24.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 네비게이션 title 설정
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        // 의도한 사이즈대로 하려면
        // 빼보면 이상해짐
        // 아니면 collectionView에서 size를 automatic을 풀어줌(컴퓨터가 자동으로 사이즈 계산해서 넣어주기 때문)
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FrameworkListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 여백 주기
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
        
//        // 2열일때 계산
//        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2) / 2
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
//        
//        // 4열일때 계산
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 4
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
    }
    
    //https://k-elon.tistory.com/26
    //지정된 섹션의 셀 사이의 최소간격을 반환하는 메서드.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //지정된 섹션의 행 사이 간격 최소 간격을 반환하는 메서드. scrollDirection이 horizontal이면 수직이 행이 되고 vertical이면 수평이 행이 된다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// cell 부분 클릭시 동작 이벤트
extension FrameworkListViewController: UICalendarViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print("selected -> \(framework.name)")
    }
}

