/*
 JQueryInheritance.js - jQuery UI Plugin Framework for allowing Java like Inheritance within JQuery UI Widgets.
 $Date: 2010-06-01 $
 $Rev: 01 $

 Copyright (c) 2010 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
 For Usage See: http://bililite.com/blog/extending-jquery-ui-widgets/
*/
(function($){$.widget("ui.widget",{yield:null,returnValues:{},before:function(method,f){var original=this[method];this[method]=function $this$method$(){f.apply(this,arguments);return original.apply(this,arguments)}},after:function(method,f){var original=this[method];this[method]=function $this$method$(){this.returnValues[method]=original.apply(this,arguments);return f.apply(this,arguments)}},around:function(method,f){var original=this[method];this[method]=function $this$method$(){var tmp=this.yield;
this.yield=original;var ret=f.apply(this,arguments);this.yield=tmp;return ret}}});var object=function(F){return function(o){F.prototype=o;return new F}}(function(){});var OVERRIDE=/xyz/.test(function(){xyz})?/\b_super\b/:/.*/;$.ui.widget.subclass=function subclass(name$$0){$.widget(name$$0);name$$0=name$$0.split(".");var widget=$[name$$0[0]][name$$0[1]];var superclass=this;var superproto=superclass.prototype;var proto=arguments[0]=widget.prototype=object(superproto);$.extend.apply(null,arguments);
widget.subclass=subclass;for(key in proto)if(proto.hasOwnProperty(key))switch(key){case "_create":var create=proto._create;proto._create=function $proto$_create$(){superproto._create.apply(this);create.apply(this)};break;case "_init":var init=proto._init;proto._init=function $proto$_init$(){superproto._init.apply(this);init.apply(this)};break;case "destroy":var destroy=proto.destroy;proto.destroy=function $proto$destroy$(){destroy.apply(this);superproto.destroy.apply(this)};break;case "options":var options=
proto.options;proto.options=$.extend({},superproto.options,options);break;default:if($.isFunction(proto[key])&&$.isFunction(superproto[key])&&OVERRIDE.test(proto[key]))proto[key]=function(name,fn){return function(){var tmp=this._super;this._super=superproto[name];try{var ret=fn.apply(this,arguments)}finally{this._super=tmp}return ret}}(key,proto[key]);break}}})(jQuery);