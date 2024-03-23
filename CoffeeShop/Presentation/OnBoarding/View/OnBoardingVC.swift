//
//  OnBoardingVC.swift
//  CoffeeShop
//
//  Created by Nihad Allahveranov on 23.03.24.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    private lazy var imageTitle: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "OnBoardingCoffee")
        imgView.contentMode = .scaleToFill
        self.view.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Coffee so good, your taste buds will love it."
        lbl.font = UIFont(name: "Sora-SemiBold", size: 32)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var subTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "The best grain, the finest roast, the powerful flavor."
        lbl.font = UIFont(name: "Sora-Regular", size: 14)
        lbl.textColor = .myLightText
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.addArrangedSubview(titleLbl)
        stack.addArrangedSubview(subTitleLbl)
        self.view.addSubview(stack)
        
        return stack
    }()
    
    private lazy var doneBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.backgroundColor = .myLightText
        btn.setTitle("Get Started", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Sora-SemiBold", size: 16)
        btn.addTarget(self, action: #selector(tappedDoneBtn), for: .touchUpInside)
        self.view.addSubview(btn)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        self.view.backgroundColor = .black
    }
    
    @objc
    private func tappedDoneBtn() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = ViewController()
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionCrossDissolve, 
                              animations: nil,
                              completion: nil)
        }
    }
    
    private func setupViews() {
        NSLayoutConstraint.activate([
            imageTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -16),
            imageTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -16),
            imageTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16),
            imageTitle.heightAnchor.constraint(equalToConstant: (self.view.frame.size.height / 3) * 2),
            
            doneBtn.heightAnchor.constraint(equalToConstant: 64),
            doneBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            doneBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            doneBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
            textStackView.bottomAnchor.constraint(equalTo: self.doneBtn.topAnchor, constant: -48),
            textStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 42),
            textStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -42)
        ])
    }
    
}
