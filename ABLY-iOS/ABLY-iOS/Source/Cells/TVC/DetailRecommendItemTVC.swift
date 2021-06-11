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
    
    var items: [Onepiece] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailRecommendItemTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        setData()
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailItemCVC.identifier, for: indexPath) as? DetailItemCVC else {
            return UICollectionViewCell()
        }
        
        let row = items[indexPath.row]
        dump(row)
        cell.cellConfigure(image: row.image, discount: row.discount, price: String(row.price), item: row.image)
        
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
        requestItems { onepieces in
            self.items.append(contentsOf: onepieces)
        }
    }
    
}

extension DetailRecommendItemTVC {
    private func requestItems(completion: @escaping ([Onepiece]) -> Void){
        DetailService.shared.fetchOnepiece { result in
            print("result~")
            switch result{
            case .success(let onepieceModel):
                guard let response = onepieceModel as? OnepieceModel else {return}
                print("_______________________")
                print(response.data.count)
                completion(response.data)
            case .networkFail: break
            
            case .pathErr: break
                
            case .serverErr: break
                
            default :
                print("SERVER ERROR")
            }
        }
    }
}
