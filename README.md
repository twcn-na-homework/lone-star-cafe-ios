## JD

[iOS 招聘需求中文版](./JD.md)
## Introduction

The Lone Star Cafe is a chain cafeteria in the United States, they have several restaurants around the States. They want to build an app for their users so that the users can order from their app and won’t need to wait at the order table.

The Lone Star Cafe supplies 4 kinds of menu items. They are *Beverages, Snacks, Dishes and Fruits.*

In order to attract more customers, the restaurant also allows users to apply discount coupons on their orders. There are 2 types of discounts, one is by the amount and the other is by percentage. But **the discount can only apply to specific types of menu items, and not all the menu items are discountable.**

Also, the tax should be included in the receipt. In the State of Texas, **the tax rate is 8.75%** also not all item is taxable

Your task is helping to add some features to this app.

## Precondition

Prepare your development environment for android or iOS

* Xcode 13.2 or above
* IDE (Xcode, AppCode or others)

## Dependencies

- [Apollo](https://github.com/apollographql/apollo-ios)
- [KingFisher](https://github.com/onevcat/Kingfisher)
- [Snapkit](https://github.com/SnapKit/SnapKit)

## API Response Explain

 Here is explanation of key field in the response

* Menu Item Fields

```json
{
  "description": "Coca-Cola, 12 fl oz",
  "price": 499,
  "type": "BEVERAGES",
  "discountable": false,   // if true, it means this item can apply a discount 
  "taxable": true         // if true, it means the item need to pay tax
}
```
* Discount Fields

```json
{
  "code": "FOOD",
  "discountPct": null,    // Discount percentage, eg: it means 10%
  "discountAmount": 500,  // Discount amount, eg: it means 500 cent 
  "applyOn": [            // This discount can be apply on which menu item
    "SNACKS",
    "DISHES",
    "FRUITS"
  ]
}

```

For more details, Please refer to [http://lone-star-cafe.herokuapp.com/graphql](http://lone-star-cafe.herokuapp.com/graphql).

## Trouble Shooting

* **Can not run the code due to github unreachable**: 

```json
SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443
```
Possible solution:

- Switch your network. Make sure your network are not blocked by the GFW
  
- Try to unset your http proxy 
  
  ```
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  ```
  
- Disable ssl verification: `git config http.sslVerify false`