:author: Lukas Turcani

A lightweight molecular viewer for embedding molecules into
web pages. It is intended for use by both JavaScript and PureScript
applications.


Live example:

Installation
============

JavaScript
----------

You can install with either yarn::

    $ yarn add molDraw

or npm::

    $ npm install molDraw

Usage
=====

There are two functions exported by the library, ``drawMol`` and
``drawMolWithOptions``. They are the same, except
``drawMolWithOptions`` lets you tweak the way the molecule is drawn.


JavaScript
----------

.. code-block:: javascript

    import * as molDraw from 'molDraw';

    // The molecule to be rendered should be provided in a the
    // V3000 MDL .mol file format, as a string.
    const molecule = `
      0  0  0  0  0  0  0  0  0  0999 V3000
    M  V30 BEGIN CTAB
    M  V30 COUNTS 4 3 0 0 0
    M  V30 BEGIN ATOM
    M  V30 1 Br -0.0328 1.8852 0.0012 0
    M  V30 2 C 0.0054 -0.0185 -0.0002 0 CHG=1
    M  V30 3 Br 1.6829 -0.9147 -0.0823 0
    M  V30 4 Br -1.6555 -0.9520 0.0814 0
    M  V30 END ATOM
    M  V30 BEGIN BOND
    M  V30 1 1 1 2
    M  V30 2 1 2 3
    M  V30 3 1 2 4
    M  V30 END BOND
    M  V30 END CTAB
    M  END
    `

    molDraw.drawMol({
        backgroundColor: 0xFFFFFF,
        // Id of the div, in which the molecule should be rendered.
        containerId: 'someDivId'
    })(molecule);

