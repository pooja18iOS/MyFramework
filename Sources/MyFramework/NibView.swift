//
//  NibView.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import UIKit

protocol ViewFromNib {}

extension ViewFromNib {
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
    static func view() -> Self? {
        let objects = self.nib.instantiate(withOwner: nil, options: nil)
        return objects.first as? Self
    }
    
    static func viewController<T: UIViewController>() -> T? {
        return T(nibName: nibName, bundle: nil)
    }
}

protocol ViewControllerFromNib: ViewFromNib {}

extension ViewControllerFromNib {
    static func viewController<T: UIViewController>() -> T? {
        return T(nibName: nibName, bundle: nil)
    }
}

protocol ViewControllerFromStoryboard {
    static var storyboardName: String { get }
}

extension ViewControllerFromStoryboard {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    static func viewController() -> Self? {
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self
    }
    
}
