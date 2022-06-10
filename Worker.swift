//
//  Worker.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import Foundation

class Worker {
    static let shared = Worker()
    private var infoModel: InfoModel?


    private init() {}

    func sendInfo(info1: String, info2: String, info3: String, completion: @escaping (InfoModel?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if !info1.isEmpty && !info2.isEmpty && !info3.isEmpty {
                self?.infoModel = InfoModel(info1: info1, info2: info2, info3: info3)
                completion(self?.infoModel)
            } else {
                self?.infoModel = nil
                completion(nil)
            }
        }
    }

    func getInfo() -> InfoModel {
        return self.infoModel ?? InfoModel()
    }
}
