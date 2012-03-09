The simple JavaScript two dimensional molecular dynamics engine from [Next Generation Molecular Workbench](http://github.com/concord-consortium/lab]

I have extracted just the molecular dynamics calculations, without the visual display, from the [Lab repo](http://github.com/concord-consortium/lab). This allows us to tweak the engine and test it in a repeatable manner, using scripts which can generate plots.

The plan is to make a Node.js-based command-line utility which accepts input and output from plain text files, and to package the same functionality in a "[browserified](https://github.com/substack/node-browserify)" version for use by the visual molecular dynamics portion of the Lab repo. 

This project can therefore be 'npm link'ed into a separate repository, bench-Dynamics2D, which will use Python and matplotlib to script systematic exploration of the engine and plot the results with matplotlib.

Richard Klancer <rpk@pobox.com>
