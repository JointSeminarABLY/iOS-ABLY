//
//  DetailVC.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/05/15.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    private var bottomView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        return view
    }()
    
    private var buyingButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .ablyBlack
        button.setTitle("구매하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        
        return button
    }()
    private var heartImage: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(named: "iconHeartOutline")
        return heartImage
    }()
    private var heartLabel: UILabel = {
       let label = UILabel()
        label.text = "5.3만"
        label.textColor = .ablyRed
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    private var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icBack"), for: .normal)
        button.addTarget(self, action: #selector(touchUpBack), for: .touchUpInside)
        return button
    }()
    private var searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icSearchwhite")
        return image
    }()
    private var bagImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icMybagwhite")
        return image
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerXib()
        setDetailVC()
        setBottomViewLayout()
        setHeaderViewLayout()
    }
    
    private func registerXib(){
        let topNib = UINib(nibName: DetailTopTableViewCell.identifier, bundle: nil)
        detailTableView.register(topNib, forCellReuseIdentifier: DetailTopTableViewCell.identifier)
        
        let secondNib = UINib(nibName: DetailSecondTableViewCell.identifier, bundle: nil)
        detailTableView.register(secondNib, forCellReuseIdentifier: DetailSecondTableViewCell.identifier)
        
        let thirdNib = UINib(nibName: DetailThirdTableViewCell.identifier, bundle: nil)
        detailTableView.register(thirdNib, forCellReuseIdentifier: DetailThirdTableViewCell.identifier)
        
        let imageNib = UINib(nibName: DetailImageTVC.identifier, bundle: nil)
        detailTableView.register(imageNib, forCellReuseIdentifier: DetailImageTVC.identifier)
        
        let recommendNib = UINib(nibName: DetailRecommendItemTVC.identifier, bundle: nil)
        detailTableView.register(recommendNib, forCellReuseIdentifier: DetailRecommendItemTVC.identifier)

        let slowNib = UINib(nibName: DetailSlowandItemTVC.identifier, bundle: nil)
        detailTableView.register(slowNib, forCellReuseIdentifier: DetailSlowandItemTVC.identifier)
    }
    
    private func setDetailVC() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        detailTableView.estimatedRowHeight = 100
        detailTableView.contentInsetAdjustmentBehavior = .never
        
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setBottomViewLayout() {
        view.addSubview(bottomView)
        bottomView.addSubview(buyingButton)
        bottomView.addSubview(heartImage)
        bottomView.addSubview(heartLabel)
        
        bottomView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        buyingButton.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.top.equalTo(bottomView.snp.top).inset(12)
            make.trailing.equalTo(bottomView.snp.trailing).inset(28)
        }
        
        heartImage.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(28)
            make.trailing.equalTo(buyingButton.snp.leading).offset(-20)
        }
        
        heartLabel.snp.makeConstraints { make in
            make.centerX.equalTo(heartImage.snp.centerX)
            make.top.equalTo(heartImage.snp.bottom).offset(2)
        }
    }
    
    private func setHeaderViewLayout() {
        view.addSubview(backButton)
        view.addSubview(searchImage)
        view.addSubview(bagImage)
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(47)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(32)
        }
        
        bagImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(14)
            make.top.equalToSuperview().inset(48)
            make.height.width.equalTo(30)
        }
        
        searchImage.snp.makeConstraints { make in
            make.top.equalTo(bagImage)
            make.trailing.equalTo(bagImage.snp.leading).offset(2)
            make.height.width.equalTo(30)
        }
    }
    
    @objc
    func touchUpBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailTopTableViewCell.identifier, for: indexPath) as? DetailTopTableViewCell else {return UITableViewCell()}

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailSecondTableViewCell.identifier, for: indexPath) as? DetailSecondTableViewCell else {return UITableViewCell()}

            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailThirdTableViewCell.identifier, for: indexPath) as? DetailThirdTableViewCell else {return UITableViewCell()}

            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailImageTVC.identifier, for: indexPath) as? DetailImageTVC else {return UITableViewCell()}
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailRecommendItemTVC.identifier, for: indexPath) as? DetailRecommendItemTVC else {return UITableViewCell()}
            
            
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:  DetailSlowandItemTVC.identifier, for: indexPath) as? DetailSlowandItemTVC else {return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension DetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return UITableView.automaticDimension
        case 1:
            return UITableView.automaticDimension
        case 2:
            return UITableView.automaticDimension
        case 3:
            return (UIScreen.main.bounds.size.width)*(1360/375)
        case 4:
            return 730
        case 5:
            return 850
        default:
            return UITableView.automaticDimension
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.3, animations: {
            if scrollView.contentOffset.y > 0 {
                self.backButton.transform = CGAffineTransform(translationX: 0, y: -88)
                self.searchImage.transform = CGAffineTransform(translationX: 0, y: -88)
                self.bagImage.transform = CGAffineTransform(translationX: 0, y: -88)
            }
        })
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.3, animations: {
            if scrollView.contentOffset.y >= 0 {
                self.backButton.transform = .identity
                self.searchImage.transform = .identity
                self.bagImage.transform = .identity
            }
        })
    }
}
