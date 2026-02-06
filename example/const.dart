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
  fTitle: 'Title of book',
  fLanguage: 'en',
  fDescription: 'Description of book',
  fAuthors: 'John Author\nJane Author',
  fPublishers:
      'Penguin Random House\nHarperCollins\nSimon & Schuster\nHachette Book Group\nMacmillan',
  fShow: 'true',
  fOrder: '152',
  fOrders: '152\n56',
  fPrice: '152.23',
  fPrices: '152.23\n12.96',
  fCount: '12',
  fCounts: '12\n23',
  fDiscount: '2.5',
  fDiscounts: '2.2\n3.5\n1.25',
};

final ConfigMapJson resetMapConfig = {
  fTitle: 'Title of another book',
  fLanguage: 'af',
  fAuthors: 'André Brink\nBreyten Breytenbach\nAntjie Krog',
  'show': 'false',
  'order': '562',
  'price': '26.78',
};
