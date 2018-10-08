//
//  CardsPresenterTest.swift
//  MoniTests
//
//  Created by VITI on 08/10/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import Mockit
import XCTest

@testable import Moni

class CardsPresenterTests: XCTestCase {
    
    var presenter: CardsPresenter!
    var mockView: MockitCardsView!
    var router: MockitCardsRouter!
    var mockInteractor: MockitCardsInteractor!
    
    override func setUp() {
        super.setUp()
        mockView = MockitCardsView(testCase: self)
        router = MockitCardsRouter(testCase: self)
        mockInteractor = MockitCardsInteractor(testCase: self)
        
        presenter = CardsPresenter(interactor: mockInteractor,
                                   view: mockView,
                                   router: router)
    }
        
    func testSetupData() {
        
        let mockResponse = [Card(title: "", number: "", month: "", year: "", cvv: "")]
        let _ = mockInteractor.when()
            .call(withReturnValue: mockInteractor.getAllCards())
            .thenReturn(mockResponse)
        
        presenter?.setupData()
        XCTAssertTrue(presenter.dataSource.count > 0)
        let _ = self.mockInteractor.verify(verificationMode: Once()).getAllCards()
        let _ = self.mockView.verify(verificationMode: Once()).renderAllCards(cards: [])
    }
    
}
