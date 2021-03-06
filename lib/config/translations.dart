import 'package:get/get.dart';

class AppTranslations extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'no_data_error': 'There is no time data for day. Please turn on WiFi/Internet and Reopen App',
      'find_qibla': 'Find the qiblah',
      'choose_location': 'Choose city',
      'choose_lang': 'Choose lang',
      'find_city': 'Type to search',
      'tong': 'Fajr',
      'till_tong': 'Till Fajr',
      'till_tom_tong': 'till tomorrow Fajr',
      'quyosh' :'Shuruk',
      'till_quyosh': 'till Shuruk',
      'peshin' :'Dhuhr',
      'till_peshin': 'till Dhuhr',
      'asr' :'Asr',
      'till_asr': 'till Asr',
      'shom' :'Maghrib',
      'till_shom': 'till Maghrib',
      'hufton' :'Isha',
      'till_hufton': 'till Isha',
      'greg_0': 'January',
      'greg_1': 'February',
      'greg_2': 'March',
      'greg_3': 'April',
      'greg_4': 'May',
      'greg_5': 'June',
      'greg_6': 'Jul',
      'greg_7': 'August',
      'greg_8': 'September',
      'greg_9': 'October',
      'greg_10': 'November',
      'greg_11': 'December',
      'qamar_0' : "Muharram",
      'qamar_1' : "Safar",
      'qamar_2' : "Rabi ul Awal",
      'qamar_3' : "Rabi Al-Akhar",
      'qamar_4' : "Jumada Al-Awwal",
      'qamar_5' : "Jumada Al-Akhirah",
      'qamar_6' : "Rajab",
      'qamar_7' : "Shaban",
      'qamar_8' : "Ramadan",
      'qamar_9' : "Shawwal",
      'qamar_10' : "Dhul Qadah",
      'qamar_11' : "Dhul Hijjah"
    },
    'uz_UZ': {
      'no_data_error': 'Bugungi sanaga namoz vaqtlar yo\'q. WiFi yoqi Internetni yoqing va dasturni oching',
      'find_qibla': 'Qiblani topish',
      'choose_location': 'Shaharni tanlang',
      'choose_lang': 'Tilni tanlang',
      'find_city': 'Topish uchun yozing',
      'tong': 'Bomdod',
      'till_tong': 'Bomdodgacha',
      'till_tom_tong': 'Ertangi bomdodgacha',
      'quyosh' :'Quyosh',
      'till_quyosh': 'Quyoshgacha',
      'peshin' :'Peshin',
      'till_peshin': 'Peshingacha',
      'asr' :'Asr',
      'till_asr': 'Asrgacha',
      'shom' :'Shom',
      'till_shom': 'Shomgacha',
      'hufton' :'Xufton',
      'till_hufton': 'Xuftongacha',
      'greg_0': 'Yanvar',
      'greg_1': 'Fevral',
      'greg_2': 'Mart',
      'greg_3': 'Aprel',
      'greg_4': 'May',
      'greg_5': 'Iyun',
      'greg_6': 'Iyul',
      'greg_7': 'Avgust',
      'greg_8': 'Sentyabr',
      'greg_9': 'Oktyabr',
      'greg_10': 'Noyabr',
      'greg_11': 'Dekabr',
      'qamar_0' : 'Muharram',
      'qamar_1' : 'Safar',
      'qamar_2' : 'Rabiʼul avval',
      'qamar_3' : 'Rabiʼus soni',
      'qamar_4' : 'Jumadul avval',
      'qamar_5' : 'Jumadus soni',
      'qamar_6' : 'Rajab',
      'qamar_7' : 'Shaʼbon',
      'qamar_8' : 'Ramazon',
      'qamar_9' : 'Shavvol',
      'qamar_10' : 'Zulqaʼda',
      'qamar_11' : 'Zulhijja'
  },
    'oz_UZ': {
      'no_data_error': 'Бугунги санага намоз ваҚтлар топилмади. WiFi йоки интернетни йокинг ва дастурни очинг',
      'find_qibla': 'Қиблани топиш',
      'choose_location': 'Шахарни танланг',
      'choose_lang': 'Тилни танланг',
      'find_city': 'Топиш учун йозин',
      'tong': 'Бомдод',
      'till_tong': 'Бомдодгача',
      'till_tom_tong': 'Эртанги бомдодгача',
      'quyosh' :'Қуйош',
      'till_quyosh': 'Қуйошгача',
      'peshin' :'Пешин',
      'till_peshin': 'Пешингача',
      'asr' :'Аср',
      'till_asr': 'Асргача',
      'shom' :'Шом',
      'till_shom': 'Шомгача',
      'hufton' :'Хуфтон',
      'till_hufton': 'Хуфтонгача',
      'greg_0': 'Январ',
      'greg_1': 'Феврал',
      'greg_2': 'Март',
      'greg_3': 'Апрел',
      'greg_4': 'Май',
      'greg_5': 'Июн',
      'greg_6': 'Июл',
      'greg_7': 'Август',
      'greg_8': 'Сентябр',
      'greg_9': 'Октябр',
      'greg_10': 'Ноябр',
      'greg_11': 'Декабр',
      'qamar_0' : "Мухаррам",
      'qamar_1' : "Сафар",
      'qamar_2' : "Рабиъул аввал",
      'qamar_3' : "Рабиъус сони",
      'qamar_4' : "Жумадул аввал",
      'qamar_5' : "Жумадис сони",
      'qamar_6' : "Ражаб",
      'qamar_7' : "Шаъбон",
      'qamar_8' : "Рамазон",
      'qamar_9' : "Шаввол",
      'qamar_10' : "Зулқаъда",
      'qamar_11' : "Зулҳижжа"
    },
    'ru_RU': {
      'no_data_error': 'Время намаза на сегодня не найдено. Попробуйте включить WiFi или интернет и перезапустите приложение ',
      'find_qibla': 'Найти киблу',
      'choose_location': 'Искать город',
      'choose_lang': 'Выберите язык',
      'find_city': 'Искать город',
      'tong': 'Фаджр',
      'till_tong': 'до Фаджра',
      'till_tom_tong': 'до завтрашнего Фаджр',
      'quyosh' :'Восход',
      'till_quyosh': 'до Восхода',
      'peshin' :'Зухр',
      'till_peshin': 'до Зухра',
      'asr' :'Аср',
      'till_asr': 'до Асра',
      'shom' :'Магриб',
      'till_shom': 'до Магриба',
      'hufton' :'Иша',
      'till_hufton': 'до Иша',
      'greg_0': 'Январь',
      'greg_1': 'Февраль',
      'greg_2': 'Март',
      'greg_3': 'Апрель',
      'greg_4': 'Май',
      'greg_5': 'Июнь',
      'greg_6': 'Июль',
      'greg_7': 'Август',
      'greg_8': 'Сентябрь',
      'greg_9': 'Октябрь',
      'greg_10': 'Ноябрь',
      'greg_11': 'Декабрь',
      'qamar_0' : "Мухаррам",
      'qamar_1' : "Сафар",
      'qamar_2' : "Рабиу ль-авваль",
      'qamar_3' : "Рабиу ль-ахир",
      'qamar_4' : "Джумада аль-уля",
      'qamar_5' : "Джумада аль-ахира",
      'qamar_6' : "Раджаб",
      'qamar_7' : "Ша‘бан",
      'qamar_8' : "Рамадан",
      'qamar_9' : "Шавваль",
      'qamar_10': "Зуль-ка‘да",
      'qamar_11': "Зуль-хиджа"
    },
  };
}