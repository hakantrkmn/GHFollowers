//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 2.01.2024.
//

import UIKit
import SnapKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews = [UIView]()
    var username : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
        
    }
    
    func getUserInfo()
    {
        NetworkManager.shared.getUserInfo(for: username) {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let user):
                DispatchQueue.main.async{
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                    self.add(childVC: GFRepoItemVC(user: user), to: self.itemViewOne)
                    self.add(childVC: GHFollowerItemVC(user: user), to: self.itemViewTwo)
                    self.dateLabel.text = "DAte to enter"
                }
            case .failure(let failure):
                print(failure)
                
            }
        }
    }
    
    func layoutUI()
    {
        itemViews = [headerView,itemViewOne,itemViewTwo,dateLabel]
        
        for itemView in itemViews
        {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view)
            make.height.equalTo(180)
        }
        itemViewOne.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.trailing.leading.equalTo(headerView).inset(20)
            make.height.equalTo(140)
        }
        itemViewTwo.snp.makeConstraints { make in
            make.top.equalTo(itemViewOne.snp.bottom).offset(20)
            make.trailing.leading.equalTo(headerView).inset(20)
            make.height.equalTo(140)
        }
        dateLabel.snp.makeConstraints { make in
            make.trailing.leading.equalTo(headerView).inset(20)
            make.top.equalTo(itemViewTwo.snp.bottom).offset(20)
            make.height.equalTo(18)

        }
    }
    
    func configureViewController()
    {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done , target : self , action : #selector(dismissVC) )
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func add(childVC : UIViewController, to containerView  : UIView)
    {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC()
    {
        dismiss(animated: true)
    }
    
}
