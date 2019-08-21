//
//  TransactionCollectionViewController
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
import SnapKit

final class TransactionCollectionViewController: UIViewController {

    private let datasource = TransactionCollectionViewDataSource()
    private let viewModel = TransactionViewModel()

    lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = true
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: datasource.reuseidentifier)
        cv.backgroundColor = .white
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = datasource
        collectionview.dataSource =  datasource
        view.backgroundColor = .white
        self.navigationItem.title = "navTitle_allTransactionsCV".localized()
        datasource.navigationCtlr = self.navigationController
        setupViews()
    }

    private func setupViews() {
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
            } else {
                make.edges.equalToSuperview()
            }
        }
    }
}
