node default {
    require system

    include ruby
    include ruby::packages::jekyll
    include ruby::packages::rake

    include python
    include python::packages::pygments

    include java

    include closure_compiler
    include yui_compressor
}
