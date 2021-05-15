//
//  MainHotRankTVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/15.
//

import UIKit

class MainHotRankTVC: UITableViewCell {
    static let identifier = "MainHotRankTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var hotRankCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MainHotRankTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainHotRankCVC.identifier, for: indexPath) as? MainHotRankCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MainHotRankTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 24) / 4
        return CGSize(width: width, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 26, left: 24, bottom: 26, right: 24)
    }
}

// MARK: - UI
extension MainHotRankTVC {
    private func setUI() {
        setCollectionView()
        setLabel()
        setImage()
        setView()
    }
    
    private func setCollectionView() {
        hotRankCollectionView.delegate = self
        hotRankCollectionView.dataSource = self
        
        let itemNib = UINib(nibName: MainHotRankCVC.identifier, bundle: nil)
        hotRankCollectionView.register(itemNib, forCellWithReuseIdentifier: MainHotRankCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "HOT 🔥 실시간 원피스 랭킹"
        titleLabel.font = .boldSystemFont(ofSize: 12)
    }
    
    private func setImage() {
        // MARK: - asset 가져온 다음에 넣어주기
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        medalImageView.image = UIImage(named: "medal")
    }
    
    private func setView() {
        bottomView.backgroundColor = .ablyLightGray
    }
}
