//
//  MockitCardsRouter.swift
//  MoniTests
//
//  Created by VITI on 08/10/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import Mockit
import XCTest

@testable import Moni

class MockitCardsRouter: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockitCardsRouter {
        return self
    }
}

extension MockitCardsRouter: CardsRouterContract {
    func addCard() {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func joinWithCard(card: Card) {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
    
    func goToEditCard() {
        callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    }
}
