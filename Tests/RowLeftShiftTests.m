//
//  RowLeftShiftTests.m
//  PolynomialOperations
//
//  Created by Yuriy Tolstoguzov on 1/28/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "PolynomialRow.h"

@interface RowLeftShiftTests : XCTestCase

@end

@implementation RowLeftShiftTests

- (void)testLeftShift {
    size_t size = 10;
    pln_row_t row;
    pln_row_init(&row, size);

    for (int i = 0; i < size; i++) {
        r_pln_set_ui(&row[i], i);
    }

    pln_row_lshift(row, size);

    for (int i = 0; i < size; i++) {
        if (i < size - 1) {
            XCTAssertEqual(r_pln_cmp_ui(&row[i], i + 1), kCompareFlagEqual);
        }
        else {
            XCTAssertEqual(r_pln_cmp_ui(&row[i], 0), kCompareFlagEqual);
        }
    }

    pln_row_clear(row, size);
}

@end
