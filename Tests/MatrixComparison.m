//
//  MatrixComparison.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixComparison : XCTestCase

@end


@implementation MatrixComparison

- (void)testComparisonNotEqual {
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

    XCTAssertNotEqual(pln_mat_cmp(mat1, mat2, size), kCompareFlagEqual);

    pln_mat_clear(mat1, size);
    pln_mat_clear(mat2, size);
}

- (void)testComparisonEqual {
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
    r_pln_set_ui(&mat2[0][1], 0b1);
    r_pln_set_ui(&mat2[1][0], 0b1);
    r_pln_set_ui(&mat2[1][1], 0b10);

    XCTAssertEqual(pln_mat_cmp(mat1, mat2, size), kCompareFlagEqual);

    pln_mat_clear(mat1, size);
    pln_mat_clear(mat2, size);
}

@end
