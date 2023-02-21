import UIKit

@dynamicMemberLookup
open class BaseViewController<View: UIView>: UIViewController {
    
//    lazy var keyboardMonitor = KeyboardMonitor()
//
//    open var automaticKeyboardObserverControl: Bool { true }
    
    public subscript<T: UIView>(dynamicMember keyPath: KeyPath<View, T>) -> T {
        mainView[keyPath: keyPath]
    }
    
    public var mainView: View! { view as? View }
    
    override open func loadView() {
        self.view = View()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true

//        if let self = self as? KeyboardObserver {
//            keyboardMonitor.observer = self
//        }
    }

//    open override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        if let self = self as? KeyboardObserver, automaticKeyboardObserverControl {
//            keyboardMonitor.observer = self
//        }
//    }
//
//    open override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//
//        if let self = self as? KeyboardObserver, automaticKeyboardObserverControl {
//            keyboardMonitor.observer = self
//            self.keyboardWillHideWithFrame(.zero, duration: 0, options: [])
//        }
//    }
    
}
