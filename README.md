Cordova Lookback Plugin
=======================

Official Cordova plugin for http://lookback.io. Originally written by
[Ryan French](https://github.com/RYFN), to whom Lookback owes its eternal
gratitude.

Methods will be accessable on the window.Lookback object.

Utilizes Lookback Safe, which will not record with as good framerate as Lookback
HD, but can freely be deployed to AppStore. (I'll make the cordova plugin
automatically choose the correct plugin variant (HD or Safe) depending on
build configuration once I figure out how).

Install
-------

Install with `cordova plugin add https://github.com/lookback/cordova-lookback`

Currently supported functions
-----------------------------

The most important pieces of functionality from the
[full API](https://s3-eu-west-1.amazonaws.com/lookback-public/docs/ios/1.2.0/Lookback_h/Classes/Lookback/index.html#//apple_ref/occ/cl/Lookback)
has been implemented.

### setupWithAppToken
call this first, once, and after device ready.

### shakeToRecord
true|false

### userIdentifier
If your app has a login system, you can use the user name from your own service to identify the user who made the recording.

### paused
true|false

### enteredView
pass in a view name

### exitedView
pass in a view name

Example
-------

    document.addEventListener('deviceready', function(){
            window.Lookback.setupWithAppToken('your-app-token');
            window.Lookback.shakeToRecord(true);
            
            // optional: store user's name with recording
            window.Lookback.userIdentifier('name or email of user'); 
        }, false);

or to try some optional features:

    document.addEventListener('deviceready', function(){
        window.Lookback.setupWithAppToken('your-app-token');
        window.Lookback.shakeToRecord(false);
        
        window.Lookback.userIdentifier('name or email of user'); // optional
        
        window.Lookback.enteredView('my view name');
    }, false);

License
-------

Use of lookback.io Framework subject to terms available on http://lookback.io

