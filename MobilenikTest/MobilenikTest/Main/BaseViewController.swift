//
//  BaseViewController.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loadingVC: LoadingIndicatorViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupBackButton() {
        let backButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-left"), style: .plain, target: self, action: #selector(self.backButtonClickedDismiss(sender:)))
        
        self.navigationItem.leftBarButtonItem  = backButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc func backButtonClickedDismiss(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Loading View
extension BaseViewController {
    func showLoading() {
        loadingVC = LoadingIndicatorViewController()
        add(loadingVC!)
        loadingVC?.view.frame = view.bounds
    }

    func showLoading(inside wiew: UIView) {
        loadingVC = LoadingIndicatorViewController()
        add(child: loadingVC!, container: wiew)
        loadingVC?.view.frame = wiew.bounds
    }

    func hideLoading() {
        loadingVC?.remove()
        loadingVC = nil
    }
}


// MARK: - Alert
extension BaseViewController {
    func displaySimpleAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

