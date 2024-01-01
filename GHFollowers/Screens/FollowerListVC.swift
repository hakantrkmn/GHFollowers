//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import UIKit

class FollowerListVC: UIViewController {

    var username : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            guard let followers = followers else
            {
                self.presentGFAlertOnMainThread(title: "Bad Stuff", message: error!.rawValue, buttonTitle: "Ok")
                return
                
            }
            
            print(followers.count)
            print(followers)

        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    

}
