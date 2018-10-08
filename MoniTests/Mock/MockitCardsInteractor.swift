//
//  MockitCardsRepository.swift
//  MoniTests
//
//  Created by VITI on 08/10/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import Mockit
import XCTest

@testable import Moni

class MockitCardsInteractor: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockitCardsInteractor {
        return self
    }
}

extension MockitCardsInteractor: CardsInteractorContract {
    func getAllCards() -> [Card] {
        return callHandler.accept([], ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! [Card]
    }
    
    func removeCard(card: Card) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
