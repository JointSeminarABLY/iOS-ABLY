//
//  FashionCategoryTVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

// MARK: - TODO : isFolded 값에 따라 셀 높이 조정
class FashionCategoryTVC: UITableViewCell {
    private var isFolded: Bool = false
    private var itemList: [String] = ["상의","아우터","원피스/세트","스커트","가방","신발","패션소품","주얼리","디지털","완구/팬시","홈웨어","언더웨어","비치웨어"]
    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var foldButton: UIButton!
    
    @IBAction func onClickFoldButton(_ sender: Any) {
        isFolded = !isFolded
        setCategoryItems()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCV()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUI(){
        messageLabel.then{
            $0.text = "김솝트님, 원하시는 패션 카테고리를 선택해보세요"
            $0.font = UIFont.boldSystemFont(ofSize: 12)
        }
    }
    
    func setCategoryItems(){
        if isFolded{
            foldButton.setImage(UIImage(named: "icDown"), for: .normal)
            
        }
        else{
            foldButton.setImage(UIImage(named: "icDown"), for: .normal)
        }
    }
    
}

extension FashionCategoryTVC: UICollectionViewDelegate{
    func setCV(){
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        categoryCV.delegate = self
        categoryCV.dataSource = self
        categoryCV.register(UINib(nibName: CategoryItemCVC.idenetifier, bundle: nil), forCellWithReuseIdentifier: CategoryItemCVC.idenetifier)
    }
}

extension FashionCategoryTVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFolded{
            return 9
        }else{
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCV.dequeueReusableCell(withReuseIdentifier: CategoryItemCVC.idenetifier, for: indexPath) as? CategoryItemCVC else {return UICollectionViewCell()}
        cell.setData(text: itemList[indexPath.row])
        return cell
    }
}

extension FashionCategoryTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (100/375)
        let cellHeight = cellWidth * (38/100)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    
}
