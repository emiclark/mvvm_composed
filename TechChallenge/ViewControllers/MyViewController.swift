//
//  MyViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/26/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SnapKit

extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        for element in elements {
            addArrangedSubview(element.view)
        }
        axis = .vertical
        spacing = 10
    }
}

class MyViewController: UIViewController {

    let elements: [ContentElement] = [
        .image(UIImage(named: "tvIcon.png")!),
        .label("To use the Swift Talk app please login as a subscriber"),
        .button("Click me"),
        .label("If you're not registered yet, please visit http://objc.io for more information"),
        .image(UIImage(named: "cvIcon.png")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        let stack = UIStackView(elements: elements)
        view.addSubview(stack)

        stack.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.center.equalTo(view)
        }

        view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
    }
}

final class StackViewController: UIViewController {
    let elements: [ContentElement]

    init(elements: [ContentElement]) {
        self.elements = elements
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white

        let stack = UIStackView(elements: elements)
        view.addSubview(stack)

        stack.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.center.equalTo(view)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ContentElement {
    case label(String)
    case button(String) //TODO action
    case image(UIImage)
}

extension ContentElement {
    var view: UIView {
        switch self {
            case .label(let text):
                let label = UILabel()
                label.numberOfLines = 0
                label.text = text
                return label
            case .button(let title):
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                return button
            case .image(let image):
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                return imageView
        }
    }
}
