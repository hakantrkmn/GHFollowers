//
//  GHFollowerItemVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit

class GHFollowerItemVC : GFItemInfoVC
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureItems()
    }
    
    func configureItems()
    {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Github Followers")
    }
}
