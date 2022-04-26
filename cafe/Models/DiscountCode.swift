//
//  DiscountCode.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/28.
//

import Foundation

struct DiscountCode: Identifiable {
	var id = UUID()
	var code: String
	var discountPct: Int? = nil
	var discountAmout: Int? = nil
	var applyOn: [ItemType]
}
