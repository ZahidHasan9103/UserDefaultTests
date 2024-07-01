//
//  ViewControllerTests.swift
//  UserDefaultTestsTests
//
//  Created by ZEUS on 1/7/24.
//

import XCTest
@testable import UserDefaultTests

final class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    private var fakeUserDefaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        fakeUserDefaults = FakeUserDefaults()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.userDefaults = fakeUserDefaults
    }
    
    override func tearDown() {
        sut = nil
        fakeUserDefaults = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_withEmptyUserDefaults_shouldShow0InCounterLabel(){
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "0")
        
    }
    
    func test_viewDidLoad_with7inUserDefaults_shouldShow7InCounterLabel(){
        fakeUserDefaults.integers = ["count": 7]
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.counterLabel.text, "7")
        
    }
    
    func test_tappingButton_with12InUserDefaults_shouldWrite13InUserDefaults(){
        fakeUserDefaults.integers = ["count": 12]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(fakeUserDefaults.integer(forKey: "count"), 13)
    }
    
    func test_tappingButton_with42InUserdefaults_shouldShow43InCounterLabel(){
        fakeUserDefaults.integers = ["count": 42]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(sut.counterLabel.text, "43")
    }

}
