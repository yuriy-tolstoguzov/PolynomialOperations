//
//  MatrixMultiplicationTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixMultiplicationTests : XCTestCase

@end


@implementation MatrixMultiplicationTests

- (void)testMatrixMultiplication {
    size_t size = 2;

    pln_mat_t mat1;
    pln_mat_init(&mat1, size);
    r_pln_set_ui(&mat1[0][0], 0b0);
    r_pln_set_ui(&mat1[0][1], 0b1);
    r_pln_set_ui(&mat1[1][0], 0b1);
    r_pln_set_ui(&mat1[1][1], 0b10);

    pln_mat_t mat2;
    pln_mat_init(&mat2, size);
    r_pln_set_ui(&mat2[0][0], 0b0);
    r_pln_set_ui(&mat2[0][1], 0b100);
    r_pln_set_ui(&mat2[1][0], 0b1);
    r_pln_set_ui(&mat2[1][1], 0b1);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_mul(rop, mat1, mat2, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b1);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b10);
    r_pln_set_ui(&expected_rop[1][1], 0b110);

    pln_mat_cmp(rop, expected_rop, size);

    pln_mat_clear(mat1, size);
    pln_mat_clear(mat2, size);
    pln_mat_clear(expected_rop, size);
    pln_mat_clear(rop, size);
}

- (void)testNumberMultiplication {
    size_t size = 2;

    pln_mat_t mat;
    pln_mat_init(&mat, size);
    r_pln_set_ui(&mat[0][0], 0b0);
    r_pln_set_ui(&mat[0][1], 0b1);
    r_pln_set_ui(&mat[1][0], 0b1);
    r_pln_set_ui(&mat[1][1], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_mul_ui(rop, mat, 0b10, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b0);
    r_pln_set_ui(&expected_rop[0][1], 0b10);
    r_pln_set_ui(&expected_rop[1][0], 0b10);
    r_pln_set_ui(&expected_rop[1][1], 0b100);

    pln_mat_cmp(rop, expected_rop, size);

    pln_mat_clear(mat, size);
    pln_mat_clear(expected_rop, size);
    pln_mat_clear(rop, size);
}

- (void)testAddIdentityMatrixMulByNumber {
    size_t size = 2;

    pln_mat_t mat;
    pln_mat_init(&mat, size);
    r_pln_set_ui(&mat[0][0], 0b0);
    r_pln_set_ui(&mat[0][1], 0b1);
    r_pln_set_ui(&mat[1][0], 0b1);
    r_pln_set_ui(&mat[1][1], 0b10);

    pln_mat_t rop;
    pln_mat_init(&rop, size);

    pln_mat_add_identity_mul_ui(rop, mat, 0b10, size);

    pln_mat_t expected_rop;
    pln_mat_init(&expected_rop, size);
    r_pln_set_ui(&expected_rop[0][0], 0b10);
    r_pln_set_ui(&expected_rop[0][1], 0b1);
    r_pln_set_ui(&expected_rop[1][0], 0b1);
    r_pln_set_ui(&expected_rop[1][1], 0b1);

    pln_mat_cmp(rop, expected_rop, size);

    pln_mat_clear(mat, size);
    pln_mat_clear(expected_rop, size);
    pln_mat_clear(rop, size);
}

@end
