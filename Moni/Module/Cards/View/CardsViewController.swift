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
    var removeButton = UIButton()
    
    var emptyImageView = UIImageView()
    var emptyTitle = UILabel()
    
    var confirmRemoveButton = UIButton()
    var cancelRemoveButton = UIButton()
    
    var removeEnabled = false
    
    var dataSource: [Card] = []
    var removeDataSource:[Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutolayout()
        setupData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setupCards), userInfo: nil, repeats: false)
        self.setupCards()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        cancelRemoveButtonDidPress()
    }
    
    func setupData() {
        self.collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier())
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.cancelRemoveButton.isHidden = true
        self.confirmRemoveButton.isHidden = true
        
        self.titleLabel.text = "My Cards"
        self.emptyTitle.text = "Add a new card to access easiest to your moments and your current balance with Money To Pay."
    }
    
    @objc func setupCards() {
        self.presenter?.setupData()
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
        if (self.removeEnabled) {
            self.removeDataSource.append(cardK)
            self.collectionView.reloadData()
        } else {
            self.presenter?.joinWithCard(card: cardK)
        }
    }
}


extension CardsViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cardK: Card = self.dataSource[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier(), for: indexPath) as! CardCollectionViewCell
        
        cell.configure(card: cardK, removeEnabled: self.removeEnabled, isSelected: self.removeDataSource.contains(cardK))
        
        cell.bulletButtonClousure = { card in
            self.selectCardToRemove(card: card)
        }
        return cell
    }
}

extension CardsViewController: CardsViewContract {

    func renderAllCards(cards: [Card]) {
        self.dataSource = cards
        self.collectionView.reloadData()
        
        if self.dataSource.count != 0 {
            self.emptyImageView.isHidden = true
            self.emptyTitle.isHidden = true
            self.removeButton.isHidden = false
        } else {
            self.emptyImageView.isHidden = false
            self.emptyTitle.isHidden = false
            self.removeButton.isHidden = true
        }
    }
}

extension CardsViewController {
    
    @objc func addButtonDidPress() {
        self.presenter?.addNewCard()
    }
    
    @objc func removeButtonDidPress() {
        self.removeEnabled = !self.removeEnabled
        self.removeButton.isEnabled = !self.removeEnabled
        
        self.confirmRemoveButton.isHidden = !self.removeEnabled
        self.cancelRemoveButton.isHidden = !self.removeEnabled
        
        self.removeDataSource = []
        self.collectionView.reloadData()
        
    }
    
    func selectCardToRemove(card: Card) {
        self.removeDataSource.append(card)
        self.collectionView.reloadData()
    }
    
    @objc func cancelRemoveButtonDidPress() {
        self.removeDataSource = []
        self.removeEnabled = false
        self.removeButton.isEnabled = true
        self.cancelRemoveButton.isHidden = true
        self.confirmRemoveButton.isHidden = true
        self.collectionView.reloadData()
    }
    
    @objc func confirmRemoveButtonDidPress() {
        if (self.removeDataSource.count > 0) {
            self.dataSource.remove(at: self.dataSource.index(of: self.removeDataSource[0])!)
            self.presenter?.removeCard(card: self.removeDataSource[0])
            
            self.setupCards()
        }
        
        cancelRemoveButtonDidPress()
    }
}
