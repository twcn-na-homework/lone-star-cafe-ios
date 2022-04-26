//
//  ReceiptSwiftUIViewModel.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/21.
//

import Foundation
import SwiftUI

class ReceiptSwiftUIViewModel: ObservableObject {
    var itemCountTable: [String: Int]
    @Binding var selectedItems: [Item]
    
    init(itemCountTable: [String: Int], selectedItems: [Item]) {
        self.itemCountTable = itemCountTable
        self.selectedItems = selectedItems
        
        for item in selectedItems {
            itemCountTable.updateValue(1, forKey: item.name!)
        }
    }
}
