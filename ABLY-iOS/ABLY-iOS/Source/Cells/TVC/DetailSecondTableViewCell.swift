//
//  DetailSecondTableViewCell.swift
//  ABLY-iOS
//
//  Created by 한울 on 2021/05/21.
//

import UIKit

class DetailSecondTableViewCell: UITableViewCell {
    public static let identifier = "DetailSecondTableViewCell"
    
    @IBOutlet weak var ScrollCollection: UICollectionView!
    @IBOutlet weak var reviewnumberLabel: UILabel!
    @IBOutlet weak var purchasestateLabel: UILabel!
    @IBOutlet weak var reviewstateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ScrollCollection.register(UINib(nibName: "ScrollcardCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ScrollcardCollectionViewCell")
        
        ScrollCollection.delegate = self
        ScrollCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension DetailSecondTableViewCell : UICollectionViewDelegate
{
    
}

extension DetailSecondTableViewCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollcardCollectionViewCell", for: indexPath) as? ScrollcardCollectionViewCell else {return UICollectionViewCell() }
        
        cardCell.setData(imageName: "rectangle322", state: "만족해요", description: "솔직히 기대 안 했는데 핏 좋고 정말 맘에 들었어요 또 얇아서 여름에도 잘 입고 있습니다.")
        
        return cardCell
    }
    
    
}

extension DetailSecondTableViewCell : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // this is size asdfasdfdy
        
        return CGSize(width: 257, height: 89)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 30, left: 23, bottom: 26, right: 23)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}
