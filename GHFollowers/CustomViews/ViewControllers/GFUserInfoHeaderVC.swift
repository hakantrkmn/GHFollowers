//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit
import SnapKit


class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user : User!
    
    init(user: User) 
    {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements()
    {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? ""
        bioLabel.text = user.bio ?? ""
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func layoutUI()
    {
        let padding : CGFloat = 20
        let textImagePadding :CGFloat = 12
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(padding)
            make.leading.equalTo(view.snp.leading).offset(padding)
            make.width.equalTo(90)
            make.height.equalTo(90)

        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
            make.height.equalTo(20)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.width.height.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
            make.height.equalTo(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.leading)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
            make.height.equalTo(60)

        }
    }

    func addSubViews()
    {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    

}
