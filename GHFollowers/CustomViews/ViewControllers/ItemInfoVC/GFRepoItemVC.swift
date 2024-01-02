//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit

class GFRepoItemVC : GFItemInfoVC
{
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        configureItems()
    }
    
    func configureItems()
    {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
}
