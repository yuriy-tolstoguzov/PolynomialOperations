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
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b1);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b0);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication1x1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b1);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication11x10 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b11);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b10);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b110);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testMultiplication111x11 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b111);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b11);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_mul(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1001);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
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

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b10001000);
    pln_set_ui(expected_rop.denominator, 0b1000);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

@end
