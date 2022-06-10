//
//  ReceiveInfoVC.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import UIKit

class ReceiveInfoVC: UIViewController {

    @IBOutlet weak var detail1: UILabel!
    @IBOutlet weak var detail2: UILabel!
    @IBOutlet weak var detail3: UILabel!

    private var viewModel = ReceiveInfoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.receiveInfo()
    }

    private func setupBinders() {
        viewModel.completeMessage.bind { [weak self] result in
            if let model = result as? InfoModel {
                self?.detail1.text = model.info1
                self?.detail2.text = model.info2
                self?.detail3.text = model.info3
            } else {
                print("The data is not received from previous navigation flow")
            }
        }
    }
}
