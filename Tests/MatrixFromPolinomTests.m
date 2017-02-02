//
//  MatrixFromPolynomialTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixFromPolynomialTests : XCTestCase

@end


@implementation MatrixFromPolynomialTests

- (void)testMatrixFromPolynomial5 {
    pln_t pln;
    pln_init_set_ui(pln, 0b101);
    size_t size = pln_mat_size(pln);

    r_pln_t **expected_mat;
    pln_mat_init(&expected_mat, size);

    r_pln_set_ui(&expected_mat[0][0], 0b0);
    r_pln_set_ui(&expected_mat[0][1], 0b1);

    for (int i = 1; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (i - 1 == j) {
                r_pln_set_ui(&expected_mat[i][j], 0b1);
            }
            else {
                r_pln_set_ui(&expected_mat[i][j], 0b0);
            }
        }
    }

    r_pln_t **mat;
    pln_mat_init(&mat, size);

    pln_mat_from_pln(mat, pln);

    XCTAssertEqual(pln_mat_cmp(mat, expected_mat, size), kCompareFlagEqual);

    pln_mat_clear(mat, size);
    pln_mat_clear(expected_mat, size);
    pln_clear(pln);
}

- (void)testMatrixFromPolynomial19 {
    pln_t pln;
    pln_init_set_ui(pln, 0b10011);
    size_t size = pln_mat_size(pln);

    r_pln_t **mat;
    pln_mat_init(&mat, size);

    pln_mat_from_pln(mat, pln);

    r_pln_t **expected_mat;
    pln_mat_init(&expected_mat, size);
    unsigned int src[] = {
        0b1, 0b0, 0b0, 0b1,
        0b1, 0b0, 0b0, 0b0,
        0b0, 0b1, 0b0, 0b0,
        0b0, 0b0, 0b1, 0b0
    };
    pln_mat_set_arr(expected_mat, src, 4);

    XCTAssertEqual(pln_mat_cmp(mat, expected_mat, size), kCompareFlagEqual);

    pln_mat_clear(mat, size);
    pln_mat_clear(expected_mat, size);
    pln_clear(pln);
}

- (void)testMatrixFromPolynomial23 {
    pln_t pln;
    pln_init_set_ui(pln, 0b10111);
    size_t size = pln_mat_size(pln);

    r_pln_t **mat;
    pln_mat_init(&mat, size);

    pln_mat_from_pln(mat, pln);

    r_pln_t **expected_mat;
    pln_mat_init(&expected_mat, size);
    unsigned int src[] = {
        0b1, 0b1, 0b0, 0b1,
        0b1, 0b0, 0b0, 0b0,
        0b0, 0b1, 0b0, 0b0,
        0b0, 0b0, 0b1, 0b0
    };
    pln_mat_set_arr(expected_mat, src, 4);

    XCTAssertEqual(pln_mat_cmp(mat, expected_mat, size), kCompareFlagEqual);

    pln_mat_clear(mat, size);
    pln_mat_clear(expected_mat, size);
    pln_clear(pln);
}

@end
