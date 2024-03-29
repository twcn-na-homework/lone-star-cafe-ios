// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum ItemType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case beverages
  case snacks
  case dishes
  case fruits
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BEVERAGES": self = .beverages
      case "SNACKS": self = .snacks
      case "DISHES": self = .dishes
      case "FRUITS": self = .fruits
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .beverages: return "BEVERAGES"
      case .snacks: return "SNACKS"
      case .dishes: return "DISHES"
      case .fruits: return "FRUITS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ItemType, rhs: ItemType) -> Bool {
    switch (lhs, rhs) {
      case (.beverages, .beverages): return true
      case (.snacks, .snacks): return true
      case (.dishes, .dishes): return true
      case (.fruits, .fruits): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ItemType] {
    return [
      .beverages,
      .snacks,
      .dishes,
      .fruits,
    ]
  }
}

public final class FetchDiscountsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchDiscounts {
      discount {
        __typename
        code
        discountPct
        discountAmount
        applyOn
      }
    }
    """

  public let operationName: String = "FetchDiscounts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("discount", type: .nonNull(.list(.nonNull(.object(Discount.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(discount: [Discount]) {
      self.init(unsafeResultMap: ["__typename": "Query", "discount": discount.map { (value: Discount) -> ResultMap in value.resultMap }])
    }

    public var discount: [Discount] {
      get {
        return (resultMap["discount"] as! [ResultMap]).map { (value: ResultMap) -> Discount in Discount(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Discount) -> ResultMap in value.resultMap }, forKey: "discount")
      }
    }

    public struct Discount: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Discount"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .nonNull(.scalar(String.self))),
          GraphQLField("discountPct", type: .scalar(Int.self)),
          GraphQLField("discountAmount", type: .scalar(Int.self)),
          GraphQLField("applyOn", type: .nonNull(.list(.nonNull(.scalar(ItemType.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: String, discountPct: Int? = nil, discountAmount: Int? = nil, applyOn: [ItemType]) {
        self.init(unsafeResultMap: ["__typename": "Discount", "code": code, "discountPct": discountPct, "discountAmount": discountAmount, "applyOn": applyOn])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: String {
        get {
          return resultMap["code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var discountPct: Int? {
        get {
          return resultMap["discountPct"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "discountPct")
        }
      }

      public var discountAmount: Int? {
        get {
          return resultMap["discountAmount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "discountAmount")
        }
      }

      public var applyOn: [ItemType] {
        get {
          return resultMap["applyOn"]! as! [ItemType]
        }
        set {
          resultMap.updateValue(newValue, forKey: "applyOn")
        }
      }
    }
  }
}

public final class FetchMenuItemsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchMenuItems {
      menu {
        __typename
        id
        type
        price
        description
      }
    }
    """

  public let operationName: String = "FetchMenuItems"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("menu", type: .nonNull(.list(.nonNull(.object(Menu.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(menu: [Menu]) {
      self.init(unsafeResultMap: ["__typename": "Query", "menu": menu.map { (value: Menu) -> ResultMap in value.resultMap }])
    }

    public var menu: [Menu] {
      get {
        return (resultMap["menu"] as! [ResultMap]).map { (value: ResultMap) -> Menu in Menu(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Menu) -> ResultMap in value.resultMap }, forKey: "menu")
      }
    }

    public struct Menu: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MenuItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(ItemType.self))),
          GraphQLField("price", type: .nonNull(.scalar(Int.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, type: ItemType, price: Int, description: String) {
        self.init(unsafeResultMap: ["__typename": "MenuItem", "id": id, "type": type, "price": price, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var type: ItemType {
        get {
          return resultMap["type"]! as! ItemType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var price: Int {
        get {
          return resultMap["price"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}
