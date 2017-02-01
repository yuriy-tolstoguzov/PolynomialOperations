//
//  RationalShiftTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/25/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"
#import "TestUtils.h"

@interface RationalShiftTests : XCTestCase

@end

@implementation RationalShiftTests

- (void)testLShift0_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b0);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_lshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testLShift1_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_lshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b100000);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testLShift101_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b101);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_lshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b10100000);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testRShift0_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b0);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_rshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testRShift100000_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b100000);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_rshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testRShift10100000_1_by5 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b10100000);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_rshift(&rop, op, 5);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b101);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testRShift10100000_1_by7 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b10100000);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_rshift(&rop, op, 7);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testRShift10100000_1_by8 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b10100000);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_rshift(&rop, op, 8);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

@end
