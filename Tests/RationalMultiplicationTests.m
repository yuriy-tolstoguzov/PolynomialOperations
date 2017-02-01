//
//  RationalMultiplicationTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/24/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"
#import "TestUtils.h"

@interface RationalMultiplicationTests : XCTestCase

@end

@implementation RationalMultiplicationTests

- (void)testMultiplication1x0 {
    r_pln_t lhs;
    r_pln_init_set_ui(&lhs, 0b1);

    r_pln_t rhs;
    r_pln_init_set_ui(&rhs, 0b0);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, lhs, rhs);

    r_pln_t expectedResult;
    r_pln_init_set_ui(&expectedResult, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expectedResult), kCompareFlagEqual);
}

- (void)testMultiplication1x1 {
    r_pln_t lhs;
    r_pln_init_set_ui(&lhs, 0b1);

    r_pln_t rhs;
    r_pln_init_set_ui(&rhs, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, lhs, rhs);

    r_pln_t expectedResult;
    r_pln_init_set_ui(&expectedResult, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expectedResult), kCompareFlagEqual);
}

- (void)testMultiplication11x10 {
    r_pln_t lhs;
    r_pln_init_set_ui(&lhs, 0b11);

    r_pln_t rhs;
    r_pln_init_set_ui(&rhs, 0b10);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, lhs, rhs);

    r_pln_t expectedResult;
    r_pln_init_set_ui(&expectedResult, 0b110);

    XCTAssertEqual(r_pln_cmp(&rop, expectedResult), kCompareFlagEqual);
}

- (void)testMultiplication111x11 {
    r_pln_t lhs;
    r_pln_init_set_ui(&lhs, 0b111);

    r_pln_t rhs;
    r_pln_init_set_ui(&rhs, 0b11);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, lhs, rhs);

    r_pln_t expectedResult;
    r_pln_init_set_ui(&expectedResult, 0b1001);

    XCTAssertEqual(r_pln_cmp(&rop, expectedResult), kCompareFlagEqual);
}

- (void)testMultiplication1000x10001 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b1000);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b10001);
    pln_set_ui(op2.denominator, 0b1000);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, op1, op2);

    r_pln_t expectedResult;
    r_pln_init_set_ui(&expectedResult, 0b10001000);
    pln_set_ui(expectedResult.denominator, 0b1000);

    XCTAssertEqual(r_pln_cmp(&rop, expectedResult), kCompareFlagEqual);
}

@end
