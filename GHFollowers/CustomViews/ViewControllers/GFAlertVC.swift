//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import UIKit
import SnapKit

class GFAlertVC: UIViewController {

    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    let padding : CGFloat = 20
    
    var alertTitle : String?
    var message : String?
    var buttonTitle : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    

    init(alertTitle: String?, message: String?, buttonTitle: String? ) 
    {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainerView()
    {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
        
    }
    
    func configureTitleLabel()
    {
        containerView.addSubview(titleLabel)
        titleLabel.text = self.alertTitle ?? "Something went wrong"
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(padding)
            make.leading.trailing.equalTo(containerView).inset(padding)
            make.height.equalTo(28)

        }
    }
    
    func configureActionButton()
    {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView).offset(-padding)
            make.leading.trailing.equalTo(containerView).inset(padding)
            make.height.equalTo(44)

        }
    }
    
    func configureMessageLabel()
    {
        containerView.addSubview(messageLabel)
        
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        messageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(actionButton).offset(-12)
            make.top.equalTo(titleLabel).offset(8)
            make.leading.trailing.equalTo(containerView).inset(padding)

        }
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
}
