//
//  PolynomialMultiplicationTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/15/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "libPolynomialOperations.h"
#import "TestUtils.h"

@interface MultiplicationTests : XCTestCase

@end


@implementation MultiplicationTests

- (void)testMultiplication1x0 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b1);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b0);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, lhs, rhs);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b0);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication0x1 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b0);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b1);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, lhs, rhs);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b0);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication1x1 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b1);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b1);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, lhs, rhs);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b1);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication11x10 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b11);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b10);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, lhs, rhs);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b110);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication111x11 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b111);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b11);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, lhs, rhs);

    pln_t expected_rop;
    pln_init_set_ui(expected_rop, 0b1001);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}


- (void)testBigMultiplication400000000000000000000000000151 {
    pln_t op1;
    pln_init(op1);
    pln_set_str(op1, "400000000000000000000000000151", 8);

    pln_t op2;
    pln_init(op2);
    pln_set_str(op2, "400000000000000000000000000151", 8);

    pln_t rop;
    pln_init(rop);
    pln_mul(rop, op1, op2);

    pln_t expected_rop;
    pln_init(expected_rop);
    pln_set_str(expected_rop, "400000000000000000000000000000000000000001441", 16);

    XCTAssertEqual(pln_cmp(rop, expected_rop), kCompareFlagEqual);
}

@end
