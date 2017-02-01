//
//  RationalSwapTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"
#import "TestUtils.h"

@interface RationalSwapTests : XCTestCase

@end

@implementation RationalSwapTests

- (void)testSwap0_1__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b0);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    r_pln_swap(&op1, &op2);

    r_pln_t expectedOp1;
    r_pln_init_set_ui(&expectedOp1, 0b1);
    XCTAssertEqual(r_pln_cmp(&op1, expectedOp1), kCompareFlagEqual);

    r_pln_t expectedOp2;
    r_pln_init_set_ui(&expectedOp2, 0b0);
    XCTAssertEqual(r_pln_cmp(&op2, expectedOp2), kCompareFlagEqual);
}

- (void)testSwap10_11__11_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b10);
    pln_set_ui(op1.denominator, 0b11);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b11);

    r_pln_swap(&op1, &op2);

    r_pln_t expectedOp1;
    r_pln_init_set_ui(&expectedOp1, 0b11);
    XCTAssertEqual(r_pln_cmp(&op1, expectedOp1), kCompareFlagEqual);

    r_pln_t expectedOp2;
    r_pln_init_set_ui(&expectedOp2, 0b10);
    pln_set_ui(expectedOp2.denominator, 0b11);
    XCTAssertEqual(r_pln_cmp(&op2, expectedOp2), kCompareFlagEqual);
}

@end
