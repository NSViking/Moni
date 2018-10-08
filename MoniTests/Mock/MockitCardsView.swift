//
//  MockitCardsView.swift
//  MoniTests
//
//  Created by VITI on 08/10/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import Mockit
import XCTest

@testable import Moni

class MockitCardsView: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockitCardsView {
        return self
    }
}

extension MockitCardsView: CardsViewContract {
    
    func renderAllCards(cards: [Card]) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
