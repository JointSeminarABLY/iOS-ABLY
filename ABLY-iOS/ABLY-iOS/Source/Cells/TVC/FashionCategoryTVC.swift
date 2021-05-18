//
//  FashionCategoryTVC.swift
//  ABLY-iOS
//
//  Created by 김윤서 on 2021/05/17.
//

import UIKit

protocol FoldingProtocol{
    func reloadTV()
}

class FashionCategoryTVC: UITableViewCell {
    static public let identifier : String = "FashionCategoryTVC"
    private var isFolded: Bool = false
    private var itemList: [String] = ["상의","아우터","원피스/세트","팬츠","스커트","트레이닝","가방","신발","패션소품","주얼리","디지털","완구/팬시","홈웨어","언더웨어","비치웨어"]
    
    var delegate : FoldingProtocol?
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var foldButton: UIButton!
    @IBOutlet weak var dividerView: UIView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBAction func onClickFoldButton(_ sender: Any) {
        isFolded = !isFolded
        setReloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCV()
        setUI()
        setReloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUI(){
        messageLabel.then{
            $0.text = "김솝트님, 원하시는 패션 카테고리를 선택해보세요"
            $0.font = UIFont.boldSystemFont(ofSize: 12)
        }
        
        dividerView.backgroundColor = .ablyLightGray
        
    }
    
    
    func setReloadData(){
        categoryCV.reloadData()
        
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (100/375)
        let cellHeight = cellWidth * (38/100)
        
        if isFolded{
            foldButton.setImage(UIImage(named: "icUp"), for: .normal)
            foldButton.tintColor = .black
            collectionViewHeightConstraint.constant = cellHeight*3 + 21*2
        }else{
            foldButton.setImage(UIImage(named: "icDown"), for: .normal)
            foldButton.tintColor = .black
            collectionViewHeightConstraint.constant = cellHeight*5 + 21*4
        }
        
        delegate?.reloadTV()
    }
}

extension FashionCategoryTVC: UICollectionViewDelegate{
    func setCV(){
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        categoryCV.delegate = self
        categoryCV.dataSource = self
        categoryCV.register(UINib(nibName: CategoryItemCVC.idenetifier, bundle: nil), forCellWithReuseIdentifier: CategoryItemCVC.idenetifier)
        categoryCV.isScrollEnabled = false
        
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
        cell.itemButton.categoryType = .fashion
        cell.itemButton.setUI()
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
