// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars final
Map<String, dynamic> environment = {
  "appConfig": "lib/config/config_en.json",
  "serverConfig": {
    "url": "https://goldencollectionbh.myshopify.com/",
    "type": "shopify",
    "accessToken": "bc2c146b51a3f824879e69e56d12b8a6"
  },
  "defaultDarkTheme": false,
  "enableRemoteConfigFirebase": false,
  "loginSMSConstants": {
    "dialCodeDefault": "+973",
    "countryCodeDefault": "BH",
    "nameDefault": "Bahrain"
  },
  "phoneNumberConfig": {
    "dialCodeDefault": "+973",
    "selectorType": "BOTTOM_SHEET",
    "showCountryFlag": true,
    "customCountryList": [],
    "countryCodeDefault": "BH",
    "enablePhoneNumberValidation": false,
    "useInternationalFormat": true,
    "selectorFlagAsPrefixIcon": true
  },
  "storeIdentifier": {
    "disable": false,
    "ios": "6443965225",
    "android": "com.goldencollections.net"
  },
  "advanceConfig": {
    "DefaultLanguage": "ar",
    "DetailedBlogLayout": "halfSizeImageType",
    "EnablePointReward": true,
    "hideOutOfStock": false,
    "HideEmptyTags": true,
    "HideEmptyCategories": true,
    "EnableRating": true,
    "hideEmptyProductListRating": true,
    "EnableCart": true,
    "ShowBottomCornerCart": true,
    "EnableSkuSearch": true,
    "showStockStatus": true,
    "GridCount": 3,
    "isCaching": false,
    "kIsResizeImage": false,
    "httpCache": true,
    "Currencies": [
      {
        "symbol": "\$",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "USD",
        "currencyCode": "USD",
        "smallestUnitRate": 100
      },
      {
        "symbol": "₹",
        "decimalDigits": 0,
        "symbolBeforeTheNumber": true,
        "currency": "INR",
        "currencyCode": "INR",
        "smallestUnitRate": 100
      },
      {
        "symbol": "đ",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": false,
        "currency": "VND",
        "currencyCode": "VND",
        "smallestUnitRate": 100
      },
      {
        "symbol": "€",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "EUR",
        "currencyCode": "EUR",
        "smallestUnitRate": 100
      },
      {
        "symbol": "£",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "Pound sterling",
        "currencyCode": "GBP",
        "smallestUnitRate": 100
      },
      {
        "symbol": "AR\$",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "ARS",
        "currencyCode": "ARS",
        "smallestUnitRate": 100
      }
    ],
    "DefaultStoreViewCode": "",
    "EnableAttributesConfigurableProduct": ["color", "size"],
    "EnableAttributesLabelConfigurableProduct": ["color", "size"],
    "isMultiLanguages": true,
    "EnableApprovedReview": false,
    "EnableSyncCartFromWebsite": false,
    "EnableSyncCartToWebsite": false,
    "EnableFirebase": true,
    "RatioProductImage": 1.2,
    "EnableCouponCode": true,
    "ShowCouponList": true,
    "ShowAllCoupons": false,
    "ShowExpiredCoupons": true,
    "AlwaysShowTabBar": false,
    "PrivacyPoliciesPageId": null,
    "PrivacyPoliciesPageUrl": "https://mstore.io/privacy-and-term/",
    "SupportPageUrl": "https://support.inspireui.com/",
    "DownloadPageUrl": "https://mstore.io/#download",
    "SocialConnectUrl": [
      {
        "name": "Facebook",
        "url": "https://www.facebook.com/inspireui",
        "icon": "assets/icons/logins/facebook.png"
      },
      {
        "url": "https://www.instagram.com/inspireui9/",
        "name": "Instagram",
        "icon": "assets/icons/logins/instagram.png"
      }
    ],
    "AutoDetectLanguage": true,
    "QueryRadiusDistance": 10,
    "MinQueryRadiusDistance": 1,
    "MaxQueryRadiusDistance": 10,
    "EnableMembershipUltimate": false,
    "EnablePaidMembershipPro": false,
    "EnableDeliveryDateOnCheckout": false,
    "EnableNewSMSLogin": false,
    "EnableBottomAddToCart": false,
    "inAppWebView": true,
    "EnableWOOCSCurrencySwitcher": false,
    "enableProductBackdrop": false,
    "categoryImageMenu": true,
    "EnableDigitsMobileLogin": false,
    "OnBoardOnlyShowFirstTime": true,
    "WebViewScript": "",
    "EnableVersionCheck": false,
    "AjaxSearchURL": "",
    "AlwaysClearWebViewCache": false,
    "AlwaysRefreshBlog": false,
    "OrderNotesWithPrivateNote": true,
    "OrderNotesLinkSupport": false,
    "inAppUpdateForAndroid": {"typeUpdate": "flexible", "enable": true},
    "categoryConfig": {"enableLargeCategories": false},
    "pinnedProductTags": [],
    "gdpr": {
      "showDeleteAccount": true,
      "confirmCaptcha": "PERMANENTLY DELETE",
      "showPrivacyPolicyFirstTime": false
    },
    "EnableShipping": true,
    "EnableShoppingCart": false,
    "googleApiKey": {
      "android": "AIzaSyDW3uXzZepWBPi-69BIYKyS-xo9NjFSFhQ",
      "ios": "AIzaSyDW3uXzZepWBPi-69BIYKyS-xo9NjFSFhQ",
      "web": "AIzaSyDW3uXzZepWBPi-69BIYKyS-xo9NjFSFhQ"
    },
    "DefaultCurrency": {
      "currencyCode": "BHD",
      "decimalDigits": 3,
      "currency": "BHD",
      "symbol": "BD",
      "symbolBeforeTheNumber": true,
      "smallestUnitRate": 100
    }
  },
  "defaultDrawer": {
    "items": [
      {"show": true, "type": "home"},
      {"show": true, "type": "blog"},
      {"type": "categories", "show": true},
      {"type": "cart", "show": true},
      {"show": true, "type": "profile"},
      {"type": "login", "show": true},
      {"type": "category", "show": true}
    ],
    "logo": "assets/images/logo.png"
  },
  "defaultSettings": [
    "products",
    "chat",
    "wishlist",
    "notifications",
    "language",
    "darkTheme",
    "order",
    "rating",
    "privacy",
    "about"
  ],
  "loginSetting": {
    "smsLoginAsDefault": false,
    "showPhoneNumberWhenRegister": true,
    "IsRequiredLogin": false,
    "facebookClientToken": "",
    "isResetPasswordSupported": true,
    "facebookLoginProtocolScheme": "",
    "facebookAppId": "",
    "requirePhoneNumberWhenRegister": true
  },
  "oneSignalKey": {
    "appID": "8b45b6db-7421-45e1-85aa-75e597f62714",
    "enable": false
  },
  "onBoardingData": [
    {
      "title": "مرحبا بك في أفضل متجر للعطور",
      "desc": "شكرا للإنضمامك مع عائلة جولدن كولكشن ",
      "image": "https://i.imgur.com/nFFlAZe.png"
    },
    {
      "title": "أكثر من 500 صنف",
      "image": "https://i.imgur.com/vD789KA.png",
      "desc": "اكيد بتحصل عطرك المفضل من ضمن تشكيلتنا الواسعة جدا"
    },
    {
      "title": "هيا لنبدأ",
      "desc": "استمتع بالتسوق مع الأسعار الخيالية والجودة العالية",
      "image": "https://i.imgur.com/pILFvUp.png"
    }
  ],
  "adConfig": {
    "facebookTestingId": "",
    "enable": false,
    "googleTestingId": [],
    "ads": [
      {
        "showOnScreens": ["home", "search"],
        "provider": "google",
        "hideOnScreens": [],
        "androidId": "ca-app-pub-3940256099942544/6300978111",
        "type": "banner",
        "iosId": "ca-app-pub-3940256099942544/2934735716"
      },
      {
        "hideOnScreens": [],
        "androidId": "ca-app-pub-2101182411274198/4052745095",
        "provider": "google",
        "type": "banner",
        "iosId": "ca-app-pub-2101182411274198/5418791562"
      },
      {
        "hideOnScreens": [],
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/4411468910",
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "type": "interstitial"
      },
      {
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/1712485313",
        "hideOnScreens": [],
        "type": "reward"
      },
      {
        "provider": "facebook",
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489007588618919",
        "iosId": "IMG_16_9_APP_INSTALL#430258564493822_876131259906548",
        "hideOnScreens": [],
        "type": "banner"
      },
      {
        "hideOnScreens": [],
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489092398610438",
        "type": "interstitial",
        "provider": "facebook",
        "iosId": "430258564493822_489092398610438"
      }
    ]
  },
  "firebaseDynamicLinkConfig": {
    "uriPrefix": "https://goldencollections.page.link",
    "iOSBundleId": "com.goldencollections.net",
    "androidPackageName": "com.goldencollections.net",
    "isEnabled": true,
    "link": "https://goldencollections.net/",
    "iOSAppStoreId": "6443965225",
    "androidAppMinimumVersion": 1,
    "iOSAppMinimumVersion": "1.0.1"
  },
  "languagesInfo": [
    {
      "name": "English",
      "icon": "assets/images/country/gb.png",
      "code": "en",
      "text": "English",
      "storeViewCode": ""
    },
    {
      "name": "Arabic",
      "icon": "assets/images/country/ar.png",
      "code": "ar",
      "text": "العربية",
      "storeViewCode": "ar"
    }
  ],
  "paymentConfig": {
    "DefaultCountryISOCode": "BH",
    "allowSearchingAddress": true,
    "EnableShipping": true,
    "EnableOnePageCheckout": true,
    "EnableReview": true,
    "UpdateOrderStatus": false,
    "ShowOrderNotes": true,
    "EnableCustomerNote": true,
    "EnableAddress": true,
    "DefaultStateISOCode": "",
    "EnableRefundCancel": false,
    "CheckoutPageSlug": {"en": "checkout"},
    "EnableAlphanumericZipCode": false,
    "NativeOnePageCheckout": false,
    "GuestCheckout": true,
    "EnableCreditCard": false,
    "EnableAddressLocationNote": false
  },
  "payments": {
    "stripe": "assets/icons/payment/stripe.png",
    "tap": "assets/icons/payment/tap.png",
    "paypal": "assets/icons/payment/paypal.png",
    "razorpay": "assets/icons/payment/razorpay.png"
  },
  "stripeConfig": {
    "serverEndpoint": "https://stripe-server.vercel.app",
    "enableManualCapture": false,
    "paymentMethodId": "stripe",
    "returnUrl": "fluxstore://inspireui.com",
    "enabled": true,
    "publishableKey": "pk_test_MOl5vYzj1GiFnRsqpAIHxZJl"
  },
  "paypalConfig": {
    "production": false,
    "clientId":
        "ASlpjFreiGp3gggRKo6YzXMyGM6-NwndBAQ707k6z3-WkSSMTPDfEFmNmky6dBX00lik8wKdToWiJj5w",
    "enabled": true,
    "secret":
        "ECbFREri7NFj64FI_9WzS6A0Az2DqNLrVokBo0ZBu4enHZKMKOvX45v9Y1NBPKFr6QJv2KaSp5vk5A1G",
    "paymentMethodId": "paypal"
  },
  "razorpayConfig": {
    "keySecret": "RrgfT3oxbJdaeHSzvuzaJRZf",
    "paymentMethodId": "razorpay",
    "enabled": true,
    "keyId": "rzp_test_SDo2WKBNQXDk5Y"
  },
  "tapConfig": {
    "SecretKey": "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
    "enabled": true,
    "paymentMethodId": "tap"
  },
  "mercadoPagoConfig": {
    "production": false,
    "paymentMethodId": "woo-mercado-pago-basic",
    "enabled": true,
    "accessToken":
        "TEST-5726912977510261-102413-65873095dc5b0a877969b7f6ffcceee4-613803978"
  },
  "payTmConfig": {
    "merchantId": "your-merchant-id",
    "enabled": true,
    "paymentMethodId": "paytm",
    "production": false
  },
  "payStackConfig": {
    "enabled": true,
    "paymentMethodId": "paystack",
    "production": false,
    "publicKey": "pk_test_a1a37615c9ca90dead5dd84dedbb5e476b640a6f"
  },
  "flutterwaveConfig": {
    "paymentMethodId": "rave",
    "production": false,
    "enabled": true,
    "publicKey": "FLWPUBK_TEST-72b90e0734da8c9e43916adf63cd711e-X"
  },
  "myFatoorahConfig": {
    "accountCountry": "KW",
    "paymentMethodId": "myfatoorah_v2",
    "apiToken":
        "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
    "enabled": false,
    "production": false
  },
  "defaultCountryShipping": [
    {"iosCode": "SA", "name": "Saudi Arabia", "icon": null},
    {"emoji": "🇮🇩", "icon": null, "name": "BAHRAIN", "iosCode": "BH"}
  ],
  "afterShip": {
    "tracking_url": "https://fluxstore.aftership.com",
    "api": "e2e9bae8-ee39-46a9-a084-781d0139274f"
  },
  "googleApiKey": {
    "ios": "AIzaSyDJVCComfGisIBBRMRe_tw6m-UoS7YVWkk",
    "web": "AIzaSyDJVCComfGisIBBRMRe_tw6m-UoS7YVWkk",
    "android": "AIzaSyDJVCComfGisIBBRMRe_tw6m-UoS7YVWkk"
  },
  "productDetail": {
    "ShowSelectedImageVariant": false,
    "safeArea": false,
    "showRelatedProduct": true,
    "showThumbnailAtLeast": 1,
    "productImageLayout": "page",
    "autoPlayGallery": false,
    "productMetaDataKey": "",
    "hideInvalidAttributes": false,
    "showProductCategories": true,
    "showVideo": true,
    "productListItemHeight": 125.0,
    "height": 0.4,
    "layout": "simpleType",
    "SliderShowGoBackButton": true,
    "ForceWhiteBackground": false,
    "marginTop": 0,
    "borderRadius": 3,
    "AutoSelectFirstAttribute": true,
    "showStockQuantity": true,
    "ShowImageGallery": false,
    "allowMultiple": false,
    "showRelatedProductFromSameStore": true,
    "showQuantityInList": false,
    "showAddToCartInSearchResult": false,
    "boxFit": "cover",
    "showProductTags": true,
    "SliderIndicatorType": "number",
    "showSku": true,
    "attributeImagesSize": 50
  },
  "blogDetail": {
    "enableAudioSupport": false,
    "showSharing": true,
    "showHeart": true,
    "showComment": true,
    "showTextAdjustment": true
  },
  "productVariantLayout": {
    "color-image": "image",
    "size": "box",
    "color": "color",
    "height": "option"
  },
  "productAddons": {
    "allowCustomType": true,
    "fileUploadSizeLimit": 5,
    "allowVideoType": true,
    "allowImageType": true,
    "allowedCustomType": ["png", "pdf", "docx"],
    "allowMultiple": false
  },
  "cartDetail": {"maxAllowQuantity": 100000, "minAllowTotalCartValue": 0},
  "productVariantLanguage": {
    "vi": {
      "size": "Kích thước",
      "color": "Màu",
      "height": "Chiều Cao",
      "color-image": "Màu"
    },
    "ar": {
      "color": "اللون",
      "height": "ارتفاع",
      "size": "بحجم",
      "color-image": "اللون"
    },
    "en": {
      "height": "Height",
      "color": "Color",
      "color-image": "Color",
      "size": "Size"
    }
  },
  "excludedCategory": 311,
  "saleOffProduct": {
    "HideEmptySaleOffLayout": false,
    "ShowCountDown": true,
    "Color": "#C7222B"
  },
  "notStrictVisibleVariant": true,
  "configChat": {
    "showOnScreens": [
      "profile",
      "home",
      "home-search",
      "update-user",
      "products",
      "product",
      "wishlist",
      "checkout",
      "orders",
      "order-detail",
      "category",
      "notify",
      "category-search",
      "search",
      "cart",
      "page",
      "html",
      "static",
      "postScreen",
      "dynamic"
    ],
    "hideOnScreens": [],
    "EnableSmartChat": true
  },
  "smartChat": [
    {
      "imageData": "https://i.imgur.com/1tq3ZY1.png",
      "description": "tiktok",
      "iconData": "whatsapp",
      "app": "https://www.tiktok.com/@golden.collections"
    },
    {
      "iconData": "whatsapp",
      "description": "instagram",
      "imageData": "https://i.imgur.com/7raiFap.png",
      "app": "https://www.instagram.com/goldencollections/"
    },
    {
      "app": "https://wa.me/+97337266188",
      "description": "Whatsapp",
      "iconData": "whatsapp",
      "imageData": "https://i.imgur.com/wSHRY1f.png"
    },
    {"iconData": "phone", "description": "Call", "app": "tel:+97335575598"}
  ],
  "adminEmail": "admininspireui@gmail.com",
  "adminName": "InspireUI",
  "deliveryConfig": {"DisableDeliveryManagement": false},
  "managerConfig": {
    "appLogo": "assets/images/app_icon_transparent.png",
    "appName": "FluxStore Admin",
    "enableDeliveryFeature": false
  },
  "loadingIcon": {
    "path":
        "https://trello.com/1/cards/635102cd80e18e14611e09d6/attachments/635102d08129cb03ab99a3d3/download/%D8%AA%D8%AD%D8%B1%D9%8A%D9%83-%D8%B4%D8%B9%D8%A7%D8%B1.gif",
    "layout": "image"
  },
  "splashScreen": {
    "enable": true,
    "boxFit": "contain",
    "paddingTop": 0,
    "duration": 2000,
    "image":
        "https://trello.com/1/cards/6235f3974534c94419e4c396/attachments/6352d3b6acceb701032c9ec8/download/splashscreen.gif",
    "paddingBottom": 0,
    "animationName": "",
    "type": "static",
    "paddingRight": 0,
    "paddingLeft": 0,
    "backgroundColor": "#ffffff"
  },
  "darkConfig": {
    "MainColor": "ffffffff",
    "logo": "https://i.imgur.com/xkINips.png",
    "textColor": "ffe3f2fd"
  },
  "enableOnBoarding": true,
  "unsupportedLanguages": ["ku"],
  "lightConfig": {
    "MainColor": "ff000000",
    "logo": "https://i.imgur.com/jgSX3IF.png"
  },
  "productCard": {
    "hidePrice": false,
    "hideStore": true,
    "hideTitle": false,
    "borderRadius": 3.0,
    "enableRating": true,
    "showCartButton": false,
    "showCartIcon": false,
    "showCartIconColor": false,
    "showCartButtonWithQuantity": false,
    "boxFit": "cover"
  },
  "addressFields": [
    {
      "required": true,
      "defaultValue": "",
      "position": 1,
      "type": "firstName",
      "editable": true,
      "visible": true
    },
    {
      "required": true,
      "defaultValue": "",
      "editable": true,
      "visible": true,
      "type": "lastName",
      "position": 2
    },
    {
      "required": true,
      "editable": true,
      "defaultValue": "",
      "position": 3,
      "type": "phoneNumber",
      "visible": true
    },
    {
      "position": 4,
      "visible": true,
      "type": "email",
      "required": true,
      "defaultValue": "",
      "editable": true
    },
    {"position": 5, "type": "searchAddress", "visible": true},
    {"position": 6, "type": "selectAddress", "visible": true},
    {"position": 7, "type": "country", "visible": true},
    {"position": 8, "visible": true, "type": "state"},
    {
      "editable": false,
      "visible": true,
      "defaultValue": "",
      "position": 9,
      "required": true,
      "type": "city"
    },
    {
      "defaultValue": "oh no",
      "required": false,
      "type": "apartment",
      "visible": true,
      "editable": false,
      "position": 10
    },
    {
      "position": 11,
      "required": false,
      "editable": true,
      "type": "block",
      "visible": true,
      "defaultValue": ""
    },
    {
      "editable": true,
      "visible": true,
      "required": true,
      "defaultValue": "",
      "type": "street",
      "position": 12
    },
    {
      "type": "zipCode",
      "editable": true,
      "visible": true,
      "defaultValue": "",
      "position": 13,
      "required": true
    }
  ]
};
