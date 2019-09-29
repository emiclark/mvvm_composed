//
//  FeedViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Xcore

class FeedViewController: XCComposedCollectionViewController {

    let feedViewModel = FeedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        layout = .init(XCCollectionViewTileLayout().apply {
            $0.numberOfColumns = 1
        })
    }

    override func dataSources(for collectionView: UICollectionView) -> [XCCollectionViewDataSource] {
        let feedDatasource = FeedDataSource(collectionView: collectionView)
        var sources = [XCCollectionViewDataSource]()
        sources.append(feedDatasource)
        return sources
    }
}
