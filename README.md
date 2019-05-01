# Spotify AdRemover
A batch script that blocks ads using Windows host file.

**Last tested version:** 1.1.4.197.g92d52c4f

# Features:
* Blocks all banner/video/audio ads within the app
* Unlocks the skip function for any track
* Set and forget
* Windows only

# How to use:
Just run batch script - That's all!

# How it works:
The script adds a list of addresses to the file hosts of Windows which sends to the address 0.0.0.0 so they never load.

    0.0.0.0 pubads.g.doubleclick.net
    0.0.0.0 securepubads.g.doubleclick.net
    0.0.0.0 www.googletagservices.com
    0.0.0.0 gads.pubmatic.com
    0.0.0.0 ads.pubmatic.com
    0.0.0.0 spclient.wg.spotify.com

# Known Bugs:
* Friends bar and radio functionality.
* Not working with 1.1.5.xxx version or newer.



