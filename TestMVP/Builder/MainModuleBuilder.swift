//
//  MainModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 27/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class MainModuleBuilder {
    
    static func build() -> UIViewController {

        let presenter = MainViewPresenter()
        let view = MainViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
}
