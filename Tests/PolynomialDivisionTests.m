//
//  PolynomialDivisionTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/20/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "libPolynomialOperations.h"
#import "TestUtils.h"


@interface DivisionTests : XCTestCase

@end


@implementation DivisionTests

- (void)testDivision0_1 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b0);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b1);

    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);
    pln_div(q, r, lhs, rhs);

    unsigned int expectedQuotient = 0b0;
    XCTAssertEqual(pln_cmp_ui(q, expectedQuotient), kCompareFlagEqual);

    unsigned int expectedRemainder = 0b0;
    XCTAssertEqual(pln_cmp_ui(r, expectedRemainder), kCompareFlagEqual);
}

- (void)testDivision1_1 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b1);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b1);

    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);
    pln_div(q, r, lhs, rhs);

    unsigned int expectedQuotient = 0b1;
    XCTAssertEqual(pln_cmp_ui(q, expectedQuotient), kCompareFlagEqual);

    unsigned int expectedRemainder = 0b0;
    XCTAssertEqual(pln_cmp_ui(r, expectedRemainder), kCompareFlagEqual);
}

- (void)testDivision1_10 {
    pln_t op1;
    pln_init_set_ui(op1, 0b1);

    pln_t op2;
    pln_init_set_ui(op2, 0b10);

    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);
    pln_div(q, r, op1, op2);

    unsigned int expectedQuotient = 0b0;
    XCTAssertEqual(pln_cmp_ui(q, expectedQuotient), kCompareFlagEqual);

    unsigned int expectedRemainder = 0b1;
    XCTAssertEqual(pln_cmp_ui(r, expectedRemainder), kCompareFlagEqual);
}

- (void)testDivision1001_11 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b1001);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b11);

    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);
    pln_div(q, r, lhs, rhs);

    unsigned int expectedQuotient = 0b111;
    XCTAssertEqual(pln_cmp_ui(q, expectedQuotient), kCompareFlagEqual);

    unsigned int expectedRemainder = 0b0;
    XCTAssertEqual(pln_cmp_ui(r, expectedRemainder), kCompareFlagEqual);
}

- (void)testDivision1000_11 {
    pln_t lhs;
    pln_init_set_ui(lhs, 0b1000);

    pln_t rhs;
    pln_init_set_ui(rhs, 0b11);

    pln_t q;
    pln_init(q);
    pln_t r;
    pln_init(r);
    pln_div(q, r, lhs, rhs);

    unsigned int expectedQuotient = 0b111;
    XCTAssertEqual(pln_cmp_ui(q, expectedQuotient), kCompareFlagEqual);

    unsigned int expectedRemainder = 0b1;
    XCTAssertEqual(pln_cmp_ui(r, expectedRemainder), kCompareFlagEqual);
}

@end
