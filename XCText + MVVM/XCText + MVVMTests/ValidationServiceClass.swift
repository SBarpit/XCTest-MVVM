//
//  ValidationServiceClass.swift
//  XCText + MVVMTests
//
//  Created by Admin on 28/08/21.
//

@testable import XCText___MVVM
import XCTest


class ValidationServiceClass: XCTestCase {

    var validationService:ValidationService!
    
    override func setUp() {
        super.setUp()
        validationService = ValidationService()
    }
    
    override func tearDown() {
        validationService = nil
        super.tearDown()
    }
    
    func test_valid_username(){
        XCTAssertNoThrow(try validationService.validateUsername("abcd"))
    }
    
    func test_username_nil(){
        XCTAssertThrowsError(try validationService.validateUsername(nil))
    }
    
    func test_valid_name(){
        XCTAssertNoThrow(try validationService.validateFullName("abcd"))
    }
    
    func test_valid_email(){
        XCTAssertNoThrow(try validationService.validateFullName("abcd@gmail.com"))
    }
    
    func test_inValid_email(){
        XCTAssertThrowsError(try validationService.validateEmail("abcd"))
    }
    
    func test_validation_error_msg(){
        let expectedError = ValidationError.invalidValue
        var error:ValidationError?
        XCTAssertThrowsError(try validationService.validateUsername(nil)) { errorThrown in
            error = errorThrown as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }

}
