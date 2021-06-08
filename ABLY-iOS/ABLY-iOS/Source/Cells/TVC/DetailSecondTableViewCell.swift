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
        
        cardCell.setData(imageName: "rectangle322", state: "happy", description: "HI ~~~")
        
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
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}
