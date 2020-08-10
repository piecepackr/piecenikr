piecenikr: Looney Pyramids graphics
===================================

.. image:: https://travis-ci.org/piecepackr/piecenikr.png?branch=master
    :target: https://travis-ci.org/piecepackr/piecenikr
    :alt: Build Status

.. image:: https://ci.appveyor.com/api/projects/status/github/piecepackr/piecenikr?branch=master&svg=true 
    :target: https://ci.appveyor.com/project/piecepackr/piecenikr
    :alt: AppVeyor Build Status

.. image:: https://img.shields.io/codecov/c/github/piecepackr/piecenikr/master.svg
    :target: https://codecov.io/github/piecepackr/piecenikr?branch=master
    :alt: Coverage Status

.. image:: http://www.repostatus.org/badges/latest/wip.svg
   :alt: Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.
   :target: http://www.repostatus.org/#wip


.. _piecepackr: https://github.com/piecepackr/piecepackr
.. _R: https://www.r-project.org/


Looney Pyramids aka Icehouse pieces is a game system invented by Andrew
Looney. The following are good sites of information about Looney
Pyramids:

-  https://www.looneylabs.com/looney-pyramids (official site)
-  https://www.icehousegames.org/wiki/index.php?title=Main_Page
   (unofficial wiki)

This R package provides a ``looney_pyramids`` configuration that make it
easier to make Looney Pyramids graphics with piecepackr_.

License
-------

-  The **code** of this R package is `CC BY-SA
   4.0 <https://creativecommons.org/licenses/by-sa/4.0/>`__.

-  Under American law I likely cannot claim any copyright on any of the
   Looney Pyramids graphical **output** produced by this package.

-  Looney Pyramids are trademarked and patented by `Looney
   Labs <https://www.looneylabs.com/>`__. They do not permit commercial
   use of Looney Pyramids without permission. They seem cool with

   1. Creating `new Looney Pyramids
      games <https://www.icehousegames.org/wiki/index.php?title=Community_Games>`__.
      `But don’t try to independly publish such a game while including
      Looney Pyramids in your
      product <https://faq.looneylabs.com/non-gameplay-questions/working-with-looney-labs#1770>`__,
      nor `creating commercial electronic versions of Looney Pyramids
      games <https://www.looneylabs.com/looney-labs-electronic-arcade>`__.
   2. `Making Icehouse
      pieces <https://www.icehousegames.org/wiki/index.php?title=Making_pieces>`__
      for personal use (note they definitely `would mind if someone
      commercially manufactured icehouse pieces without
      permission <http://wunderland.com/WTS/Andy/Games/PatentsAndLawsuits.html>`__)
   3. (Non-commercial) fan art and game playing aids

Installation
------------

Within R_ do:

.. code:: r

    install.packages("remotes")
    remotes::install_github("piecepackr/piecepackr")
    remotes::install_github("piecepackr/ppgames") # suggested
    remotes::install_github("piecepackr/piecenikr")

Examples
--------

This package contains a ``looney_pyramids`` configuration. One can draw
2D graphics using ``grid.piece``.

.. code:: r

   library("piecepackr")
   library("piecenikr")
   library("tibble")
   cfg <- looney_pyramids()$icehouse_pieces

   dft <- tibble(piece_side="tile_back", x=1.5, y=1.5, suit=NA, rank=NA, angle=NA)
   dfp <- tibble(piece_side=c("pyramid_face", "pyramid_left", "pyramid_right", "pyramid_back"),
                 x=c(1,2,2,1), y=c(2,2,1,1), suit=1:4, rank=c(1:3,3), angle=seq(90, 360, 90))
   df1 <- rbind(dft, dfp)

   dft <- tibble(piece_side="tile_back", x=3.5, y=3.5, suit=NA, rank=NA, angle=NA)
   dfp <- tibble(piece_side="pyramid_top", x=2+c(1,2,2,1,1,2,2,2), y=2+c(2,2,1,1,1,1,1,1),
                 suit=c(1:6,2,3), rank=c(1:3,3,1,2,1,1), angle=seq(0, 630, 90))
   df2 <- rbind(dft, dfp)
   df <- rbind(df1, df2)

   pmap_piece(df, grid.piece, cfg = cfg, default.units = "in")

.. figure:: https://trevorldavis.com/share/piecepack/2d_looney_pyramids.png
   :alt: Example 2D diagram

   Example 2D diagram

One can use ``piece3d`` to draw 3D graphics using the ``rgl`` package:

.. code:: r

   library("rgl")
   dft <- tibble(piece_side = "tile_back", x=rep(c(-2, 0, 2), 3), y=rep(c(-2, 0, 2), each=3))
   dfp1 <- tibble(piece_side = "pyramid_top", x=0, y=0, rank = 3, suit = 2)
   dfp2 <- tibble(piece_side = "pyramid_face", 
               x = rep(c(-2, 0, 2), 3), y = rep(c(2, 0, -2), each=3),
               angle = c(45, 0, -45, 90, 0, -90, 135, 180, -135),
               suit = rep(1:6, length.out=9), rank = rep(1:3, length.out=9))[-5, ]
   df <- dplyr::bind_rows(dft, dfp1, dfp2)

   pmap_piece(df, piece3d, cfg = looney_pyramids, trans = op_transform, scale = 0.99)

.. figure:: https://trevorldavis.com/share/piecepack/3d_looney_pyramids.png
   :alt: Example 3D diagram

   Example 3D diagram
