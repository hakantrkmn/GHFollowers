//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import UIKit


enum UIHelper
{
    
    static func createThreeColumnFlowLayout(in view : UIView) -> UICollectionViewFlowLayout
    {
        let width = view.frame.width
        let padding : CGFloat = 12
        let minimumItemSpacing : CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return layout
    }
}
