piecenikr 0.2.0 (development)
=============================

Deprecated features
-------------------

* The function `df_martian_chess()` chess is deprecated in favor of `icehouse_martian_chess()`.

New features
------------

* `looney_pyramids()` gains a `border` argument to enable/disable a black border,
  the colors have been tweaked (e.g. a lighter "yellow" and a darker "blue"),
  and now the `has_pyramids` binding returns `TRUE`.
* New icehouse piece setup functions:

  - `icehouse_martian_chess()` (replaces the deprecated `df_martian_chess()`)
  - `icehouse_none()`
  - `icehouse_pyramids()`

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
