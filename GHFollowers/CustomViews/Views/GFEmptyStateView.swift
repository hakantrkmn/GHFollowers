//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit
import SnapKit


class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) 
    {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message : String)
    {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure()
    {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(-150)
            make.leading.equalTo(self.snp.leading).offset(40)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(1.3)
            make.height.equalTo(self.snp.width).multipliedBy(1.3)
            make.trailing.equalTo(self.snp.trailing).offset(170)
            make.bottom.equalTo(self.snp.bottom).offset(40)
        }
        
    }
    
}
