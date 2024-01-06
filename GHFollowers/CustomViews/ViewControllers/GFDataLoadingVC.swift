//
//  GFDataLoadingVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 5.01.2024.
//

import UIKit

class GFDataLoadingVC: UIViewController {

    var containerView : UIView!

    func showLoadingView()
    {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {self.containerView.alpha = 0.8}
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }
        
        
        activityIndicator.startAnimating()
    }
    
   
    
    func dismissLoadingView()
    {
        DispatchQueue.main.async{
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
        
    }
    
    func showEmptyStateView(with message : String, in view : UIView)
    {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }

}
