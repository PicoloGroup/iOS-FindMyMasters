//
//  Extensions.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 28.10.2021.
//

import UIKit

// MARK: - UIKit Extensions

public extension UIViewController {
    func displayError(_ error: Error?, from function: StaticString = #function) {
        guard let error = error else { return }
        print("ⓧ Error in \(function): \(error.localizedDescription)")
        let message = "\(error.localizedDescription)\n\n Ocurred in \(function)"
        let errorAlertController = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(errorAlertController, animated: true, completion: nil)
    }
}

extension UINavigationController {
    func configureTabBar(title: String, systemImageName: String) {
        let tabBarItemImage = UIImage(systemName: systemImageName)
        tabBarItem = UITabBarItem(title: title,
                                  image: tabBarItemImage?.withRenderingMode(.alwaysTemplate),
                                  selectedImage: tabBarItemImage)
    }

    enum titleType: CaseIterable {
        case regular, large
    }

    func setTitleColor(_ color: UIColor, _ types: [titleType] = titleType.allCases) {
        if types.contains(.regular) {
            navigationBar.titleTextAttributes = [.foregroundColor: color]
        }
        if types.contains(.large) {
            navigationBar.largeTitleTextAttributes = [.foregroundColor: color]
        }
    }
}

extension UITextField {
    func setImage(_ image: UIImage?) {
        guard let image = image else { return }
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFit

        let containerView = UIView()
        containerView.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
}

extension UIImageView {
    convenience init(systemImageName: String, tintColor: UIColor? = nil) {
        var systemImage = UIImage(systemName: systemImageName)
        if let tintColor = tintColor {
            systemImage = systemImage?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        }
        self.init(image: systemImage)
    }

    func setImage(from url: URL?) {
        guard let url = url else { return }
        DispatchQueue.global(qos: .background).async {
            guard let data = try? Data(contentsOf: url) else { return }

            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
                self.contentMode = .scaleAspectFit
            }
        }
    }
}

extension UIImage {
    static func systemImage(_ systemName: String, tintColor: UIColor) -> UIImage? {
        let systemImage = UIImage(systemName: systemName)
        return systemImage?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
    }
}

extension UIColor {
    static let highlightedLabel = UIColor.label.withAlphaComponent(0.8)

    var highlighted: UIColor { withAlphaComponent(0.8) }

    var image: UIImage {
        let pixel = CGSize(width: 1, height: 1)
        return UIGraphicsImageRenderer(size: pixel).image { context in
            self.setFill()
            context.fill(CGRect(origin: .zero, size: pixel))
        }
    }
}

// MARK: UINavigationBar + UserDisplayable Protocol

protocol UserDisplayable {
    func addProfilePic(_ imageView: UIImageView)
}

extension UINavigationBar: UserDisplayable {
    func addProfilePic(_ imageView: UIImageView) {
        let length = frame.height * 0.46
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = length / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: length),
            imageView.widthAnchor.constraint(equalToConstant: length)
        ])
    }
}

// MARK: Extending UITabBarController to work with custom transition animator

extension UITabBarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController,
                                 animationControllerForTransitionFrom fromVC: UIViewController,
                                 to toVC: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers!.firstIndex(of: fromVC)!
        let toIndex = tabBarController.viewControllers!.firstIndex(of: toVC)!

        let direction: Animator.TransitionDirection = fromIndex < toIndex ? .right : .left
        return Animator(direction)
    }

    func transitionToViewController(atIndex index: Int) {
        selectedIndex = index
    }
}

// MARK: - Foundation Extensions

extension Date {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
