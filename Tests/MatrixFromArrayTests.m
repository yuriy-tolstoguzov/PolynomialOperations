//
//  MatrixFromArrayTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/30/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixFromArrayTests : XCTestCase

@end


@implementation MatrixFromArrayTests

- (void)testFromArraySize4 {
    size_t size = 4;

    pln_mat_t rop;
    pln_mat_init(&rop, size);
    unsigned int src[] = {
        0b10, 0b1, 0b0, 0b0,
        0b0, 0b10, 0b1, 0b0,
        0b0, 0b0, 0b10, 0b1,
        0b1, 0b0, 0b0, 0b10
    };

    pln_mat_set_arr(rop, src, 4);

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
    r_pln_set_ui(&expected_rop[3][0], 0b1);
    r_pln_set_ui(&expected_rop[3][1], 0b0);
    r_pln_set_ui(&expected_rop[3][2], 0b0);
    r_pln_set_ui(&expected_rop[3][3], 0b10);

    XCTAssertEqual(pln_mat_cmp(rop, expected_rop, size), kCompareFlagEqual);

    pln_mat_clear(expected_rop, size);
    pln_mat_clear(rop, size);
}

@end
