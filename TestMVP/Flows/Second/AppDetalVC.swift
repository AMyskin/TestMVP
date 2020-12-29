//
//  AppDetalVC.swift
//  TestMVP
//
//  Created by Alexander Myskin on 27.12.2020.
//

import UIKit

class AppDetalVC: UIViewController {
    
    
    let comment: TestComment
    let labelemail = UILabel()
    let labelbody = UILabel()
    
    init(comment: TestComment){
        self.comment = comment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.labelbody.text = comment.body
        self.labelemail.text = comment.email
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        self.addLabelEmail()
        self.addLabelBody()
        self.setupConstraints()
    }
    
    private func addLabelEmail() {
        self.labelemail.translatesAutoresizingMaskIntoConstraints = false
        self.labelemail.textColor = UIColor.blue
        self.labelemail.textAlignment = .center
        self.view.addSubview(self.labelemail)
    }
    
    private func addLabelBody() {
        self.labelbody.translatesAutoresizingMaskIntoConstraints = false
        self.labelbody.textColor = UIColor.systemPink
        self.labelbody.numberOfLines = 0
        self.labelbody.textAlignment = .center
        self.view.addSubview(self.labelbody)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
       
            
            self.labelemail.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            self.labelemail.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.labelemail.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            self.labelbody.topAnchor.constraint(equalTo: self.labelemail.bottomAnchor, constant: 50),
            self.labelbody.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.labelbody.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            
            
            ])
    }
    
    
}
