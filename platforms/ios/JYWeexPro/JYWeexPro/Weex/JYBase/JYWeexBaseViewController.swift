//
//  BaseViewController.swift
//  JYWeexPro
//
//  Created by Baird-weng on 2018/10/23.
//  Copyright © 2018年 JY. All rights reserved.
//

import UIKit
import WeexSDK
class JYWeexBaseViewController: UIViewController {
    var instance:WXSDKInstance!
    public var url: URL!
    private var weexView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initInstance()
        
        // Do any additional setup after loading the view.
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        instance?.fireGlobalEvent("viewDidAppear", params: nil)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        instance?.fireGlobalEvent("viewDidDisappear", params: nil)
    }
    func initInstance(){
        instance = WXSDKInstance()
        instance.viewController = self;
        instance.frame = self.view.frame
        instance.onCreate = {[weak self] (view) in
            self?.weexView?.removeFromSuperview()
            self?.weexView = view
        }
        instance?.onFailed = {[weak self](error) in
            #if DEBUG
            let ocError = error! as NSError
            let errMsg = """
            ErrorType:\(ocError.domain)
            ErrorCode:\(ocError.code)
            ErrorInfo:\(ocError.userInfo)
            """
            let alertController = UIAlertController(title: "render failed", message: errMsg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
            self?.present(alertController, animated: true, completion: nil)
            #endif
        }
        instance?.renderFinish = { [weak self] (view) in
            print("renderFinish...")
            self?.instance?.fireGlobalEvent("viewDidAppear", params: nil)
        }
        if(self.url != nil){
            self.instance?.render(with: self.url, options: nil, data: nil)
        }
    }
    func refreshWeex() {
        initInstance()
    }
    
    deinit {
        instance?.destroy()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
