//
//  ViewController.swift
//  RealmQuickStart
//
//  Created by Dmitry Kurkin Local on 20.05.21.
//

import UIKit
import ChainLayout

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain))
    private let dataSource = DataSource()
    private let input = UITextField()
    private var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.add(into: view)
            .leading()
            .trailing()
            .top(0, toSafeArea: true)
            .done()
        dataSource.attach(to: collection)

        let separator = UIView().add(into: view)
            .height(1)
            .leading()
            .trailing()
            .top(to: collection)
            .done()
        separator.backgroundColor = .lightGray

        input.add(into: view)
            .height(50)
            .leading(16)
            .trailing(16)
            .top(to: separator)
            .bottom(0, toSafeArea: true)
            .done()
        input.placeholder = "Don't forget to..."
        input.delegate = self
        
        input.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.text.map { dataSource.append($0) }
        layout.collectionView?.reloadData()
        input.text = nil
        return true
    }
}

