//
//  DetailSlowandItemTVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/16.
//

import UIKit

class DetailSlowandItemTVC: UITableViewCell {
    static let identifier = "DetailSlowandItemTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var hashtagLabel: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var moreItemButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailSlowandItemTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailItemCVC.identifier, for: indexPath) as? DetailItemCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension DetailSlowandItemTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 41 - 10) / 3
        return CGSize(width: width, height: 167)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 21, bottom: 36, right: 20)
    }
}

// MARK: - UI
extension DetailSlowandItemTVC {
    private func setUI() {
        setCollectionView()
        setLabel()
        setImage()
        setButton()
    }
    
    private func setCollectionView() {
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
        let itemNib = UINib(nibName: DetailItemCVC.identifier, bundle: nil)
        itemCollectionView.register(itemNib, forCellWithReuseIdentifier: DetailItemCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "이 마켓의 다른 상품들이에요"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        storeLabel.text = "슬로우앤드"
        storeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        storeLabel.textColor = .ablyDarkGray
        
        hashtagLabel.text = "#20대 #모던 미니멀 #심플베이직"
        hashtagLabel.font = .systemFont(ofSize: 12, weight: .medium)
        hashtagLabel.textColor = .ablyGray
    }
    
    private func setImage() {
        // MARK: - asset 가져온 다음에 넣어주기
        storeImageView.image = UIImage(named: "storeprofile")
        moreItemButton.setImage(UIImage(named: "button"), for: .normal)
    }
    
    private func setButton() {
        moreButton.setTitle("마켓 상품 더 보기", for: .normal)
        moreButton.setTitleColor(.ablyBlack, for: .normal)
        moreButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.ablyMediumGray.cgColor
        moreButton.layer.cornerRadius = 10
    }
}

