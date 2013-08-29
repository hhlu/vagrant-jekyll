node default {
    require system

    include ruby
    include ruby::libraries::jekyll
    include ruby::libraries::rake

    include python
    include python::libraries::pygments

    include java
    include ant

    include closure_compiler
    include yui_compressor
    include htmlcompressor

    Class['java'] -> Class['ant'] -> Class['yui_compressor']
    Class['yui_compressor'] -> Class['htmlcompressor']
    Class['closure_compiler'] -> Class['htmlcompressor']
}
