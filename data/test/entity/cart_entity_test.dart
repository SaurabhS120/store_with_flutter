import 'dart:convert';

import 'package:data/entity/cart_entity.dart';
import 'package:flutter_test/flutter_test.dart';

const _successResponseList = '''
[
    {
        "id": 1,
        "userId": 1,
        "date": "2020-03-02T00:00:00.000Z",
        "products": [
            {
                "productId": 1,
                "quantity": 4
            },
            {
                "productId": 2,
                "quantity": 1
            },
            {
                "productId": 3,
                "quantity": 6
            }
        ],
        "__v": 0
    },
    {
        "id": 2,
        "userId": 1,
        "date": "2020-01-02T00:00:00.000Z",
        "products": [
            {
                "productId": 2,
                "quantity": 4
            },
            {
                "productId": 1,
                "quantity": 10
            },
            {
                "productId": 5,
                "quantity": 2
            }
        ],
        "__v": 0
    },
    {
        "id": 3,
        "userId": 2,
        "date": "2020-03-01T00:00:00.000Z",
        "products": [
            {
                "productId": 1,
                "quantity": 2
            },
            {
                "productId": 9,
                "quantity": 1
            }
        ],
        "__v": 0
    },
    {
        "id": 4,
        "userId": 3,
        "date": "2020-01-01T00:00:00.000Z",
        "products": [
            {
                "productId": 1,
                "quantity": 4
            }
        ],
        "__v": 0
    },
    {
        "id": 5,
        "userId": 3,
        "date": "2020-03-01T00:00:00.000Z",
        "products": [
            {
                "productId": 7,
                "quantity": 1
            },
            {
                "productId": 8,
                "quantity": 1
            }
        ],
        "__v": 0
    },
    {
        "id": 6,
        "userId": 4,
        "date": "2020-03-01T00:00:00.000Z",
        "products": [
            {
                "productId": 10,
                "quantity": 2
            },
            {
                "productId": 12,
                "quantity": 3
            }
        ],
        "__v": 0
    },
    {
        "id": 7,
        "userId": 8,
        "date": "2020-03-01T00:00:00.000Z",
        "products": [
            {
                "productId": 18,
                "quantity": 1
            }
        ],
        "__v": 0
    }
]
''';
const _successResponse = '''
{
    "id": 1,
    "userId": 1,
    "date": "2020-03-02T00:00:00.000Z",
    "products": [
        {
            "productId": 1,
            "quantity": 4
        },
        {
            "productId": 2,
            "quantity": 1
        },
        {
            "productId": 3,
            "quantity": 6
        }
    ],
    "__v": 0
}
''';

void main(){
  group('CartEntity', (){
    test('fromJson', (){
      final cartEntity = CartEntity.fromJson(json.decode(_successResponse));
      expect(cartEntity.id, 1);
      expect(cartEntity.userId, 1);
      expect(cartEntity.date, DateTime.parse("2020-03-02T00:00:00.000Z"));
      expect(cartEntity.products.length, 3);
      expect(cartEntity.products[0].productId, 1);
      expect(cartEntity.products[0].quantity, 4);
      expect(cartEntity.products[1].productId, 2);
      expect(cartEntity.products[1].quantity, 1);
      expect(cartEntity.products[2].productId, 3);
      expect(cartEntity.products[2].quantity, 6);
    });
    test('fromJsonList', (){
      final cartEntityList = CartEntity.fromJsonList(json.decode(_successResponseList));
      expect(cartEntityList.length, 7);
      expect(cartEntityList[0].id, 1);
      expect(cartEntityList[0].userId, 1);
      expect(cartEntityList[0].date, DateTime.parse("2020-03-02T00:00:00.000Z"));
      expect(cartEntityList[0].products.length, 3);
      expect(cartEntityList[0].products[0].productId, 1);
      expect(cartEntityList[0].products[0].quantity, 4);
      expect(cartEntityList[0].products[1].productId, 2);
      expect(cartEntityList[0].products[1].quantity, 1);
      expect(cartEntityList[0].products[2].productId, 3);
      expect(cartEntityList[0].products[2].quantity, 6);
    });
  });
}