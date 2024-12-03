//
//  UIViewController+Extension.swift
//  E-Price
//
//  Created by Kavya Krishna K. on 30/01/2024.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func setStatusBarForDarkBackground(_ dark: Bool) {
        if dark {
            var preferredStatusBarStyle: UIStatusBarStyle {
                return .darkContent
            }
        } else {
            var preferredStatusBarStyle: UIStatusBarStyle {
                return .lightContent
            }
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    var navigationBarHeight: CGFloat {
        let statusBarSize = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame
        return (self.navigationController?.navigationBar.frame.size.height)! + Swift.min(statusBarSize?.width ?? 0, statusBarSize?.height ?? 0)
    }
    
    
    func add(_ child: UIViewController, containerView: UIView) {
        addChild(child)
        //child.tabBarController?.tabBar.isHidden = true
        containerView.addSubview(child.view)
        child.view.frame = containerView.bounds
        child.didMove(toParent: self)
    }
    
    func remove(containerView: UIView) {
        guard parent != nil else { return }
        willMove(toParent: nil)
        self.view.removeFromSuperview()
        removeFromParent()
    }
    
    func pushTo<T: UIViewController>(_ viewController : T) {
        viewController.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func push<T>(_ viewController: T) where T : UIViewController {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 200)) {
            viewController.tabBarController?.tabBar.isHidden = true
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
    func presentTo<T: UIViewController>(_ viewController : T) {
        viewController.tabBarController?.tabBar.isHidden = true
        self.present(viewController, animated: false, completion: nil)
    }
    
    func popViewController() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    
    func pushToViewController<T: UIViewController>(sbName: String, vcName: String) -> T {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vcName) as! T
        return vc
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func presentToast(_ smartToastViewController: LoafViewController) {
        DispatchQueue.main.async {
            smartToastViewController.transDelegate = Manager(loaf: smartToastViewController.loaf, size: smartToastViewController.preferredContentSize)
            smartToastViewController.transitioningDelegate = smartToastViewController.transDelegate
            smartToastViewController.modalPresentationStyle = .custom
            smartToastViewController.view.clipsToBounds = true
            smartToastViewController.view.layer.cornerRadius = 6
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                DispatchQueue.main.async {
                    topController.present(smartToastViewController, animated: true)
                }
            }
        }
    }
}

extension UIViewController {
    func configureNavigationBarAndTabBarForiOS15() {
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = UIColor.blue
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // MARK: Tab bar appearance
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.Theme.ePriceLightGray
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
        
        self.tabBarController?.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
    }
    
    
    func selectedTabbarColor() {
        tabBarController?.tabBar.tintColor = UIColor.Theme.ePriceDarkGray
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.Theme.ePriceDarkGray
    }
}

extension UIViewController {
    
    func showDatePicker(title: String, completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        // Create DatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: 0, y: 50, width: alert.view.bounds.width, height: 200)
        
        // Set max date to today
        datePicker.maximumDate = Date()
        
        // Add DatePicker to alert
        alert.view.addSubview(datePicker)
        
        // Add Cancel button
        alert.addAction(UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil))
        
        // Add Select button
        alert.addAction(UIAlertAction(title: "select".localized, style: .default, handler: { _ in
            let selectedDate = datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy" // Custom format
            let formattedDate = dateFormatter.string(from: selectedDate)
            completion(formattedDate) // Pass the formatted date back via the completion handler
        }))
        
        // Present the alert with DatePicker
        self.present(alert, animated: true, completion: nil)
    }
}
