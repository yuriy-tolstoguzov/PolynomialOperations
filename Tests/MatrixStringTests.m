//
//  MatrixStringTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/29/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PolynomialMatrix.h"

@interface MatrixStringTests : XCTestCase

@end


@implementation MatrixStringTests

- (void)testMatrixString {
    size_t size = 4;

    pln_mat_t op;
    pln_mat_init(&op, size);
    unsigned int src[] = {
        0b10, 0b1, 0b0, 0b0,
        0b0, 0b10, 0b1, 0b0,
        0b0, 0b0, 0b10, 0b1,
        0b1, 0b0, 0b0, 0b10
    };
    pln_mat_set_arr(op, src, size);

    mp_bitcnt_t str_size = pln_mat_str_size(op, size, 2);
    char str[str_size];

    pln_mat_get_str(str, op, size, 2);

    pln_mat_clear(op, size);

    NSString *rop = [[NSString alloc] initWithUTF8String:str];
    XCTAssertEqualObjects(rop, @"10/1 1/1 0/1 0/1\n0/1 10/1 1/1 0/1\n0/1 0/1 10/1 1/1\n1/1 0/1 0/1 10/1");
}

@end
