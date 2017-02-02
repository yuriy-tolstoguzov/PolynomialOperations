//
//  MatrixSizeTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialMatrix.h"

@interface MatrixSizeTests : XCTestCase

@end


@implementation MatrixSizeTests

- (void)testSize1_1 {
    pln_t op;
    pln_init_set_ui(op, 0b1);

    XCTAssertEqual(pln_mat_size(op), 0);
}

- (void)testSize0_1 {
    pln_t op;
    pln_init_set_ui(op, 0b0);

    XCTAssertEqual(pln_mat_size(op), 0);
}

- (void)testSize101_1 {
    pln_t op;
    pln_init_set_ui(op, 0b101);

    XCTAssertEqual(pln_mat_size(op), 2);
}

- (void)testSize100000_1 {
    pln_t op;
    pln_init_set_ui(op, 0b100000);

    XCTAssertEqual(pln_mat_size(op), 5);
}

@end
