//
//  RationalComparisonTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/22/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"
#import "TestUtils.h"

@interface RationalComparisonTests : XCTestCase

@end


@implementation RationalComparisonTests

- (void)testComparison0_1__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b0);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    XCTAssertNotEqual(r_pln_cmp(&op1, op2), kCompareFlagEqual);
}

- (void)testComparison0_0__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b0);
    pln_set_ui(op1.denominator, 0b0);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    XCTAssertNotEqual(r_pln_cmp(&op1, op2), kCompareFlagEqual);
}

- (void)testComparison1_1__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b1);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    XCTAssertEqual(r_pln_cmp(&op1, op2), kCompareFlagEqual);
}

- (void)testComparison0_1__0_10 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b0);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b0);
    pln_set_ui(op2.denominator, 0b10);

    XCTAssertEqual(r_pln_cmp(&op1, op2), kCompareFlagEqual);
}

- (void)testComparison110_10__11_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b110);
    pln_set_ui(op1.denominator, 0b10);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b11);

    XCTAssertEqual(r_pln_cmp(&op1, op2), kCompareFlagEqual);
}

@end
