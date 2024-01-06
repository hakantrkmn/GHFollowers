//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 30.12.2023.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered : Bool {!usernameTextField.text!.isEmpty}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        confiureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture()
    {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC()
    {
        guard isUserNameEntered else {
            self.presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who you are", buttonTitle: "Ok")
            return}
        
        usernameTextField.resignFirstResponder()
        let followerListVC = FollowerListVC(username: usernameTextField.text!)
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }

    
    func configureLogoImageView()
    {
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.ghLogo
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalTo(view)
            make.width.height.equalTo(200)
            
        }
    }
    
    func confiureTextField()
    {
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        
    }
    
    func configureCallToActionButton()
    {
        view.addSubview(callToActionButton)
        
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.trailing.equalTo(view).inset(50)
            make.height.equalTo(50)
        }
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
    }
    
    
    
    
}

extension SearchVC : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
        
    }
}
