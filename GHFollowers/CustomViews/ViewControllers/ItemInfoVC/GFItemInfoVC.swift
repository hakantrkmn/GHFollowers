//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit
import SnapKit

protocol ItemInfoVCDelegate  : AnyObject {
    func didTapGithubProfile(for user : User)
    func didTapGetFollowers(for user : User)
}

class GFItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var user : User!
    weak var delegate : ItemInfoVCDelegate!
     
    init(user: User)
    {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButton()
    }
    
    func configureStackView()
    {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)

    }
    
    func configureActionButton()
    {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped()
    {
        
    }

    
    func configureBackgroundView()
    {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    func layoutUI()
    {
        view.addSubViews(stackView,actionButton)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(20)
            make.trailing.leading.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).offset(-20)
            make.trailing.leading.equalTo(view).inset(20)
            make.height.equalTo(44)
        }
        
    }

}
