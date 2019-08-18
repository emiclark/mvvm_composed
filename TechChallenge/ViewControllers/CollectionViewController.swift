//
//  CollectionViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewController: UIViewController {

    let datasource = CollectionViewDataSource()
    let reuseIdentifier = "cellId"
    let viewModel = TransactionViewModel()
    let itemSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 150.0)

    lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = itemSize
        let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = true
        cv.backgroundColor = .purple
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = datasource
        collectionview.dataSource =  datasource
        view.backgroundColor = .yellow
        self.navigationItem.title = "All transactions"
        collectionview.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: datasource.reuseIdentifier)
        setupViews()
    }

    func setupViews() {
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
