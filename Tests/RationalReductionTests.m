//
//  RationalReductionTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/25/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"
#import "TestUtils.h"


@interface RationalReductionTests : XCTestCase

@end

@implementation RationalReductionTests

- (void)testReduce0_1 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b0);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_reduce(&rop, op);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertNotEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testReduce1_1 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_reduce(&rop, op);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testReduce10_10 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b10);
    pln_set_ui(op.denominator, 0b10);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_reduce(&rop, op);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testReduce0_10 {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b0);
    pln_set_ui(op.denominator, 0b10);

    r_pln_t rop;
    r_pln_init(&rop);
    r_pln_reduce(&rop, op);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);
}

- (void)testReduce1001_11_ChangingOperand {
    r_pln_t op;
    r_pln_init_set_ui(&op, 0b1001);
    pln_set_ui(op.denominator, 0b11);

    r_pln_reduce(&op, op);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b111);

    XCTAssertEqual(r_pln_cmp(&op, expected_rop), kCompareFlagEqual);
}

@end
