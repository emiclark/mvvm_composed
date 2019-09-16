//
//  FeedViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Foundation
import Xcore

class FeedViewController: XCComposedCollectionViewController {
    let feedViewModel = FeedViewModel()

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "navTitle_composed_cv".localized()
        collectionView.backgroundColor = .yellow
    }
}
