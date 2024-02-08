# **Flutter firebase notification handler**

1. **Setup firebase cli install on windows**
    - Install node js for your system
    - Setup All For Node JS Like Environment Etc
    - local/pub/cache/bin add in environment
    - Create firebase project
    - Select flutter option from project app
    - Install firebase cli
    - Login firebase
    - Check firebase projects and select for setup
    - Active cli
    - Configure cli (on root directory)
    - Add firebase_core dependencies
    - Change to 21 minimum sdk
   
2. **Flutter firebase setup**
    - Add necessary dependencies like firebase_core, firebase_messaging, flutter_local_notification, app_setting
    - Make a class for firebase notification permission
    - Take 2 permission authorized and probational if all are denied then open the setting for permission

3. **Device token handle**
    - Generate token from and store
    - Refresh token and store
    - Register token number in firebase messaging