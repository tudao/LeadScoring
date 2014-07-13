/*
 HorizontalMenu.js

 Copyright (c) 2010 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
*/
(function($){function STGHorizontalMenu(root,options){var self=this;$.extend(self,{open_menu:function(menu_id){return function(){if(root.find("#topmenu_"+menu_id).attr("isOver")=="true")if(root.data("opened_id")!=menu_id&&menu_id!=null&&menu_id!=""){$("#submenu_"+root.data("opened_id")).hide();root.find("#topmenu_"+root.data("opened_id")+" .menu-image").hide();root.find("#topmenu_"+menu_id+" .menu-image").show();$("#submenu_"+menu_id).fadeIn("fast");root.data("opened_id",menu_id)}}}});if(options.active_item!=
null&&options.active_item!=""){root.data("active_item","#menu_"+options.active_item);root.data("active_item_level2","#submenu_"+options.active_item);root.data("opened_id",options.active_item);$("#submenu_"+options.active_item).show()}$(".horizontal-menu-level1 .menu-image").hide();$(".horizontal-menu-level1 ul li").hover(function(){if(this.id&&this.id!=null&&this.id!=""){$("#"+this.id).attr("isOver","true");menu_item_id=this.id.substr(this.id.indexOf("_")+1);setTimeout(self.open_menu(menu_item_id),
500)}},function(){if(this.id&&this.id!=null&&this.id!="")$("#"+this.id).attr("isOver","false")})}$.fn.STGHorizontalMenu=function $$$fn$STGHorizontalMenu$(options){var settings=jQuery.extend({active_item:null},options);this.each(function(){el=new STGHorizontalMenu($(this),settings)});return this}})(jQuery);