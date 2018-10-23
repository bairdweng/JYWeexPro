//
//  ViewController.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/10/22.
//  Copyright © 2018 JY. All rights reserved.
//

import UIKit

class ViewController: JYWeexBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.url = JYJsFileManage.sing.getFullPath(fileName: "HelloWorld")
        self.refreshWeex()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

