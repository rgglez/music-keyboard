# Musical Keyboard 

This is a program I wrote in Pascal (Turbo Pascal) in 1992, when I was in senior high school.

It is inteded to play simple tunes out of the PC speaker, using the frequencies of the notes of a well tempered scale (rounded to the nearest integer value), and the duration specified in miliseconds. You can find the frequencies here: [Frequencies for equal-tempered scale, A4 = 440 Hz](https://pages.mtu.edu/~suits/notefreqs.html). Back in 1992, I had to figure out those frequencies from a Yamaha manual and the booklet of Fresh Aire 7 by Mannheim Steamroller. You'll need to figure out the duration of the notes by yourself when transcribing a tune.

Included are the notes and their duration for a simple version of Stille Nacht (a classic Christmas song which happens to be in the public domain), in the file NOCHEPAZ.DAT which is a text file with two columns (freq and milliseconds).

The GUI is rendered in graphics mode using a kind of vector graphics, with the points stored at PSS795PT.DAT, trying to give the aspect of a [Yamaha PSS-795](https://uk.yamaha.com/files/download/other_assets/5/317385/PSS795S2.pdf) keyboard.

To compile it, (if it still [compiles](https://www.youtube.com/watch?v=cbGAv0TWx0k) in a DOS window or on a virtual machine) you would need the next files, which [came](https://www.javiergutierrezchamorro.com/los-archivos-bgi-y-svga-bgi-4-00/) with the Turbo Pascal package:

* ATT.BGI
* CGA.BGI
* EGAVGA.BGI
* HERC.BGI
* PC3270.BGI
* GOTH.CHR
* LITT.CHR
* SANS.CHR
* TRIP.CHR

And of course, you will need Turbo Pascal 5.5 or higher.

You can play with the PC keyboard too. You may need to configure the keyboard with the DOS command KEYB SP,437, since it's intended to be used with a BTC5349-style keyboard, when used in this "manual mode".

## License

Copyright 1992 Rodolfo González González.

[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg