//
//  MatrixPowerTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixPowerTests : XCTestCase

@end

@implementation MatrixPowerTests

- (void)testPower1 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_pow(rop, op, 1, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b0);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b1);
    r_pln_set_ui(&expected_rop[1][1], 0b10);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testPower2 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_pow(rop, op, 2, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b1);
    r_pln_set_ui(&expected_rop[0][1], 0b10);
    r_pln_set_ui(&expected_rop[1][0], 0b10);
    r_pln_set_ui(&expected_rop[1][1], 0b101);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testPower3 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b1);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_pow(rop, op, 3, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b1);
    r_pln_set_ui(&expected_rop[0][1], 0b0);
    r_pln_set_ui(&expected_rop[1][0], 0b0);
    r_pln_set_ui(&expected_rop[1][1], 0b1);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testOptimizedPower1 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b0);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_optimized_pow(rop, op, 1, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b0);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b1);
    r_pln_set_ui(&expected_rop[1][1], 0b0);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testOptimizedPower2 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b0);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_optimized_pow(rop, op, 2, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b1);
    r_pln_set_ui(&expected_rop[0][1], 0b0);
    r_pln_set_ui(&expected_rop[1][0], 0b0);
    r_pln_set_ui(&expected_rop[1][1], 0b1);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testOptimizedPower3 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b0);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b0);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_optimized_pow(rop, op, 3, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b0);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b1);
    r_pln_set_ui(&expected_rop[1][1], 0b0);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

@end
