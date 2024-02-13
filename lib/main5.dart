void main() {
   int count = 0;

  Market bMarketi = Market.fromMap(data);
  print(bMarketi.items?[0].productColor[0].color);
  // print(bMarketi.items);
 for (int i = 0; i < (bMarketi.items?.length??0); i++) {
   if (bMarketi.items?[i].type=="duster") {
     count=count+1;
    
   }
 }
 print(count);
for (int i = 0; i < (bMarketi.items?.length??0); i++) {
   if (bMarketi.items?[i].type=="duster" && (bMarketi.items?[i].price??0)<20) {
     count=count+1;
    
   }
 }
 print(count);

 for (int i = 0; i < (bMarketi.items?.length??0); i++) {
   if (bMarketi.items?[i].type=="pencil") {
     count=count+1;
    
   }
 }
  int colorCount = 0;
  for (int i = 0; i < (bMarketi.items?.length??0); i++) {
   if (bMarketi.items?[i].type=="pencil") {
    
     for (int j = 0; j < (bMarketi.items?[i].productColor.length??0); j++) {
       colorCount=colorCount+1;
     }
   }
 } print(colorCount);
}
class Market {
  List<MarketProduct>? items = [];

  Market.fromMap(Map<String, List> mapData) {
    var data = mapData['items'];
    data?.forEach((element) {
      var piece = MarketProduct.fromMap(element);
      items?.add(piece);
    });
  }

} class MarketProduct {
  String? type;
  String? brand;
  double? price;
  String? description;
  List<ProductColor> productColor = [];
  MarketProduct.fromMap(Map<String, dynamic> dataMap) {
    type = dataMap['type'];
    brand = dataMap['brand'];
    price = double.parse(dataMap['price'].toString());
    description = dataMap['description'];
    var colors = dataMap['colors'];
    (colors as List).forEach((element) {
      productColor.add(ProductColor.fromMap(element));
    });
  }
}class ProductColor {
  String? id;
  String? color;
  ProductColor({
    this.id,
    this.color,
  });

  ProductColor.fromMap(Map mapData) {
    id = mapData['id'];
    color = mapData['color'];
  }
}
Map<String, List> data = {
  "items": [
    {
      "type": "pencil",
      "brand": "Lamy",
      "price": 55.5,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"color": "#198A00"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Graf Von Faber Castell",
      "price": 550.5,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "8", "color": "#A5378B"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Scrikss",
      "price": 2000,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"color": "#198A00"},
      ],
    },
    {
      "type": "duster",
      "brand": "Seed",
      "price": 20.0,
      "description": "sill",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Faber Castell",
      "price": 30.0,
      "description": "silgi",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Rotting",
      "price": 85.0,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Lamy",
      "price": 55.5,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"color": "#198A00"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Graf Von Faber Castell",
      "price": 550.5,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "8", "color": "#A5378B"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Scrikss",
      "price": 2000,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"color": "#198A00"},
      ],
    },
    {
      "type": "duster",
      "brand": "Seed",
      "price": 20.0,
      "description": "sill",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Faber Castell",
      "price": 30.0,
      "description": "silgi",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Seed",
      "price": 5.0,
      "description": "sill",
      "colors": [
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Rotting",
      "price": 85.0,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Rotting",
      "price": 19.9,
      "description": "sill",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Lamy",
      "price": 55.5,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"color": "#198A00"},
      ],
    },
    {
      "type": "duster",
      "brand": "Lamy",
      "price": 3.0,
      "description": "sill",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Graf Von Faber Castell",
      "price": 550.5,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "8", "color": "#A5378B"},
      ],
    },
    {
      "type": "pencil",
      "brand": "Scrikss",
      "price": 2000,
      "description": "Kurşun kalem",
      "colors": [
        {
          "id": "5",
          "color": "#2F4858",
        },
        {"color": "#198A00"},
      ],
    },
    {
      "type": "duster",
      "brand": "Seed",
      "price": 20.0,
      "description": "sill",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Faber Castell",
      "price": 30.0,
      "description": "silgi",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "duster",
      "brand": "Rotting",
      "price": 85.0,
      "description": "Kurşun kalem",
      "colors": [
        {"id": "2", "color": "#BFFCFA"},
        {"id": "0", "color": "#000000"},
      ],
    },
    {
      "type": "joyToy",
      "brand": "alfa",
      "price": 20798.0,
      "description": "",
      "colors": [
        {"id": "2", "color": "#ED1C24"},
        {"id": "8", "color": "#A5378B"},
        {"id": "0", "color": "#000000"},
      ],
    },
  ]
};