#!/bin/sh
#ukuran 595.276 x 841.89 pts (A4)
###add a 10mm (= 1cm = 28pts) gutter to the A4 document
#-dDEVICEWIDTHPOINTS=623 (=595+28, i.e., width of A4 + the gutter to be added)
###{} {28 0 translate}     ({do nothing to odd pages} {shift event pages 28pts right & 0pts up} )

gs -q -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -sOutputFile=siapprint.pdf \
  -dDEVICEWIDTHPOINTS=623.276  -dDEVICEHEIGHTPOINTS=841.89 -dFIXEDMEDIA \
  -c "<< /CurrPageNum 1 def /Install { /CurrPageNum CurrPageNum 1 add def
   CurrPageNum 2 mod 1 eq {} {28 0 translate} ifelse } bind  >> setpagedevice" \
  -f "gis.pdf"