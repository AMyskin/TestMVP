//
//  ViewController.swift
//  TestMVP
//
//  Created by Alexander Myskin on 26.12.2020.
//

import UIKit

protocol MainViewInput: class {
    var commets: [TestComment] {get set}
}

protocol MainViewOutput: class {

    func showResult()
    func viewDidSelectTab(_ comment: TestComment)
}

class MainViewController: UIViewController, MainViewInput {
    
    private let presenter: MainViewOutput
    
    let tableView = UITableView()
    
    var commets = [TestComment](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - init
    
    init(presenter: MainViewOutput){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = UIColor.white
        
        addTableView()
        setupConstraints()
        presenter.showResult()
        
        
    }
    
    // MARK: - setupViews
    
    private func addTableView() {
        self.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.tableView.rowHeight = 72.0
        self.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isHidden = false
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
       
            
            self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            
            ])
    }
    
    // MARK: - Private Properties
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }


}
    //MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? AppCell else {
            return dequeuedCell
        }
        let model = commets[indexPath.row]
        self.configure(cell: cell, with: model)
        return cell
    }
    
    private func configure(cell: AppCell, with model: TestComment) {
   
        cell.titleLabel.text = "\(model.id)"
        cell.subtitleLabel.text = model.email
        
   
    }
    
    
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //ToDO
        let comment = commets[indexPath.row]
        self.presenter.viewDidSelectTab(comment)
    
    }
}



