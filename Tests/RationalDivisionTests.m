//
//  RationalDivisionTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/22/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RationalPolynomialOperations.h"

@interface RationalDivisionTests : XCTestCase

@end

@implementation RationalDivisionTests

- (void)testDivision0_1__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b0);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);

    r_pln_div(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b0);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), 0);
}

- (void)testDivision1_1__1_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b1);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);

    r_pln_div(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), 0);
}

- (void)testDivision111_1__11_10 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b111);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b11);
    pln_set_ui(op2.denominator, 0b10);

    r_pln_t rop;
    r_pln_init(&rop);

    r_pln_div(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1110);
    pln_set_ui(expected_rop.denominator, 0b11);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), 0);
}

- (void)testDivision11_101__11_1 {
    r_pln_t op1;
    r_pln_init_set_ui(&op1, 0b11);
    pln_set_ui(op1.denominator, 0b101);

    r_pln_t op2;
    r_pln_init_set_ui(&op2, 0b11);
    pln_set_ui(op2.denominator, 0b1);

    r_pln_t rop;
    r_pln_init(&rop);

    r_pln_div(&rop, op1, op2);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b1);
    pln_set_ui(expected_rop.denominator, 0b101);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), 0);
}

@end
