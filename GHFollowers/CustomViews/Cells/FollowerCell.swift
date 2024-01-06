//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import UIKit
import SnapKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero )
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) 
    {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower : Follower)
    {
        usernameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { image in
            if image != nil
            {
                DispatchQueue.main.async{
                    self.avatarImageView.image = image
                }
            }
        }
    }
    
    func configure()
    {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        let padding = 8
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(padding)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)

            make.height.equalTo(avatarImageView.snp.width)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(contentView).inset(padding)
            make.height.equalTo(20)
        }
    }
}
