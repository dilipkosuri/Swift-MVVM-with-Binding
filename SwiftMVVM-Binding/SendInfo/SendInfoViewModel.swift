//
//  InfoViewModel.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import Foundation

class SendInfoViewModel {
    var sendInfoViewModelBinder: Bindable<InfoModel?> = Bindable(nil)

    func sendInfo(info1 address1: String, info2 address2: String, info3 address3: String) {
        Worker.shared.sendInfo(info1: address1, info2: address2, info3: address3) { [weak self] result in
            if let model = result {
                self?.sendInfoViewModelBinder.value = InfoModel(info1: model.info1, info2: model.info2, info3: model.info3)
            } else {
                self?.sendInfoViewModelBinder.value = nil
            }
        }
    }
}
