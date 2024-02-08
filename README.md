# **Flutter firebase notification handler**

1. **Setup firebase cli install on windows**
    - Install node js for your system `Download node js from google and install it`
    - Setup All For Node JS Like Environment Etc `Node js all environment setup like bin path`
    - local/pub/cache/bin add in environment `Find from c drive user/appdata/local/pub/cache/bin`
    - Create firebase project `From firebase console create firebase project`
    - Select flutter option from project app `Choose flutter from applist of flutter project`
    - Install firebase cli tools
      ```shell
       npm install -g firebase-tools
      ```
    - Login firebase
      ```shell
       firebase login
      ```
    - Check firebase projects and select for setup
      ```shell
       firebase projects:list
      ```
    - Active cli `Instruction given in firebase flutter setting`
    - Configure cli (on root directory) `Instruction given in firebase flutter setting`
    - Add firebase_core dependencies `It's dependency`
    - Change to 21 minimum sdk `In build.gradle file`

2. **Flutter firebase setup**
    - Add necessary dependencies like firebase_core, firebase_messaging, flutter_local_notification,
      app_setting `https://pub.dev`
    - Make a class for firebase notification permission `Using firebase message`
    - Take 2 permission authorized and provisional if all are denied then open the setting for
      permission `2 permission authorized, provisional`

3. **Device token handle**
    - Generate token from and store `getToken`
    - Refresh token and store
    - Register token number in firebase messaging