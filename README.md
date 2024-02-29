# PowerShell scripts for synchronizing NinjaTrader 8 files to all of your NT 8 instances.

With NT 8 running under Windows, we've all experienced the problems that NT and OneDrive have.  This is tragic as it would otherwise provide
a seamless way to get files both backed up offsite and changes applied to other systems running NT.

These scripts provide synchronization for adding new data to the cloud location and pulling that same data to other systems to use almost in 
real-time.

They are dependent on Watchman and Unison to respectively detect changes and perform the appropriate synchronisation.

Watchman info: https://facebook.github.io/watchman/
Install for Windows via Chocolatey.  Use: choco install watchman
