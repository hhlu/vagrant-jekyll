# == Class: system
#
# This class controls execution of other classes in this module.
#
class system {
    require system::packages
    require system::services

    require system::users::vagrant
}
