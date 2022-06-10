//
//  ReceiveInfoViewModel.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import Foundation

final class ReceiveInfoViewModel {
    var completeMessage:Bindable<InfoModel?> = Bindable(nil)

    func receiveInfo() {
        let information = Worker.shared.getInfo()
        self.completeMessage.value = InfoModel(info1: information.info1, info2: information.info2, info3: information.info3)
    }
}
