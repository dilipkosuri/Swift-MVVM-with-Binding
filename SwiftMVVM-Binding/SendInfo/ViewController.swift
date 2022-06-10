//
//  ViewController.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var info1: UITextField!
    @IBOutlet weak var info2: UITextField!
    @IBOutlet weak var info3: UITextField!

    private var viewModel = SendInfoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        info1.text = ""
        info2.text = ""
        info3.text = ""
        /// set up binders here
        setupBinders()
        
    }

    private func setupBinders() {
        viewModel.sendInfoViewModelBinder.bind { [weak self] result in
            if result != nil {
                self?.goToHomePage()
            } else {
                print("There is some issue with binding")
            }
        }
    }

    private func goToHomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigateTOVC = storyboard.instantiateViewController(withIdentifier: "ReceiveInfoVC") as! ReceiveInfoVC
        self.navigationController?.pushViewController(navigateTOVC, animated: false)
    }

    @IBAction func onSendInfoButtonTap(_ sender: UIButton) {
        viewModel.sendInfo(info1: info1.text!, info2: info2.text!, info3: info3.text!)
    }
}

