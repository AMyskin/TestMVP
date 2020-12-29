//
//  MainViewPresenter.swift
//  TestMVP
//
//  Created by Alexander Myskin on 27.12.2020.
//

import UIKit



final class MainViewPresenter {
 
    weak var view: (UIViewController & MainViewInput)?

    private let networkService = NetworkService.shared
    


}
extension MainViewPresenter: MainViewOutput {
    func viewDidSelectTab(_ comment: TestComment){
    let appDetailVC = AppDetalVC(comment: comment)
    self.view?.navigationController?.pushViewController(appDetailVC, animated: true)

    }
    
    func showResult(){
        networkService.getCommets{ [weak self] (commets)  in
            self?.view?.commets = commets
        }
    }
}
