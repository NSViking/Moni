//
//  CardsViewController.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import UIKit
import Stripe

class CardsViewController: UIViewController {
    
    var presenter: CardsPresenterContract?
    
    var collectionView: UICollectionView!
    var titleLabel = UILabel()
    var addButton = UIButton()
    
    var dataSource: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutolayout()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.setupData()
    }
    
    func setupData() {
        self.collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier())
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.titleLabel.text = "My Cards"
    }
}

extension CardsViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


extension CardsViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cardK: Card = self.dataSource[indexPath.row]
        
        self.presenter?.joinWithCard(card: cardK)
    }
}


extension CardsViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cardK: Card = self.dataSource[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier(), for: indexPath) as! CardCollectionViewCell
        cell.configure(card: cardK)
        return cell
    }
}

extension CardsViewController: CardsViewContract {

    func renderAllCards(cards: [Card]) {
        self.dataSource = cards
        self.collectionView.reloadData()
    }
}

extension CardsViewController {
    
    @objc func addButtonDidPress() {
        self.presenter?.addNewCard()
    }
}
