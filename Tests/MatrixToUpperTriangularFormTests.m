//
//  MatrixToUpperTriangularFormTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixToUpperTriangularFormTests : XCTestCase

@end


@implementation MatrixToUpperTriangularFormTests

- (void)testToUpperTriangularForm10_1_1_10 {
    size_t size = 2;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b10);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[1][0], 0b1);
    r_pln_set_ui(&op[1][1], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_to_u(rop, op, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b10);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b0);
    r_pln_set_ui(&expected_rop[1][1], 0b101);
    pln_set_ui(expected_rop[1][1].denominator, 0b10);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testToUpperTriangularForm11_0_0_0_11_0_0_0_11 {
    size_t size = 3;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b11);
    r_pln_set_ui(&op[0][1], 0b0);
    r_pln_set_ui(&op[0][2], 0b0);
    r_pln_set_ui(&op[1][0], 0b0);
    r_pln_set_ui(&op[1][1], 0b11);
    r_pln_set_ui(&op[1][2], 0b0);
    r_pln_set_ui(&op[2][0], 0b0);
    r_pln_set_ui(&op[2][1], 0b0);
    r_pln_set_ui(&op[2][2], 0b11);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_to_u(rop, op, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b11);
    r_pln_set_ui(&expected_rop[0][1], 0b0);
    r_pln_set_ui(&expected_rop[0][2], 0b0);
    r_pln_set_ui(&expected_rop[1][0], 0b0);
    r_pln_set_ui(&expected_rop[1][1], 0b11);
    r_pln_set_ui(&expected_rop[1][2], 0b0);
    r_pln_set_ui(&expected_rop[2][0], 0b0);
    r_pln_set_ui(&expected_rop[2][1], 0b0);
    r_pln_set_ui(&expected_rop[2][2], 0b11);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

- (void)testToUpperTriangularFormSize4 {
    size_t size = 4;

    pln_mat_t op;
    pln_mat_init(&op, size);
    r_pln_set_ui(&op[0][0], 0b10);
    r_pln_set_ui(&op[0][1], 0b1);
    r_pln_set_ui(&op[0][2], 0b0);
    r_pln_set_ui(&op[0][3], 0b0);
    r_pln_set_ui(&op[1][0], 0b0);
    r_pln_set_ui(&op[1][1], 0b10);
    r_pln_set_ui(&op[1][2], 0b1);
    r_pln_set_ui(&op[1][3], 0b0);
    r_pln_set_ui(&op[2][0], 0b0);
    r_pln_set_ui(&op[2][1], 0b0);
    r_pln_set_ui(&op[2][2], 0b10);
    r_pln_set_ui(&op[2][3], 0b1);
    r_pln_set_ui(&op[3][0], 0b1);
    r_pln_set_ui(&op[3][1], 0b0);
    r_pln_set_ui(&op[3][2], 0b0);
    r_pln_set_ui(&op[3][3], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_to_u(rop, op, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b10);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[0][2], 0b0);
    r_pln_set_ui(&expected_rop[0][3], 0b0);
    r_pln_set_ui(&expected_rop[1][0], 0b0);
    r_pln_set_ui(&expected_rop[1][1], 0b10);
    r_pln_set_ui(&expected_rop[1][2], 0b1);
    r_pln_set_ui(&expected_rop[1][3], 0b0);
    r_pln_set_ui(&expected_rop[2][0], 0b0);
    r_pln_set_ui(&expected_rop[2][1], 0b0);
    r_pln_set_ui(&expected_rop[2][2], 0b10);
    r_pln_set_ui(&expected_rop[2][3], 0b1);
    r_pln_set_ui(&expected_rop[3][0], 0b0);
    r_pln_set_ui(&expected_rop[3][1], 0b0);
    r_pln_set_ui(&expected_rop[3][2], 0b0);
    r_pln_set_ui(&expected_rop[3][3], 0b10001);
    pln_set_ui(expected_rop[3][3].denominator, 0b1000);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(rop, size);
    pln_mat_clear(expected_rop, size);
}

@end
