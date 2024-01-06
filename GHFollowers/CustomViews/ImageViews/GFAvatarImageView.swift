//
//  GHAvatarImageView.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder
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
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
  
}
