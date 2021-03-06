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

extension DetailSlowandItemTVC: UICollectionViewDataSource {
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
        titleLabel.text = "??? ????????? ?????? ??????????????????"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        storeLabel.text = "???????????????"
        storeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        storeLabel.textColor = .ablyDarkGray
        
        hashtagLabel.text = "#20??? #?????? ????????? #???????????????"
        hashtagLabel.font = .systemFont(ofSize: 12, weight: .medium)
        hashtagLabel.textColor = .ablyGray
    }
    
    private func setImage() {
        storeImageView.image = UIImage(named: "ellipse11")
        moreItemButton.setTitle("?????? ????????????", for: .normal)
        moreItemButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        moreItemButton.setImage(UIImage(named: "icMoresmall"), for: .normal)
    }
    
    private func setButton() {
        moreButton.setTitle("?????? ?????? ??? ??????", for: .normal)
        moreButton.setTitleColor(.ablyBlack, for: .normal)
        moreButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.ablyMediumGray.cgColor
        moreButton.layer.cornerRadius = 10
    }
    
    private func setData() {
        items.append(contentsOf: [
            Item(image: "rectangle3210", discount: 10, price: "36,000", store: "????????????", item: "????????? ?????????-denim.ts", review: 10, satisfaction: 100),
            Item(image: "rectangle3211", discount: 15, price: "16,000", store: "?????????", item: "?????? ?????? ??????????????????", review: 49, satisfaction: 91),
            Item(image: "rectangle3212", discount: 20, price: "13,900", store: "SONA", item: "????????????????????????(TR)", review: 52, satisfaction: 96),
            Item(image: "rectangle3213", discount: 24, price: "14,500", store: "??????", item: "?????? ???????????? ?????? ?????? ???????????????(OP)", review: 37, satisfaction: 98),
            Item(image: "rectangle3214", discount: 30, price: "8,900", store: "dear.my", item: "?????? ????????? ???????????? ?????????(T)", review: 12, satisfaction: 78),
            Item(image: "rectangle3215", discount: 10, price: "36,000", store: "????????????", item: "????????? ?????????-denim.ts", review: 10, satisfaction: 100),
            Item(image: "rectangle3216", discount: 15, price: "16,000", store: "?????????", item: "?????? ?????? ??????????????????", review: 49, satisfaction: 91),
            Item(image: "rectangle3218", discount: 10, price: "13,900", store: "SONA", item: "????????????????????????(TR)", review: 52, satisfaction: 96),
            Item(image: "rectangle3213", discount: 24, price: "14,500", store: "??????", item: "?????? ???????????? ?????? ?????? ???????????????(OP)", review: 37, satisfaction: 98),
            Item(image: "rectangle3214", discount: 50, price: "8,900", store: "dear.my", item: "?????? ????????? ???????????? ?????????(T)", review: 12, satisfaction: 78)
        ])
    }
}

