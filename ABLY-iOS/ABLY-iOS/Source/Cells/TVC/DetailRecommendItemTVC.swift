//
//  DetailRecommendItemTVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/16.
//

import UIKit

class DetailRecommendItemTVC: UITableViewCell {
    static let identifier = "DetailRecommendItemTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var items: [Item] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setData()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailRecommendItemTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailItemCVC.identifier, for: indexPath) as? DetailItemCVC else {
            return UICollectionViewCell()
        }
        let row = items[indexPath.item]
        cell.cellConfigure(image: row.image,
                           discount: row.discount ?? 0,
                           price: row.price,
                           item: row.item)
        return cell
    }
}

extension DetailRecommendItemTVC: UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 24, left: 21, bottom: 36, right: 20)
    }
}

// MARK: - UI
extension DetailRecommendItemTVC {
    private func setUI() {
        setCollectionView()
        setLabel()
        setButton()
        setView()
    }
    
    private func setCollectionView() {
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
        let itemNib = UINib(nibName: DetailItemCVC.identifier, bundle: nil)
        itemCollectionView.register(itemNib, forCellWithReuseIdentifier: DetailItemCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "이 상품들은 어때요?"
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    private func setButton() {
        moreButton.setTitle("상품 정보 펼쳐보기", for: .normal)
        moreButton.setTitleColor(.ablyBlack, for: .normal)
        moreButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.ablyMediumGray.cgColor
        moreButton.layer.cornerRadius = 10
    }
    
    private func setView() {
        bottomView.backgroundColor = .ablyLightGray
    }
    
    private func setData() {
        items.append(contentsOf: [
            Item(image: "rectangle3210", discount: 10, price: "36,000", store: "모코블링", item: "블루밍 티셔츠-denim.ts", review: 10, satisfaction: 100),
            Item(image: "rectangle3211", discount: 15, price: "16,000", store: "예냥냥", item: "빌즈 썸머 밴딩코튼팬츠", review: 49, satisfaction: 91),
            Item(image: "rectangle3212", discount: 20, price: "13,900", store: "SONA", item: "턴온트레이닝세트(TR)", review: 52, satisfaction: 96),
            Item(image: "rectangle3213", discount: 24, price: "14,500", store: "소현", item: "소피 배색카라 리본 체크 반팔원피스(OP)", review: 37, satisfaction: 98),
            Item(image: "rectangle3214", discount: 30, price: "8,900", store: "dear.my", item: "슬림 베이직 스퀘어넥 반팔티(T)", review: 12, satisfaction: 78),
            Item(image: "rectangle3215", discount: 10, price: "36,000", store: "모코블링", item: "블루밍 티셔츠-denim.ts", review: 10, satisfaction: 100),
            Item(image: "rectangle3216", discount: 15, price: "16,000", store: "예냥냥", item: "빌즈 썸머 밴딩코튼팬츠", review: 49, satisfaction: 91),
            Item(image: "rectangle3218", discount: 10, price: "13,900", store: "SONA", item: "턴온트레이닝세트(TR)", review: 52, satisfaction: 96),
            Item(image: "rectangle3213", discount: 24, price: "14,500", store: "소현", item: "소피 배색카라 리본 체크 반팔원피스(OP)", review: 37, satisfaction: 98),
            Item(image: "rectangle3214", discount: 50, price: "8,900", store: "dear.my", item: "슬림 베이직 스퀘어넥 반팔티(T)", review: 12, satisfaction: 78)
        ])
    }
}
