import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "hi_IN": {
          LanguagesKey.enterMobileNumber: "अपना फोन नंबर डालें",
          LanguagesKey.phoneNumber: "फ़ोन नंबर",
          LanguagesKey.verify: "सत्यापित करें",
          LanguagesKey.oR: "या",
          LanguagesKey.loginWithEmail: "ईमेल से लॉगिन करें",
          LanguagesKey.donthaveAccount: "कोई खाता नहीं है?",
          LanguagesKey.registerhere: "यहां रजिस्टर करें",
          LanguagesKey.loginAsGuest: "अतिथि के रूप में जारी रखें",
          //create with email
          LanguagesKey.createAccount: "खाता बनाएं",
          LanguagesKey.yourName: "आपका नाम",
          LanguagesKey.yourEmail: "आपका ईमेल",
          LanguagesKey.yourpassword: "आपका पासवर्ड",
          LanguagesKey.getStart: "शुरू हो जाओ",
          LanguagesKey.signupwithPhone: "फोन नंबर के साथ भाग लें",
          LanguagesKey.alreadyHaveAccount: "खाता पहले से मौजूद है?",
          LanguagesKey.signIn: "दाखिल करना",
          //create with phone
          LanguagesKey.signupwithemail: "ईमेल पते से साइन अप करें",
          LanguagesKey.yourPhonenumber: "आपका फोन नंबर",
          //login with email
          LanguagesKey.enteryourEmail: "अपना ईमेल पता दर्ज करें",
          LanguagesKey.email: "ईमेल",
          LanguagesKey.password: "पासवर्ड",
          LanguagesKey.login: "लॉग इन करें",
          LanguagesKey.loginwithNumber: "फ़ोन नंबर से लॉगिन करें",
          // otp verification screen
          LanguagesKey.enterTheOtp: "भेजे गए ओटीपी को दर्ज करें",
          LanguagesKey.submit: "जमा करना",
          LanguagesKey.didnotreceivecode: "कोई कोड प्राप्त नहीं हुआ?",
          LanguagesKey.rESENDCODE: "पुन: कोड भेजे",
          // account setting home
          LanguagesKey.accountsetting: "अकाउंट & सेटिंग",
          LanguagesKey.myFavorites: "मेरे प्रिय",
          LanguagesKey.myOrders: "मेरे आदेश",
          LanguagesKey.referEarn: "देखें & कमाएँ",
          LanguagesKey.appSettings: "एप्लिकेशन सेटिंग",
          LanguagesKey.privacyPolicy: "गोपनीयता नीति",
          //app setting
          LanguagesKey.editprofile: "प्रोफ़ाइल संपादित करें",
          LanguagesKey.language: "भाषा",
          LanguagesKey.notifications: "सूचनाएं",
          LanguagesKey.logout: "लॉग आउट",
          // notification setting
          LanguagesKey.notificationSound: "सूचना ध्वनि",
          LanguagesKey.vibration: "कंपन",
          LanguagesKey.offerNotification: "प्रस्ताव अधिसूचनाएँ",
          LanguagesKey.orderNotification: "आदेश अधिसूचनाएँ",
          //language view
          LanguagesKey.hindi: "हिंदी",
          //user profile
          LanguagesKey.userProfile: "उपयोगकर्ता रूपरेखा",
          LanguagesKey.fullName: "पूरा नाम",
          LanguagesKey.gender: "लिंग",
          LanguagesKey.state: "राज्य",
          LanguagesKey.city: "शहर",
          LanguagesKey.bio: "अपने बारे में",
          // my order
          LanguagesKey.delivered: "पहुंचा दिया",
          LanguagesKey.ongoing: "चल रहे",
          LanguagesKey.cancelled: "रद्द",
          LanguagesKey.noOrderFound: "कोई ऑर्डर नहीं मिला!",
          LanguagesKey.noOrderFoundMessage:
              "ऐसा लगता है कि आपने अभी तक कोई ऑर्डर नहीं दिया है. ",
          // my favorites
          LanguagesKey.noProductInWishList: "आपके पास कोई उत्पाद नहीं है",
          LanguagesKey.wishlist: "इच्छा-सूची",
          LanguagesKey.wishlistMessage:
              "अपनी इच्छा सूची में कोई भी आइटम जोड़ने के लिए बस ❤ पर टैप करें।",
          LanguagesKey.viewProduct: "उत्पाद देखें",
          // bottom nav
          LanguagesKey.home: "होम",
          LanguagesKey.category: "श्रेणी",
          LanguagesKey.cart: "कार्ट",
          LanguagesKey.alerts: "अलर्ट",
          LanguagesKey.options: "विकल्प",
          // empty notification
          LanguagesKey.noNotificationYet: "अभी तक कोई अधिसूचना नहीं",
          LanguagesKey.noNotficationMessage:
              "अभी आपके पास कोई सूचना नहीं है. \nबाद में वापस आना",
          //all address
          LanguagesKey.allAddressTitle: "डिलीवरी पता जोड़ें/संपादित करें",
          LanguagesKey.addNewAddress: "+ नया पता जोड़ें",
          LanguagesKey.noAddressFound: "कोई पता नहीं मिला!",
          LanguagesKey.noAddressmessage:
              "ऐसा लगता है जैसे आपने अभी तक कोई पता नहीं जोड़ा है।\nकृपया अपना पहला डिलीवरी पता जोड़ें।",
          //add new address
          LanguagesKey.address: "पता",
          LanguagesKey.usemyCurrentLocation: "मेरे वर्तमान स्थान का उपयोग करें",
          LanguagesKey.houseno: "मकान संख्या/भवन का नाम",
          LanguagesKey.roadArea: "सड़क/क्षेत्र/कॉलोनी",
          LanguagesKey.landmarkNearBy: "आस-पास का स्थान",
          LanguagesKey.pincode: "पिन कोड",
          LanguagesKey.addressTitle: "पता शीर्षक",
          LanguagesKey.contactName: "संपर्क नाम",
          LanguagesKey.contactNumber: "संपर्क संख्या",
          LanguagesKey.contactDetails: "सम्पर्क करने का विवरण",
          LanguagesKey.addnewAddressTitle: "नया पता जोड़ें",
          LanguagesKey.saveAddress: "पता सहेजें",
          //dashboard
          LanguagesKey.hello: "नमस्ते",
          LanguagesKey.letsExplore: "आइए ढूंढते हैं!",
          LanguagesKey.addDeliveryLocation: "डिलीवरी स्थान जोड़ें",
          LanguagesKey.weeklyTopDeals: "साप्ताहिक शीर्ष सौदे",
          LanguagesKey.viewall: "सभी को देखें",
          LanguagesKey.shopByBrand: "ब्रांड के अनुसार खरीदारी करें",
          LanguagesKey.budgetStore: "बजट स्टोर",
          //item details
          LanguagesKey.freeDelivery: "नि: शुल्क डिलिवरी",
          LanguagesKey.productDetails: "उत्पाद विवरण",
          LanguagesKey.checkDelivery: "डिलिवरी उपलब्धता की जाँच करें",
          LanguagesKey.checkDeliveryContent:
              "डिलीवरी शुल्क पिनकोड के अनुसार भिन्न हो सकते हैं",
          LanguagesKey.addToCart: "कार्ट में जोड़ें",
          LanguagesKey.buyNow: "अभी खरीदें",
          LanguagesKey.similarProducts: "इसी तरह के उत्पादों",
          LanguagesKey.availableSizes: "उपलब्ध आकार",
          // cart
          LanguagesKey.deliveryAddress: "डिलिवरी का पता",
          LanguagesKey.add: "जोड़ना",
          LanguagesKey.paymentMode: "भुगतान का प्रकार",
          LanguagesKey.online: "ऑनलाइन",
          LanguagesKey.cod: "डिलवरी पर नकदी",
          LanguagesKey.items: "सामान",
          LanguagesKey.productPriceTotal: "उत्पाद मूल्य कुल",
          LanguagesKey.deliveryCharge: "वितरण शुल्क",
          LanguagesKey.serviceCharge: "सेवा शुल्क",
          LanguagesKey.totalDiscount: "कुल छूट",
          LanguagesKey.orderTotal: "भुगतान",
          LanguagesKey.checkout: "चेक आउट",
        },
        "en_US": {
          LanguagesKey.enterMobileNumber: "Enter your phone number",
          LanguagesKey.phoneNumber: "Phone Number",
          LanguagesKey.verify: "Verify",
          LanguagesKey.oR: "OR",
          LanguagesKey.loginWithEmail: "Login with Email",
          LanguagesKey.donthaveAccount: "Don’t have an account? ",
          LanguagesKey.registerhere: "Register here",
          LanguagesKey.loginAsGuest: "Continue as a Guest",

          //create with email
          LanguagesKey.createAccount: "Create Account",
          LanguagesKey.yourName: "Your Name",
          LanguagesKey.yourEmail: "Your Email",
          LanguagesKey.yourpassword: "your Password",
          LanguagesKey.getStart: "Get Started",
          LanguagesKey.signupwithPhone: "Sign up with Phone Number",
          LanguagesKey.alreadyHaveAccount: "Already have an account?",
          LanguagesKey.signIn: "Sign In",
          //create with phone
          LanguagesKey.signupwithemail: "Sign up with Email Address",
          LanguagesKey.yourPhonenumber: "Your Phone Number",
          //login with email
          LanguagesKey.enteryourEmail: "Enter your email address",
          LanguagesKey.email: "Email",
          LanguagesKey.password: "Password",
          LanguagesKey.login: "Login",
          LanguagesKey.loginwithNumber: "Login with Phone Number",
          // otp verification screen
          LanguagesKey.enterTheOtp: "Enter the OTP sent to",
          LanguagesKey.submit: "Submit",
          LanguagesKey.didnotreceivecode: "Didn't receive any code?",
          LanguagesKey.rESENDCODE: "RESEND CODE",
          // account setting home
          LanguagesKey.accountsetting: "Account & settings",
          LanguagesKey.myFavorites: "My Favorites",
          LanguagesKey.myOrders: "My Orders",
          LanguagesKey.referEarn: "Refer & Earn",
          LanguagesKey.appSettings: "App Settings",
          LanguagesKey.privacyPolicy: "Privacy Policy",
          //app setting
          LanguagesKey.editprofile: "Edit Profile",
          LanguagesKey.language: "Language",
          LanguagesKey.notifications: "Notifications",
          LanguagesKey.logout: "Logout",
          // notification setting
          LanguagesKey.notificationSound: "Notification Sound",
          LanguagesKey.vibration: "Vibration",
          LanguagesKey.offerNotification: "Offer Notifications",
          //language view
          LanguagesKey.hindi: "Hindi",
          //user profile
          LanguagesKey.userProfile: "User Profile",
          LanguagesKey.fullName: "Full Name",
          LanguagesKey.gender: "Gender",
          LanguagesKey.state: "State",
          LanguagesKey.city: "City",
          LanguagesKey.bio: "Bio",
          // my order
          LanguagesKey.delivered: "Delivered",
          LanguagesKey.ongoing: "Ongoing",
          LanguagesKey.cancelled: "Cancelled",
          LanguagesKey.noOrderFound: "No Order Found!",
          LanguagesKey.noOrderFoundMessage:
              "Looks like you have not made any order yet. ",
          // my favorites
          LanguagesKey.noProductInWishList: "No product in you",
          LanguagesKey.wishlist: "Wishlist",
          LanguagesKey.wishlistMessage:
              "Just tap on ❤ to add any item to your wishlist.",
          LanguagesKey.viewProduct: "View Products",
          // bottom nav
          LanguagesKey.home: "Home",
          LanguagesKey.category: "Category",
          LanguagesKey.cart: "Cart",
          LanguagesKey.alerts: "Alerts",
          LanguagesKey.options: "Options",
          // empty notification
          LanguagesKey.noNotificationYet: "No Notifications Yet",
          LanguagesKey.noNotficationMessage:
              "You have no notifications right now. \ncome back later",
          //all address
          LanguagesKey.allAddressTitle: "Add / Edit Delivery Address",
          LanguagesKey.addNewAddress: "+ Add new address",
          LanguagesKey.noAddressFound: "No Addresses Found!",
          LanguagesKey.noAddressmessage:
              "Seems like you have not added any address yet.\nPlease add your first address of delivery.",
          //add new address
          LanguagesKey.address: "Address",
          LanguagesKey.usemyCurrentLocation: "Use my current location",
          LanguagesKey.houseno: "House No. / Building Name",
          LanguagesKey.roadArea: "Road / Area / Colony",
          LanguagesKey.landmarkNearBy: "Landmark / Nearby Place",
          LanguagesKey.pincode: "Pincode",
          LanguagesKey.addressTitle: "Address Title",
          LanguagesKey.contactName: "Contact Name",
          LanguagesKey.contactNumber: "Contact Number",
          LanguagesKey.contactDetails: "Contact Details",
          LanguagesKey.addnewAddressTitle: "Add new address",
          LanguagesKey.saveAddress: "Save Address",

          //dashboard
          LanguagesKey.hello: "Hello",
          LanguagesKey.letsExplore: "Let’s explore!",
          LanguagesKey.addDeliveryLocation: "Add delivery location",
          LanguagesKey.weeklyTopDeals: "Weekly Top Deals",
          LanguagesKey.viewall: "View All",
          LanguagesKey.shopByBrand: "Shop by brands",
          LanguagesKey.budgetStore: "Budget Store",
          //item details
          LanguagesKey.freeDelivery: "Free Delivery",
          LanguagesKey.productDetails: "Product Details",
          LanguagesKey.checkDelivery: "Check Delivery Availablity",
          LanguagesKey.checkDeliveryContent:
              "Delivery charges may vary according to pincode",
          LanguagesKey.addToCart: "Add to cart",
          LanguagesKey.buyNow: "Buy Now",
          LanguagesKey.similarProducts: "Similar Products",
          LanguagesKey.availableSizes: "Available Sizes",
          // cart
          LanguagesKey.deliveryAddress: "Delivery Address",
          LanguagesKey.add: "Add",
          LanguagesKey.paymentMode: "Payment Mode",
          LanguagesKey.online: "Online",
          LanguagesKey.cod: "Cash on delivery",
          LanguagesKey.items: "items",
          LanguagesKey.productPriceTotal: "Product Price Total",
          LanguagesKey.deliveryCharge: "Delivery Charge",
          LanguagesKey.serviceCharge: "Service Charge",
          LanguagesKey.totalDiscount: "Total Discount",
          LanguagesKey.orderTotal: "Order Total",
          LanguagesKey.checkout: "Checkout",
        },
      };
}

class LanguagesKey {
// cart
  static String deliveryAddress = "Delivery Address";
  static String add = "add";
  static String paymentMode = "Payment Mode";
  static String online = "Online";
  static String cod = "Cash on delivery";
  static String priceDetails = "Price Details";
  static String items = "items";
  static String productPriceTotal = "Product Price Total";
  static String deliveryCharge = "Delivery Charge";
  static String serviceCharge = "Service Charge";
  static String totalDiscount = "Total Discount";
  static String orderTotal = "Order Total";
  static String checkout = "Checkout";

  //item details
  static String freeDelivery = "Free Delivery";
  static String productDetails = "Product Details";
  static String checkDelivery = "Check Delivery Availablity";
  static String checkDeliveryContent =
      "Delivery charges may vary according to pincode";
  static String addToCart = "addtocart";
  static String buyNow = "buynow";
  static String similarProducts = "Similar Products";
  static String availableSizes = "Available Sizes";

  //dashboard
  static String hello = "hello";
  static String letsExplore = "letsExplore";
  static String addDeliveryLocation = "addDeliveryLocation";
  static String weeklyTopDeals = "weeklyTopDeals";
  static String viewall = "viewall";
  static String budgetStore = "budgetStore";
  static String shopByBrand = "shopByBrand";

//add new address
  static String address = "Address";
  static String usemyCurrentLocation = "Use my current location";
  static String houseno = "House No. / Building Name";
  static String roadArea = "Road / Area / Colony";
  static String landmarkNearBy = "Landmark / Nearby Place";
  static String pincode = "Pincode";
  static String addressTitle = "Address Title";
  static String contactName = "Contact Name";
  static String contactNumber = "Contact Number";
  static String contactDetails = "Contact Details";
  static String addnewAddressTitle = "Add new address";
  static String saveAddress = "Save Address";

  //all address
  static String allAddressTitle = "allAddressTitle";
  static String addNewAddress = "addNewAddress";
  static String noAddressFound = "noAddressFound";
  static String noAddressmessage = "noAddressmessage";
  // empty notification
  static String noNotificationYet = "No Notifications Yet";
  static String noNotficationMessage = "NonotificationMessage";

  // bottom nav
  static String home = "Home";
  static String category = "Category";
  static String cart = "Cart";
  static String alerts = "Alerts";
  static String options = "Options";

  // my favorites
  static String noProductInWishList = "No product in you";
  static String wishlist = "Wishlist";
  static String wishlistMessage =
      "Just tap on ❤ to add any item to your wishlist.";
  static String viewProduct = "View Products";

// my order
  static String delivered = "Delivered";
  static String ongoing = "Ongoing";
  static String cancelled = "Cancelled";
  static String noOrderFound = "No Order Found!";
  static String noOrderFoundMessage = "noOrderFoundMessage";

  //user profile
  static String userProfile = "User Profile";
  static String fullName = "Full Name";
  static String gender = "Gender";
  static String state = "State";
  static String city = "City";
  static String bio = "Bio";

  //language view
  static String hindi = "hindi";
  // notification setting
  static String notificationSound = "Notification Sound";
  static String vibration = "Vibration";
  static String offerNotification = "Offer Notifications";
  static String orderNotification = "Order Notifications";

  //app setting
  static String editprofile = "Edit Profile";
  static String language = "Language";
  static String notifications = "Notifications";
  static String logout = "Logout";

  // account setting home
  static String accountsetting = "Account & settings";
  static String myFavorites = "My Favorites";
  static String myOrders = "My Orders";
  static String referEarn = "Refer & Earn";
  static String appSettings = "App Settings";
  static String privacyPolicy = "Privacy Policy";

  // otp verification screen
  static String enterTheOtp = "Enter the OTP sent to";
  static String submit = "Submit";
  static String rESENDCODE = "RESEND CODE";
  static String didnotreceivecode = "Didn't receive any code?";

  //login with email
  static String enteryourEmail = "Enter your email address";
  static String email = "Email";
  static String password = "Password";
  static String loginwithNumber = "Login with Phone Number";
  static String login = "Login";

  //create with phone
  static String signupwithemail = "Sign up with Email Address";
  static String yourPhonenumber = "Your Phone Number";

  //create with email
  static String createAccount = "Create Account";
  static String yourName = "Your Name";
  static String yourEmail = "Your Email";
  static String yourpassword = "your Password";
  static String getStart = "Get Started";
  static String signupwithPhone = "Sign up with Phone Number";
  static String alreadyHaveAccount = "Already have an account?";
  static String signIn = "Sign In";

  //login with phone
  static String enterMobileNumber = "enteryournumber";
  static String phoneNumber = "Phone Number";
  static String verify = "Verify";
  static String oR = "OR";
  static String loginWithEmail = "loginWithemail";
  static String donthaveAccount = "dontHaveAccount";
  static String registerhere = "Register here";
  static String loginAsGuest = "loginGuest";
}
