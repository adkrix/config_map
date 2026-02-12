import 'package:config_map/config_map.dart';

const fTitle = 'title';
const fDescription = 'description';
const fLanguage = 'language';
const fShow = 'show';
const fAuthors = 'authors';
const fPublishers = 'publishers';
const fOrder = 'order';
const fOrders = 'orders';
const fPrice = 'price';
const fPrices = 'prices';
const fCount = 'count';
const fCounts = 'counts';
const fDiscount = 'discount';
const fDiscounts = 'discounts';

final allFieldNames = [
  fTitle,
  fLanguage,
  fDescription,
  fAuthors,
  fPublishers,
  fShow,
  fOrder,
  fOrders,
  fPrice,
  fPrices,
  fCount,
  fCounts,
  fDiscount,
  fDiscounts,
];

const langOptions = {'en': 'English'};

final ConfigMapJson fullMapConfig = {
  fTitle: '"Title of book"',
  fLanguage: '"en"',
  fDescription: '"Description of book\\nNext line"',
  fAuthors: '["John Author","Jane Author"]',
  fPublishers:
      '["Penguin Random House","HarperCollins","Simon & Schuster","Hachette Book Group","Macmillan"]',
  fShow: 'true',
  fOrder: '152',
  fOrders: '[152,56]',
  fPrice: '152.23',
  fPrices: '[152.23,12.96]',
  fCount: '12',
  fCounts: '[12,23]',
  fDiscount: '2.5',
  fDiscounts: '[2.2,3.5,1.25]',
};

final ConfigMapJson resetMapConfig = {
  fTitle: '"Title of another book"',
  fLanguage: '"af"',
  fAuthors: '["André Brink","Breyten Breytenbach","Antjie Krog"]',
  fShow: 'false',
  fOrder: '562',
  fPrice: '26.78',
};
