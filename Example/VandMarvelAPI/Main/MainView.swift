//
//  MainView.swift
//  VandMarvelAPI_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 19/01/21.
//  Copyright © 2021 Vand. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    func setupView() {
        buildHierarchy()
        setupConstraints()
        configViews()
    }

    func buildHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(self.safeAreaInsets)
        }
    }

    func configViews() {}

}
