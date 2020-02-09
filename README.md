piecenikr: Looney Pyramids graphics
===================================

[![Build Status](https://travis-ci.org/piecepackr/piecenikr.svg?branch=master)](https://travis-ci.org/piecepackr/piecenikr)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/piecepackr/piecenikr?branch=master&svg=true)](https://ci.appveyor.com/project/piecepackr/piecenikr)
[![Coverage Status](https://img.shields.io/codecov/c/github/piecepackr/piecenikr/master.svg)](https://codecov.io/github/piecepackr/piecenikr?branch=master)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

Looney Pyramids aka Icehouse pieces is a game system invented by Andrew Looney.  The following are good sites of information about Looney Pyramids:

* https://www.looneylabs.com/looney-pyramids (official site)
* https://www.icehousegames.org/wiki/index.php?title=Main_Page (unofficial wiki)

This R package provides a `looney_pyramids` configuration that make it easier to make Looney Pyramids graphics with [piecepackr](https://github.com/piecepackr/piecepackr).

License
-------

* The **code** of this R package is [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
* Under American law I likely cannot claim any copyright on any of the Looney Pyramids graphical **output** produced by this package.
* Looney Pyramids are trademarked and patented by [Looney Labs](https://www.looneylabs.com/).  They do not permit commercial use of Looney Pyramids without permission.  They seem cool with

  1. Creating [new Looney Pyramids games](https://www.icehousegames.org/wiki/index.php?title=Community_Games).  [But don't try to independly publish such a game while including Looney Pyramids in your product](https://faq.looneylabs.com/non-gameplay-questions/working-with-looney-labs#1770), nor [creating commercial electronic versions of Looney Pyramids games](https://www.looneylabs.com/looney-labs-electronic-arcade)).
  2. [Making Icehouse pieces](https://www.icehousegames.org/wiki/index.php?title=Making_pieces) for personal use (note they definitely [would mind if someone commercially manufactured icehouse pieces without permission](http://wunderland.com/WTS/Andy/Games/PatentsAndLawsuits.html))
  3. (Non-commercial) fan art and game playing aids

Examples
--------

This package contains a ``looney_pyramids`` configuration.  [piecepackr](https://github.com/piecepackr/piecepackr) has 2D graphic support for drawing pyramids with it.

```r
library("piecepackr")
library("piecenikr")
library("tibble")
dft <- tibble(piece_side="tile_back", x=1.5, y=1.5, suit=NA, rank=NA, angle=NA)
dfp <- tibble(piece_side=c("pyramid_face", "pyramid_left", "pyramid_right", "pyramid_back"),
              x=c(1,2,2,1), y=c(2,2,1,1), suit=1:4, rank=c(1:3,3), angle=seq(90, 360, 90))
df1 <- rbind(dft, dfp)

dft <- tibble(piece_side="tile_back", x=3.5, y=3.5, suit=NA, rank=NA, angle=NA)
dfp <- tibble(piece_side="pyramid_top", x=2+c(1,2,2,1,1,2,2,2), y=2+c(2,2,1,1,1,1,1,1),
              suit=c(1:6,2,3), rank=c(1:3,3,1,2,1,1), angle=seq(0, 630, 90))
df2 <- rbind(dft, dfp)
df <- rbind(df1, df2)

pmap_piece(df, cfg=looney_pyramids, default.units="in")
```

![Example 2D diagram](https://trevorldavis.com/share/piecepack/2d_looney_pyramids.png)

There is an experimental package [piecepackr3d](https://github.com/piecepackr/piecepackr3d) providing basic 3D graphic support for drawing pyramids with R's rgl package.

```r
library("piecepackr3d")
library("rgl")
dft <- tibble(piece_side = "tile_back", x=rep(c(-2, 0, 2), 3), y=rep(c(-2, 0, 2), each=3))
dfp1 <- tibble(piece_side = "pyramid_top", x=0, y=0, rank = 3, suit = 2)
dfp2 <- tibble(piece_side = "pyramid_face", 
            x = rep(c(-2, 0, 2), 3), y = rep(c(2, 0, -2), each=3),
            angle = c(45, 0, -45, 90, 0, -90, 135, 180, -135),
            suit = rep(1:6, length.out=9), rank = rep(1:3, length.out=9))[-5, ]
df <- dplyr::bind_rows(dft, dfp1, dfp2)

pmap_piece(df, piece3d, cfg = looney_pyramids, trans = op_transform, scale = 0.99)
```

![Example 3D diagram](https://trevorldavis.com/share/piecepack/3d_looney_pyramids.png)
