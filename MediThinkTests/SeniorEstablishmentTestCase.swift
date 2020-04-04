//
//  SeniorEstablishmentTestCase.swift
//  MediThinkTests
//
//  Created by Edouard PLANTEVIN on 04/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import XCTest
@testable import MediThink

class SeniorEstablishmentTestCase: XCTestCase {

    
    
    
    func testSeniorShouldPostFailedCallbackIfError() {
        //Given
        let senior = SeniorEstablishmentService(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        senior.getSeniorEstablishment(city: "01") { (success) in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSeniorShouldPostFailedCallbackIfNoData() {
        //Given
        let senior = SeniorEstablishmentService(session: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        senior.getSeniorEstablishment(city: "01") { (success) in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSeniorShouldPostFailedCallbackIfIncorrecteResponse() {
        //Given
        let senior = SeniorEstablishmentService(session: URLSessionFake(data: FakeResponseData.seniorCorrectData, response: FakeResponseData.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        senior.getSeniorEstablishment(city: "01") { (success) in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSeniorShouldPostFailedCallbackIfIncorrecteData() {
        //Given
        let senior = SeniorEstablishmentService(session: URLSessionFake(data: FakeResponseData.seniorIncorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        senior.getSeniorEstablishment(city: "01") { (success) in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testSeniorShouldPostSuccessCallbackIfAllIsCorrect() {
        //Given
        let senior = SeniorEstablishmentService(session: URLSessionFake(data: FakeResponseData.seniorCorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        senior.getSeniorEstablishment(city: "01") { (success) in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
