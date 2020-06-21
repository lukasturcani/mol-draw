:author: Lukas Turcani

A lightweight molecular viewer for embedding molecules into
web pages and web apps, with support for React. It is intended for use
by both JavaScript and PureScript applications.


Live example


.. contents::
    :depth: 2


============
Installation
============

JavaScript
==========

You can install with either yarn::

    $ yarn add molDraw

or npm::

    $ npm install molDraw

=====
Usage
=====

Apart from the usage examples here, you can see all exported
functions at

The exported functions are identical for both JavaScript and PureScript
users.


JavaScript
==========

Drawing Molecules in Divs
-------------------------

Simple Case
~~~~~~~~~~~


.. code-block:: javascript

    import * as molDraw from 'molDraw';

    // You can load molecules by parsing them from V3000 MDL .mol
    // file contents.
    const molecule = molDraw.parseV3000(`
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
    `);

    molDraw.drawMol({
        backgroundColor: 0xFFFFFF,
        // Id of the div, in which the molecule should be rendered.
        containerId: 'someDivId'
    })(molecule);

Live result

Using Options
~~~~~~~~~~~~~

.. code-block:: javascript

    // If you want to customize the drawing you can add an options
    // object.
    molDraw.drawMolWithOptions({
        // atomSize is a function, which takes a molDraw.Atom instance
        // and returns the desired size (before scaling).
        atomSize: atom => {
            // Make the atom with an id of 10 really big.
            if (molDraw.id(atom) === 10)
            {
                return 5;
            }
            // Make hydrogen atoms really small.
            if (molDraw.show(molDraw.chemicalSymbol(atom)) === 'H')
            {
                return 0.1;
            }
            // Use the default element sizes for everything else.
            return molDraw.size(molDraw.chemicalSymbol(atom));
        },
        // atomColor is a function, which takes a molDraw.Atom instance
        // and returns the desired color for that atom.
        atomColor: atom => {
            if (molDraw.)
            {
                return;
            }
            if (molDraw.)
            {
                return;
            }
            // Use the default element colors for everything else.
            return molDraw.color(molDraw.chemicalSymbol(atom));
        },
        atomScale: 0.5,
        atomWidthSegments: 8,
        atomHeightSegments: 7,
        bondRadialSegments: 10,
        bondHeightSegments: 1,
    })({
        backgroundColor: 0xFFFFFF,
        containerId: 'someDivId'
    })(molecule);


Live Result


Loading Molecules
-----------------

V3000 File Content
~~~~~~~~~~~~~~~~~~

If you have the contents of a V3000 MDL .mol file, you can use it
to create a molecule

.. code-block:: javascript

    import * as molDraw from 'molDraw';

    const molecule = molDraw.parseV3000(`
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
    `);


Direct Creation
~~~~~~~~~~~~~~~

You can create molecules programmatically too

.. code-block:: javascript

    import * as molDraw from 'molDraw';

    const molecule = molDraw.molecule(
        [
            molDraw.atom(
                molDraw.C(),
                molDraw.position(-0.06)(-0.17)(0)
            ),
            molDraw.atom(
                molDraw.Cl(),
                molDraw.position(-1.35)(1.04)(-0.04)
            ),
            molDraw.atom(
                molDraw.H(),
                molDraw.position(1.65)(0.73)(-0.06)
            ),
            molDraw.atom(
                molDraw.H(),
                molDraw.position(-0.15)(-0.88)(-0.87)
            ),
            molDraw.atom(
                molDraw.Br(),
                molDraw.position(-0.09)(-0.72)(0.97)
            )
        ],
        [
            molDraw.bond(0)(1),
            molDraw.bond(0)(2),
            molDraw.bond(0)(3),
            molDraw.bond(0)(4)
        ]
    );
