//
//  MatrixDeterminantTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixDeterminantTests : XCTestCase

@end


@implementation MatrixDeterminantTests

- (void)testToUpperTriangularFormSize4 {
    size_t size = 4;

    pln_mat_t op;
    pln_mat_init(&op, size);
    unsigned int src[] = {
        0b10, 0b1, 0b0, 0b0,
        0b0, 0b10, 0b1, 0b0,
        0b0, 0b0, 0b10, 0b1,
        0b1, 0b0, 0b0, 0b10
    };
    pln_mat_set_arr(op, src, 4);

    pln_mat_t u_mat;
    pln_mat_init(&u_mat, size);

    pln_mat_to_u(u_mat, op, size);

    r_pln_t rop;
    r_pln_init(&rop);
    pln_mat_get_determinant(&rop, u_mat, size);

    r_pln_reduce(&rop, rop);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b10001);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(u_mat, size);
    r_pln_clear(rop);
    r_pln_clear(expected_rop);
}

- (void)testToUpperTriangularFormSize7 {
    size_t size = 7;

    pln_mat_t op;
    pln_mat_init(&op, size);
    unsigned int array[] = {
        0b11, 0b0, 0b0, 0b0, 0b1, 0b1, 0b1,
        0b1, 0b10, 0b0, 0b0, 0b0, 0b1, 0b1,
        0b1, 0b0, 0b10, 0b0, 0b0, 0b0, 0b1,
        0b1, 0b0, 0b0, 0b10, 0b0, 0b0, 0b0,
        0b0, 0b1, 0b0, 0b0, 0b10, 0b0, 0b0,
        0b0, 0b0, 0b1, 0b0, 0b0, 0b10, 0b0,
        0b0, 0b0, 0b0, 0b1, 0b0, 0b0, 0b10
    };
    pln_mat_set_arr(op, array, size);

    pln_mat_t u_mat;
    pln_mat_init(&u_mat, size);

    pln_mat_to_u(u_mat, op, size);

    r_pln_t rop;
    r_pln_init(&rop);
    pln_mat_get_determinant(&rop, u_mat, size);

    r_pln_reduce(&rop, rop);

    r_pln_t expected_rop;
    r_pln_init_set_ui(&expected_rop, 0b11010101);

    XCTAssertEqual(r_pln_cmp(&rop, expected_rop), kCompareFlagEqual);

    pln_mat_clear(op, size);
    pln_mat_clear(u_mat, size);
    r_pln_clear(rop);
    r_pln_clear(expected_rop);
}


@end
