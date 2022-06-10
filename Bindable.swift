//
//  Bindable.swift
//  SwiftMVVM-Binding
//
//  Created by Dilip Kosuri on 2022-06-09.
//

import Foundation
/// Always observable or binder class will have both value and observer
/// an observer acts as a listener and the value will set the value
/// Bind --> Observer will listen and --> return the value
class Bindable<T> {

    /// Whenever the value is set, the observer/listener is called
    var value: T {
        didSet {
            observer?(value)
        }
    }
    var observer: ((T) -> ())?

    init( _ value: T) {
        self.value = value
    }

    /// This function below acts as a subscripion which will allow the view model to listen to the changes being performed
    func bind(observer: @escaping (T?)-> ()) {
        self.observer = observer
    }
}
