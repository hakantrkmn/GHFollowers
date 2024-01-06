//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 5.01.2024.
//

import UIKit


extension UIView
{
    func addSubViews(_ views : UIView...)
    {
        for view in views
        {
            addSubview(view)
        }
    }
}
