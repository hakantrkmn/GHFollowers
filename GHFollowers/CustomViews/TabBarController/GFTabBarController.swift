//
//  GHTabBarController.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 5.01.2024.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC() , createFavoritesNC()]

        // Do any additional setup after loading the view.
    }
   
    
    
    func createSearchNC () -> UINavigationController
    {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC () -> UINavigationController
    {
        let favoritesVC = FavoritesListVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
    }
    

}
