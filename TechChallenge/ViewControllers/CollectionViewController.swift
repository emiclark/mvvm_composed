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
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 150)
        layout.itemSize = layout.estimatedItemSize
        let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = true
        cv.backgroundColor = .white

        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        collectionview.delegate = datasource
        collectionview.dataSource =  datasource
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        let transaction = viewModel.transactions[indexPath.row]
        cell.configure(with: transaction)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
