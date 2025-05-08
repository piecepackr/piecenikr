piecenikr 0.2.0 (development)
=============================

Deprecated features
-------------------

* The function `df_martian_chess()` chess is deprecated in favor of `icehouse_martian_chess()`.
* The function `looney_pyramids()` is deprecatd in favor of `looney_pyramid_game_system()`.

New features
------------

* New `looney_pyramid_game_sytem()` (replaces deprecated `looney_pyramids()`)
  gains a `border` argument to enable/disable a black border,
  the colors have been tweaked (e.g. a lighter "yellow" and a darker "blue"),
  adds three new colors ("cyan", "magenta", and "orange"),
  and now the `has_pyramids` binding returns `TRUE`.
  `icehouse_game_system()` is a new alias for `looney_pyramid_game_system()`.
* New icehouse piece setup functions:

  - `icehouse_martian_chess()` (replaces the deprecated `df_martian_chess()`)
  - `icehouse_none()`
  - `icehouse_pyramids()`
  - `icehouse_setup_by_name()`

* New PPN parser function that can be used with `ppn::read_ppn()`:

  - `icehouse_parser()` with a `looney_pyramid_parser()` alias.

* `icehouse_games()` returns a data frame with info about the game
  setups provided by this package.

piecenikr 0.1.4
===============

* Custom ``icehouse_pieces`` configuration returned by ``looney_pyramids()``
  has been tweaked for improved rendering in piecepackr v1.11
  when drawn in an oblique projection with its `{grid}` binding.

piecenikr 0.1.3
===============

* The colors used in the ``icehouse_pieces`` configuration returned by ``looney_pyramids()``
  have been tweaked to make it easier to see the pips.

piecenikr 0.1.1
================

* ``looney_pyramids()`` function which returns an icehouse pieces configuration.
* ``looneyPyramidGrob()`` to help make icehouse pieces.
* Game start functions:

  - ``df_martian_chess``
