// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.

// All webpack assets in development will be loaded via webpack dev server
// It's important to include them in layout view above this asset
// b/c it exposes jQuery for turbolinks and another non-webpack JS (if any)

//= require js-routes
//= require i18n
//= require i18n/translations

//= require jquery.payment
//= require jquery.validate/jquery.validate.min
//= require spree
//= require spree/frontend/cart
//= require spree/frontend/checkout
//= require spree/frontend/checkout/address
//= require spree/frontend/checkout/payment

//= require react_ujs
