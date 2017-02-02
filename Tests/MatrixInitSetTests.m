//
//  MatrixInitSetTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixInitSetTests : XCTestCase

@end


@implementation MatrixInitSetTests

- (void)testInit {
    size_t size = 10;
    pln_mat_t mat;
    pln_mat_init(&mat, size);

    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            r_pln_set_ui(&mat[i][j], j);

            XCTAssertEqual(r_pln_cmp_ui(&mat[i][j], j), kCompareFlagEqual);
        }
    }

    pln_mat_clear(mat, size);
}

- (void)testSet {
    size_t size = 10;
    r_pln_t **mat1;
    pln_mat_init(&mat1, size);

    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            r_pln_set_ui(&mat1[i][j], j);

            XCTAssertEqual(r_pln_cmp_ui(&mat1[i][j], j), kCompareFlagEqual);
        }
    }

    r_pln_t **mat2;
    pln_mat_init(&mat2, size);

    pln_mat_set(mat2, mat1, size);

    XCTAssertEqual(pln_mat_cmp(mat1, mat2, size), kCompareFlagEqual);

    pln_mat_clear(mat1, size);
    pln_mat_clear(mat2, size);
}

@end
