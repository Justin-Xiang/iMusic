//
//  SubViewController.swift
//  iMusic
//
//  Created by JustinXiang on 2021/01/17.
//  Copyright © 2021 JustinXiang. All rights reserved.
//

import UIKit

class SubviewController: UIViewController {
    
    var viewControllerTitle: String?
    
    init(_ viewControllerTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerTitle = viewControllerTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = viewControllerTitle
    }
}
