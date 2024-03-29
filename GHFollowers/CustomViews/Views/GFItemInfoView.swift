//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit
import SnapKit


enum ItemInfoType
{
    case repos, gists, followers, following
}


class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)

    
    override init(frame: CGRect) 
    {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure()
    {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        
        symbolImageView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.width.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView)
            make.leading.equalTo(symbolImageView.snp.trailing).offset(12)
            make.trailing.equalTo(self)
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView.snp.bottom).offset(4)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(18)
        }
    }
    
    func set(itemInfoType : ItemInfoType , withCount count : Int)
    {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        
        countLabel.text = "\(count)"
    }
}
