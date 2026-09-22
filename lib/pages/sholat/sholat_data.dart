/// doa_data.dart

class DoaModel {
  final String judul;
  final String kategori;
  final String arab;
  final String latin;
  final String arti;

  /// TAMBAHAN
  final String keterangan;
  final String dalil;

  DoaModel({
    required this.judul,
    required this.kategori,
    required this.arab,
    required this.latin,
    required this.arti,
    required this.keterangan,
    required this.dalil,
  });
}

List<DoaModel> doaList = [
  DoaModel(
    judul: "Doa Niat Wudhu",
    kategori: "Wudhu",
    arab:
        "نَوَيْتُ الْوُضُوْءَ لِرَفْعِ الْحَدَثِ الْأَصْغَرِ فَرْضًا لِلّٰهِ تَعَالَى",
    latin: "Nawaitul wudlû-a li raf‘il ḫadatsil asghari fardlal lillâhi ta‘âlâ",
    arti:
        "Saya niat berwudhu untuk menghilangkan hadats kecil, fardhu karena Allah Ta‘la",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Sebelum Wudhu",
    kategori: "Wudhu",
    arab:
        "أَعُوْذُ بِاللهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ، بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ\n\nاَلْحَمْدُ لِلّٰهِ عَلَى الْإِسْلَامِ وَنِعْمَتِهِ، وَالْحَمْدُ لِلّٰهِ الَّذِيْ جَعَلَ الْمَاءَ طَهُورًا وَالْإِسْلَامَ نُورًا\n\nرَبِّ أَعُوْذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِيْنِ وَأَعُوْذُ بِكَ رَبِّ أَنْ يَحْضُرُوْنَ\n\nأَشْهَدُ أَنْ لَاإِلٰهَ إِلَّا اللهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُوْلُ اللهِ",
    latin:
        "A‘ûdzu billâhi minas syaithânir rajîm. Bismillâhir raḫmânir raḫîm\n\nAlḫamdulillâhi ‘alal Islâmi wa ni‘matihî. Walḫamdulillâhil ladzî ja‘alal mâ-a thahûran, wal islâma nûran\n\nRabbi a‘ûdzu bika min hamazâtisy syayâthîni, wa a‘ûdzu bika rabbi an yaḫdhurûn\n\nAsyhadu an lâ ilâha illallâhu, wa asyhadu anna Muhammadan rasûlullâhi",
    arti:
        "Aku berlindung kepada Allah dari gangguan setan yang terkutuk. Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang.\n\nSegala puji bagi Allah atas Islam dan nikmatnya. Segala puji bagi Allah yang menjadikan air itu suci dan Islam itu cahaya.\n\nTuhanku, aku berlindung kepada-Mu dari gangguan setan. Aku juga berlindung kepada-Mu wahai Tuhanku dari kepungan mereka, (QS al-Mukminun ayat 97-98).\n\nAku bersaksi, tiada tuhan selain Allah. Aku juga bersaksi bahwa Muhammad adalah utusan Allah.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Telapak Tangan",
    kategori: "Wudhu",
    arab: "اَللّٰهُمَّ احْفَظْ يَدِيْ مِنْ مَعَاصِيْكَ كُلِّهَا",
    latin: "Allâhumma ihfadh yadi min ma‘âshîka kullihâ",
    arti: "Ya Allah, jagalah kedua tanganku dari semua perbuatan maksiat.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa saat Berkumur",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ أَعِنِّيْ عَلَى ذِكْرِكَ وَشُكْرِكَ، اَللّٰهُمَّ اسْقِنِيْ مِنْ حَوْضِ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ كَأْسًا لَا أَظْمَأُ بَعْدَهُ أَبَدًا",
    latin:
        "Allâhumma a‘inni ‘alâ dzikrika wa syukrika, Allâhumma asqinî min haudli nabiyyika shallallâhu ‘alaihi wa sallam ka’san lâ adzma’u ba‘dahu abadan",
    arti:
        "Ya Allah, tolonglah aku (untuk selalu) mengingat dan bersyukur pada-Mu. Ya Allah, beri aku minuman dari telaga Kautsar Nabi Muhammad, yang begitu menyegarkan hingga aku tidak merasa haus selamanya.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Saat Menghirup Air Ke Hidung",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ أَرِحْنِيْ رَائِحَةَ الْجَنَّةِ، اَللّٰهُمَّ لَا تَحْرِمْنِيْ رَائِحَةَ نِعَمِكَ وَجَنَّاتِكَ",
    latin:
        "Allâhumma ariḫnî râiḫatal jannah. Allâhumma lâ taḫrimnî râiḫata ni‘amika wa jannâtika",
    arti:
        "Ya Allah, (izinkan) aku mencium wewangian surga. Ya Allah, jangan halangi aku mencium wanginya nikmat-nikmat-Mu dan wanginya surga-surga-Mu.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Saat Mengeluarkan Air Dari Hidung",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنْ رَوَائِحِ النَّارِ وَسُوْءِ الدَّارِ",
    latin: "Allâhumma innî a‘ûdzu bika min rawâiḫin nâr wa sû’id dâr",
    arti:
        "Ya Allah, aku berlindung pada-Mu dari busuknya bau neraka, dan dari buruknya tempat kembali.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Wajah",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ بَيِّضْ وَجْهِيْ يَوْمَ تَبْيَضُّ وُجُوْهٌ وَتَسْوَدُّ وُجُوْهٌ",
    latin:
        "Allâhumma bayyidl wajhî yauma tabyadldlu wujûhun wa taswaddu wujûh(un)",
    arti:
        "Ya Allah, putihkanlah wajahku di hari ketika wajah-wajah memutih dan menghitam.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Tangan Kanan",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ أَعْطِنِيْ كِتَابِيْ بِيَمِيْنِيْ وَحَاسِبْنِيْ حِسَابًا يَسِيْرًا",
    latin: "Allâhumma a‘thinî kitâbî biyamînî, wa ḫâsibnî ḫisâban yasîran",
    arti:
        "Ya Allah, berikanlah kitab amalku (kelak di akhirat) pada tangan kananku, dan hisablah aku dengan hisab yang ringan.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Tangan Kiri",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ لَا تُعْطِنِيْ كِتَابِيْ بِشِمَالِيْ وَلَا مِنْ وَرَاءِ ظَهْرِيْ",
    latin: "Allâhumma lâ tu‘thinî bi syimâlî, wa lâ min warâ-idh dhahrî",
    arti:
        "Ya Allah, jangan Kauberikan kitab amalku (kelak di akhirat) pada tangan kiriku, dan jangan pula diberikan dari balik punggungku.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Mengusap Kepala",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ حَرِّمْ شَعْرِيْ وَبَشَرِيْ عَلَى النَّارِ وَأَظِلَّنِيْ تَحْتَ عَرْشِكَ يَوْمَ لَا ظِلَّ إلَّا ظِلُّكَ",
    latin:
        "Allâhumma ḫarrim sya’rî wa basyarî ‘alân-nâri wa adhillanî taḫta ‘arsyika yauma lâ dhilla illâ dhilluka",
    arti:
        "Ya Allah, halangi rambut dan kulitku dari sentuhan api neraka, dan naungi aku dengan naungan singgasana-Mu, pada hari ketika tak ada naungan selain naungan dari-Mu.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Mengusap Telinga",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ اجْعَلْنِيْ مِنَ الَّذِيْنَ يَسْتَمِعُوْنَ الْقَوْلَ فَيَتَّبِعُوْنَ أَحْسَنَهُ",
    latin:
        "Allâhumma-j‘alnî minalladzîna yastami‘ûnal qaula fayattabi‘ûna aḫsanahu",
    arti:
        "Ya Allah, jadikanlah aku orang-orang yang mampu mendengar ucapan dan mampu mengikuti apa yang terbaik dari ucapan tersebut.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Kaki Kanan",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ اجْعَلْهُ سَعْيًا مَشْكُوْرًا وَذَنْبًا مَغْفُوْرًا وَعَمَلًا مُتَقَبَّلًا، اَللّٰهُمَّ ثَبِّتْ قَدَمِيْ عَلَى الصِّرَاطِ يَوْمَ تَزِلُّ فِيْهِ الْأَقْدَامُ",
    latin:
        "Allâhumma-j’alhu sa‘yan masykûran wa dzamban maghfûran wa ‘amalan mutaqabbalan. Allâhumma tsabbit qadamî ‘alash shirâthi yauma tazillu fîhil aqdâm",
    arti:
        "Ya Allah, jadikanlah (segenap langkahku) sebagai usaha yang disyukuri, sebagai penyebab terampuninya dosa dan sebagai amal yang diterima. Ya Allah, mantapkanlah telapak kakiku saat melintasi jembatan shirathal mustaqim, kelak di hari ketika banyak telapak kaki yang tergelincir.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Membasuh Kaki Kiri",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ إِنِّي أَعُوْذُ بِكَ أَنْ تَنْزِلَ قَدَمِيْ عَنِ الصِّرَاطِ يَوْمَ تَنْزِلُ فِيْهِ أَقْدَامُ الْمُنَافِقِيْنَ",
    latin:
        "Allâhumma innî a‘ûdzu bika an tanzila qadamî ‘anish-shirâthi yauma tanzilu fîhi aqdâmul munâfiqîn",
    arti:
        "Ya Allah, aku berlindung pada-Mu, dari tergelincir saat melintasi jembatan shirathal mustaqim, kelak di hari ketika banyak telapak kaki orang munafik yang tergelincir.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa setelah Wudhu",
    kategori: "Wudhu",
    arab:
        "أَشْهَدُ أَنْ لَاإِلٰهَ إِلَّااللهُ وَحْدَهُ لَاشَرِيْكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًاعَبْدُهُ وَرَسُوْلُهُ. اَللّٰهُمَّ اجْعَلْنِيْ مِنَ التَّوَّابِيْنَ وَاجْعَلْنِيْ مِنَ الْمُتَطَهِّرِيْنَ",
    latin:
        "Asyhadu allâ ilâha illallâhu waḫdahû lâ syarîka lahu wa asyhadu anna muḫammadan ‘abduhû wa rasûluhû, allâhummaj'alnî minat tawwâbîna waj'alnî minal mutathahhirîn(a)",
    arti:
        "Aku bersaksi bahwa tidak ada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya, dan aku bersaksi bahwa Nabi Muhammad adalah hamba dan utusan Allah. Ya Allah, jadikanlah aku termasuk dalam golongan orang-orang yang bertobat dan jadikanlah aku termasuk dalam golongan orang-orang yang bersuci (shalih).",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Niat Sholat Subuh",
    kategori: "Sholat",
    arab:
        "أُصَلِّى فَرْضَ الصُّبْح رَكَعتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لله تَعَالَى",
    latin:
        "Usholli fardhol subhi rok'ataini mustaqbilal qiblati adaa an (sholat sendiri)/Ma'muuman (menjadi ma'mum)/Imaaman (menjadi imam) Lillaahi Ta'aalaa",
    arti:
        "Saya berniat sholat fardu zuhur empat rakaat menghadap kiblat karena Allah Ta'ala.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Niat Sholat Dzuhur",
    kategori: "Sholat",
    arab:
        "اُصَلِّيْ فَرْضَ الظُّهْرِ أَرْبَعَ رَكَعاَتٍ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لله تَعَالَى",
    latin:
        "Usholli fardhol zuhri arba'a roka'aati mustaqbilal qiblati adaa an (sholat sendiri)/Ma'muuman (menjadi ma'mum)/Imaaman (menjadi imam) Lillaahi Ta'aalaa.",
    arti:
        "Saya berniat sholat fardu zuhur empat rakaat menghadap kiblat karena Allah Ta'ala.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Niat Sholat Ashar",
    kategori: "Sholat",
    arab:
        "أُصَلِّى فَرْضَ العَصْرِأَرْبَعَ رَكَعاَتٍ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لله تَعَالَى",
    latin:
        "Usholli fardhol ashri arba'a roka'aati mustaqbilal qiblati adaa an (sholat sendiri)/Ma'muuman (menjadi ma'mum)/Imaaman (menjadi imam) Lillaahi Ta'ala. ",
    arti:
        "Saya berniat sholat fardu asar empat rakaat menghadap kiblat karena Allah Ta'ala.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Niat Sholat Maghrib",
    kategori: "Sholat",
    arab:
        "أُصَلِّى فَرْضَ المَغْرِبِ ثَلاَثَ رَكَعاَتٍ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لله تَعَالَ",
    latin:
        "Usholli fardhol magribi tsalasa rok'aati mustaqbilal qiblati adaa an (sholat sendiri)/Ma'muuman (menjadi ma'mum)/Imaaman (menjadi imam) Lillaahi Ta'ala. ",
    arti:
        "Saya berniat sholat fardu magrib tiga rakaat menghadap kiblat karena Allah Ta'ala.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Niat Sholat isya",
    kategori: "Sholat",
    arab:
        "أُصَلِّى فَرْضَ العِشَاء ِأَرْبَعَ رَكَعاَتٍ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لله تَعَالَى",
    latin:
        "Usholli fardhol 'Isya i arba'a roka'aati mustaqbilal qiblati adaa an (sholat sendiri)/Ma'muuman (menjadi ma'mum)/Imaaman (menjadi imam) Lillaahi Ta'aalaa.",
    arti:
        "Saya berniat sholat fardu isya empat rakaat menghadap kiblat karena Allah Ta'ala.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Takbiratul Ihram",
    kategori: "Sholat",
    arab: "اللهُ أكْبَرُ",
    latin: "Allahu Akbar",
    arti: "Allah Maha Besar",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Iftitah",
    kategori: "Sholat",
    arab:
        "اَللّٰهُ أَكْبَرُ كَبِيْرًا وَّالْحَمْدُ لِلّٰهِ كَثِيْرًا وَّسُبْحَانَ اللّٰهِ بُكْرَةً وَّأَصِيْلًا، إِنِّيْ وَجَّهْتُ وَجْهِيَ لِلَّذِيْ فَطَرَ السَّمٰوَاتِ وَالْأَرْضَ حَنِيْفًا مُّسْلِمًا وَّمَا أَنَا مِنَ الْمُشْرِكِيْنَ، إِنَّ صَلَاتِيْ وَنُسُكِيْ وَمَحْيَايَ وَمَمَاتِيْ لِلّٰهِ رَبِّ الْعَالَمِيْنَ، لَا شَرِيْكَ لَهُ وَبِذٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِيْنَ",
    latin:
        "Allaahu akbar Kabiroo Walhamdulillaahi Katsiiraa, Wa Subhaanallaahi Bukratan Wa’ashiilaa, Innii Wajjahtu Wajhiya Lilladzii Fatharas Samaawaati Wal Ardha Haniifan Musliman Wamaa Anaa Minal Musyrikiin. Inna Shalaatii Wa Nusukii Wa Mahyaaya Wa Mamaatii Lillaahi Rabbil ‘Aalamiina. Laa Syariikalahu Wa Bidzaalika Umirtu Wa Ana Minal Muslimiin.",
    arti:
        "Allah Mahabesar, Mahasempurna kebesaran-Nya. Segala puji bagi Allah, pujian yang sebanyak-banyaknya. Mahasuci Allah sepanjang pagi dan petang. Kuhadapkan wajahku kepada Dzat yang telah menciptakan langit dan bumi dengan penuh ketulusan dan kepasrahan dan aku bukanlah termasuk orang-orang yang musyrik. Sesungguhnya shalatku, ibadahku, hidupku, dan matiku semuanya untuk Allah, penguasa alam semesta. Tidak ada sekutu bagi-Nya dan dengan demikianlah aku diperintahkan dan aku termasuk orang-orang Islam.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Membaca Al- Fatihah",
    kategori: "Sholat",
    arab:
        "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ\nاَلْحَمْدُ لِلّٰهِ رَبِّ الْعٰلَمِيْنَۙ\nالرَّحْمٰنِ الرَّحِيْمِۙ \nمٰلِكِ يَوْمِ الدِّيْنِۗ \nاِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِيْنُۗ\nاِهْدِنَا الصِّرَاطَ الْمُسْتَقِيْمَ ۙ\nصِرَاطَ الَّذِيْنَ اَنْعَمْتَ عَلَيْهِمْ ەۙ غَيْرِ الْمَغْضُوْبِ عَلَيْهِمْ وَلَا الضَّاۤلِّيْنَ",
    latin:
        "Bismillahirrahmaanirrahiim. Alhamdu lillahi rabbil 'aalamiin. Arrahmaanirrahiim. Maaliki yaumiddiin. Iyyaaka na'budu waiyyaaka nasta'iin. Ihdinash shirraathal musthaqiim. Shiraathal ladziina an'amta 'alaihim. Ghairil maghduubi 'alaihim waladl-dlaalliin.",
    arti:
        "Dengan nama Allah yang maha pengasih dan penyayang. Segala puji bagi Allah, Tuhan seru sekalian alam. Yang maha pengasih dan penyayang. Yang menguasai hari kemudian. Pada-Mu lah aku mengabdi dan kepada-Mu lah aku meminta pertologan. Tunjukilah kami ke jalan yang lurus. Bagaikan jalannya orang-orang yang telah Engkau beri ni'mat. Bukan jalan mereka yang pernah Engkau murkai, atau jalannya orang-orang yang sesat.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Membaca Surat Pendek",
    kategori: "Sholat",
    arab: "",
    latin: "",
    arti:
        "Disunahkan membaca surat setelah membaca Al-Fatihah, contohny:\n\n • Surat An-Nas\n • Surat Al-Falaq\n • Surat Al-Ikhlas\n • Surat Al-Lahab\n • Surat An-Nasr\n • Surat Al-Kafirun\n • Surat Al-Kautsar\n • Surat Al-Ma'un\n • Surat Al Quraisy\n • Surat Al-Fiil\n • Surat Al-Humazah\n • Surat Al-Ashr\n • Surat At-Takatsur",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Ruku",
    kategori: "Sholat",
    arab: "سُبْحَانَ رَبِّيَ الْعَظِيْمِ وَبِحَمْدِهِ ×٣",
    latin: "Subhaana rabbiyal 'adzhiimi wabihamdihi (3 kali)",
    arti: "Maha Suci Rabbku yang maha Agung dan maha terpuji.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "I’tidal (berdiri setelah ruku’) ",
    kategori: "Sholat",
    arab:
        "سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ.\nرَبَّنَا لَكَ الْحَمْدُ مِلْءُ السَّمَاوَاتِ وَمِلْءُ الْأَرْضِ وَمِلْءُ مَا شِئْتَ مِنْ شَيْءٍ بَعْدُ",
    latin:
        "Sami'allaahu liman hamidah.\nRabbanaaa lakal hamdu mil-ussamaawaati wa mil-ul-ardhi wa mil-u maa syik-ta min syai-im ba’du. ",
    arti:
        "Allah Mendengar orang memuji-Nya.\n Ya Allah Tuhan kami, bagi-Mu segala puji, sepenuh langit dan bumi dan sepenuh apa saja yang Engkau kehendaki sesudah itu.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Qunut (Sholat Subuh)",
    kategori: "Sholat",
    arab:
        "اَللّٰهُمَّ اهْدِنِيْ فِيْمَنْ هَدَيْتَ، وَعَافِنِيْ فِيْمَنْ عَافَيْتَ، وَتَوَلَّنِيْ فِيْمَنْ تَوَلَّيْتَ، وَبَارِكْ لِيْ فِيْمَا أَعْطَيْتَ، وَقِنِيْ شَرَّمَا قَضَيْتَ، فَإِ نَّكَ تَقْضِيْ وَلَا يُقْضَى عَلَيْكَ وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوْبُ إِلَيْكَ، وَصَلَّى اللهُ عَلَى سَيِّدِنَا مُحَمَّدٍ ࣙالنَّبِيِّ الْأُمِّيِّ وَعَلَى اٰلِهِ وَصَحْبِهِ وَبَارَكَ وَسَلَّمَ",
    latin:
        "Allahummahdinî fî man hadait, wa ‘âfinî fî man ‘âfait, wa tawallanî fî man tawallait, wa bâriklî fî mâ a‘thait, wa qinî syarra mâ qadhait, fa innaka taqdhî wa lâ yuqdhâ ‘alaik, wa innahû lâ yazillu man wâlait, wa lâ ya‘izzu man ‘âdait, tabârakta rabbanâ wa ta‘âlait, fa lakal ḫamdu a’lâ mâ qadhait, astaghfiruka wa atûbu ilaik, wa shallallâhu ‘alâ sayyidinâ muḫammadi-nin-nabiyyil ummiyyi wa ‘alâ âlihî wa shaḫbihî wa bâraka wa sallam.",
    arti:
        "Ya Allah tunjukanlah aku sebagaimana mereka yang telah Engkau beri petunjuk. Berilah kesehatan kepadaku sebagaimana mereka yang telah Engkau berikan kesehatan. Peliharalah aku sebagaimana orang-orang yang telah Engkau lindungi. Berikanlah keberkahan kepadaku pada apa yang telah Engkau berikan. Selamatkanlah aku dari bahaya kejahatan yang telah Engkau tentukan. Engkaulah yang menghukum dan bukan dihukum. Tidak hina orang yang Engkau jadikan pemimpin. Tidak mulia orang yang Engkau musuhi. Maha Suci Engkau wahai Tuhan kami dan Maha Tinggi Engkau. Bagi-Mu segala pujian di atas apa yang Engkau tentukan. Aku memohon ampun kepada-Mu dan bertaubat kepada-Mu. Semoga Allah mencurahkan rahmat, keselamatan, dan berkah atas junjungan kami Nabi Muhammad SAW, keluarga, dan para sahabatnya.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Sujud",
    kategori: "Sholat",
    arab: "سُبْحَانَ رَبِّيَ الْأَعْلَى وَبِحَمْدِهِ ×٣",
    latin: "Subhaana rabbiyal a'laa wabihamdihi (3 kali)",
    arti:
        "Mahasuci Rabbku Yang Mahatinggi dan pujian untuk-Nya (HR. Abu Daud).",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Duduk di antara dua sujud",
    kategori: "Sholat",
    arab:
        "رب اغْفِرلي وَارْحَمْنِى واجبرني وَارْفَعْنِي وَارْزُقْنِى وَاهْدِنِى وَعَافِنِى وَاعْفُ عَنِّى",
    latin:
        "Rabighfirlii, Warhamnii, Wajburnii, Warfa’ni, Warzuqnii, Wahdini, Wa’aafinii, Wa’fuannii ",
    arti:
        "Ya Allah, ampunilah dosaku, rahmatilah aku, perbaikilah aku, berikanlah aku rezeki dan angkatlah derajatku.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Duduk Tasyahud (Tahiyat Awal)",
    kategori: "Sholat",
    arab:
        "التَّحِيَّاتُ الْمُبَارَكَاتُ الصَّلَوَاتُ الطَّيِّبَاتُ لِلّٰهِ، السَّلَامُ عَلَيْكَ أيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ، السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللّٰهِ الصَّالِحِيْنَ، أشْهَدُ أَنْ لَّا إِلٰهَ إِلَّا اللّٰهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا رَّسُولُ اللّٰهِ اَللّٰهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ وَّعَلَى اٰلِ سَيِّدِنَا مُحَمَّدٍ",
    latin:
        "Attahiyyaatul mubaarakaatush sholawaatuth thayyibaatu lillaah. Assalaamu 'alaika ayyuhan nabiyyu wa rahmatullahi wabarakaatuh. Assalaaamu'alainaa wa 'alaa 'ibaadillaahish shaalihiin. Asyhadu allaa ilaaha illallah wa asyhadu anna Muhammadar rasuulullah. Allahumma shalli 'alaa sayyidinaa Muhammad.",
    arti:
        "Segala kehormatan, keberkahan, rahmat dan kebaikan adalah milik Allah. Semoga keselamatan, rahmat Allah dan berkah-Nya (tetap tercurahkan) atas mu, wahai Nabi (Muhammad). Semoga keselamatan (tetap terlimpahkan) atas kami dan atas hamba-hamba Allah yang saleh. Aku bersaksi bahwa tidak ada Tuhan selain Allah dan aku bersaksi bahwa Muhammad adalah utusan Allah.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Duduk Tasyahud (Tahiyat Akhir)",
    kategori: "Sholat",
    arab:
        " كَمَا صَلَّيْتَ عَلَى سَيِّدِنَا إِبْرَاهِيْمَ وَعَلَى اٰلِ سَيِّدِنَا إِبْرَاهِيْمَ وَبَارِكْ عَلَى سَيِّدِنَا مُحَمَّدٍ وَّعَلَى اٰلِ سَيِّدِنَا مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى سَيّدِنَا إِبْرَاهِيْمَ وَعَلَى اٰلِ سَيِّدِنَا إِبْرَاهِيْمَ فِي الْعَالَمِيْنَ إنَّكَ حَمِيْدٌ مَّجِيْدٌ اَللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، وَمِنْ عَذَابِ النَّارِ، وَمِنْ فِتْنَةِ الْمـحْيَا وَالْمَمَاتِ وَمِنْ فِتْنَةِ الْمَسِيْحِ الدَّجَّالِ",
    latin:
        "kamâ shallaitâ ‘alâ sayyidinâ ibrâhîm wa ‘alâ âli sayyidinâ ibrâhîm wa bârik ‘alâ sayyidinâ muḫammad wa ‘alâ âli sayyidinâ muḫammad kamâ bârakta ‘alâ sayyidinâ ibrâhîm wa ‘alâ âli sayyidinâ ibrâhîm. Fil ‘âlamîna innaka ḫamîdum majîd Allahummâ innî ‘aûdzubika min ‘adzâbil qabri wa min ‘adzâbin nâr wa min fitnatil maḫya wal mamati wa min fitnatil masîḫid dajjal",
    arti:
        "Ya Allah, limpahkanlah rahmat kepada junjungan kami Nabi Muhammad dan kepada keluarga junjungan kami Nabi Muhammad, sebagaimana pernah Engkau beri rahmat kepada junjungan kami Nabi Ibrahim dan kepada keluarga junjungan kami Nabi Ibrahim. Dan limpahilah berkah kepada kepada junjungan kami Nabi Muhammad dan kepada keluarga junjungan kami Nabi Muhammad, sebagaimana Engkau pernah beri berkah kepada junjungan kami Nabi Ibrahim dan kepada keluarga junjungan kami Nabi Ibrahim. Di seluruh alam semesta Engkaulah Yang Terpuji dan Mahamulia.Ya Allah. Aku berlindung dari siksa kubur, dan siksa api neraka dan aku berlindung dari fitnah hidup dan mati dan saya berlindung dari fitnah keburukan Dajjal.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Salam",
    kategori: "Sholat",
    arab: "السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللهِ",
    latin: "Assalaamu alaikum wa rahmatullah",
    arti: "Semoga keselamatan dan rahmat Allah dilimpahkan kepadamu.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Sujud Tilawah",
    kategori: "Sholat",
    arab:
        "سَجَدَ وَجْهِيَ لِلَّذِيْ خَلَقَهُ وَصَوَّرَهُ، وَشَقَّ سَمْعَهُ وَبَصَرَهُ، بِحَوْلِهِ وَقُوَّتِهِ فَتَبَارَكَ اللهُ أَحْسَنُ الْخَالِقِيْنَ",
    latin:
        "Sajada wajhiya lil ladzî khalaqahu wa shawwarahu wa syaqqa sam‘ahu wa basharahu bi ḫaulihi wa quwwatihi fa tabârakallâhu aḫsanul khâliqîna",
    arti:
        "Diriku bersujud kepada Dzat yang menciptakan dan membentuknya, membuka pendengaran dan penglihatannya dengan daya dan kekuatan-Nya. Mahasuci Allah, sebaik-baik pencipta.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Sujud Sahwi",
    kategori: "Sholat",
    arab: "سُبْحَانَ مَنْ لَا يَسْهُوْ وَلَا يَنَامُ",
    latin: "Subḫâna man lâ yashû wa lâ yanâmu",
    arti: "Mahasuci Dzat yang tidak pernah lupa dan tidak tidur",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Beres Sholat",
    kategori: "Sholat",
    arab:
        "اَللهُمَّ اِنَّا نَسْئَلُكَ سَلاَمَةً فِى الدِّيْنِ وَعَافِيَةً فِى الْجَسَدِ وَزِيَادَةً فِى الْعِلْمِ وَبَرَكَةً فِى الرِّزْقِ وَتَوْبَةً قَبْلَ الْمَوْتِ وَرَحْمَةً عِنْدَ الْمَوْتِ وَمَغْفِرَةً بَعْدَ الْمَوْتِ اَللهُمَّ هَوِّنْ عَلَيْنَا فِىْ سَكَرَاتِ الْمَوْتِ وَالنَّجَاةَ مِنَ النَّارِ وَالْعَفْوَ عِنْدَ الْحِسَابِ رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً ۚ إِنَّكَ أَنتَ ٱلْوَهَّابُ رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّار وصلى الله على سيدنا محمد وعلى اله وصحبه وسلم والحمد لله رب العالمين",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Istighfar Kanjeng Rosul",
    kategori: "Wudhu",
    arab:
        "اَللّٰهُمَّ اغْفِرْ لِيْ خَطِيْئَتِيْ وَجَهْلِيْ، وَإِسْرَافِيْ فِيْ أَمْرِيْ، وَمَا أَنْتَ أَعْلَمُ بِهِ مِنِّيْ، اَللّٰهُمَّ اغْفِرْ لِيْ جِدِّيْ وَهَزْلِيْ؛ وَخَطَئِيْ وَعَمْدِيْ؛ وَكُلُّ ذٰلِكَ عِنْدِيْ، اَللّٰهُمَّ اغْفِرْ لِيْ مَا قَدَّمْتُ وَمَا أَخَّرْتُ، وَمَا أَسْرَرْتُ وَمَا أَعْلَنْتُ، وَمَا أَنْتَ أَعْلَمُ بِهِ مِنِّيْ، أَنْتَ الْمُقَدِّمُ، وَأَنْتَ الْمُؤَخِّرُ لَا إِلٰهَ إِلَّا أَنْتَ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Sholawat Munjiat",
    kategori: "Dzikir Sholawat",
    arab:
        "اَللّٰهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ صَلاَةً تُنْجِيْنَا بِهَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْاٰفَاتِ وَتَقْضِيْ لَنَا بِهَا جَمِيعَ الْحَاجَاتِ وَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَيِّئَاتِ وَتَرْفَعُنَا بِهَا عِنْدَكَ أَعْلَى الدَّرَجَاتِ وَتُبَلِّغُنَا بِهَـــا أَقْصَى الْغَايَاتِ مِنْ جَمِيْعِ الْخَيْرَاتِ فِى الْحَيَاةِ وَبَعْدَ الْمَمَـــاتِ",
    latin: "",
    arti:
        "Ya Allah limpahkanlah rahmat kepada junjungan kami Nabi Muhammad, yang dengan shalawat itu, Engkau akan menyelamatkan kami dari semua keadaan yang menakutkan dan dari semua cobaan; dengan shalawat itu, Engkau akan mengabulkan hajat kami; dengan shalawat itu, Engkau akan menyucikan kami dari segala keburukan; dengan shalawat itu, Engkau akan mengangkat kami ke derajat paling tinggi; dengan shalawat itu pula, Engkau akan menyampaikan kami kepada tujuan yang paling sempurna dalam semua kebaikan, ketika hidup dan setelah mati.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "Doa Beres Sholat",
    kategori: "Sholat",
    arab:
        "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ. الْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِيْنَ حَمْدًا يُّوَافِيْ نِعَمَهُ وَ يُكَافِئُ مَزِيْدَهُ يَا رَبَّنَا لَكَ الْحَمْدُ كَمَا يَنْبَغِيْ لِجَلَالِ وَجْهِكَ وَعَظِيْمِ سُلْطَانِكَ. اللّٰهُمَّ صَلِّ وسَلِّمْ عَلَى سَيِّدِنَا مُحَمَّدٍ وَ آلِ سَيِّدِنَا مُحَمَّدٍ اَللّٰهُمَّ صَلِّ وَسَلِّمْ عَلٰى سَيِّدِنَا مُحَمَّدٍ صَلَاةً تُنْجِيْنَا بِهَا مِنْ جَمِيْعِ الْأَهْوَالِ وَالْآفَاتِ وَتَقْضِيْ لَنَا بِهَا مِنْ جَمِيعِ الْحَاجَاتِ وَتُطَهِّرُنَا بِهَا مِنْ جَمِيْعِ السَيِّئَاتِ وَتَرْفَعُنَا بِهَا عِنْدَكَ أَعْلَى الدَّرَجَاتِ وَتُبَلِّغُنَا بِهَا أَقْصَى الْغَايَاتِ مِنْ جَمِيْعِ الْخَيْرَاتِ فِي الْحَيَاةِ وَبَعْدَ الْمَمَاتِ",
    latin:
        "Bismillâhir-rahmânir-rahîm(i). Al-ḫamdulillâhi rabbil-`âlamîn(a), ḫamdan yuwâfî ni`amahu wa yukâfi’u mazîdahu yâ rabbanâ lakal-ḫamdu kamâ yanbaghî lijalâli wajhika wa `adhimi sulthânik(a). Allâhumma shalli wa sallim `ala sayyidinâ Muḫammadin wa âlihi sayyidinâ Muḫammad(in). Allâhumma shalli wa sallim `ala sayyidinâ Muḫammadin shalâtan tunjînâ bihâ min jamî`il-ahwâli wal-âfâti wa taqdî lanâ bihâ min jamî’il-ḫâjâti wa tuthahhirunâ bihâ min jamî`is-sayyi’ati wa tarfa`unâ bihâ `indaka a`lad-darajâti wa tuballighunâ bihâ aqshal-ghâyâti min jamî`il-khairâti fil-ḫayâti wa ba`dal-mamât(i).",
    arti:
        "Dengan nama Allah yang Maha Pengasih lagi Maha Penyayang. Segala puji bagi Allah, Tuhan semesta alam, dengan pujian yang sesuai dengan nikmatnya dan memungkinkan ditambah nikmatnya. Wahai Tuhan kami, hanya bagi-Mu segala puji, sebagaimana yang patut bagi keagungan-Mu dan kebesaran kekuasaan-Mu. Ya Allah, limpahkanlah rahmat kepada junjungan kami Baginda Muhammad, yang dengan shalawat itu Engkau selamatkan kami dari semua keadaan yang menakutkan dan dari semua cobaan, Engkau penuhi semua kebutuhan kami, Engkau bersihkan kami dari segala kejelekan, Engkau angkat kami ke derajat paling tinggi, dan Engkau sampaikan kami kepada tujuan yang paling sempurna dari semua kebaikan, ketika hidup dan setelah mati.",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
  DoaModel(
    judul: "",
    kategori: "Wudhu",
    arab: "",
    latin: "",
    arti: "",
    dalil: "",
    keterangan: "",
  ),
];
