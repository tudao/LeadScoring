/*
 JQueryGeneral.js - jQuery UI Plugins for other common generic components that don't fall into other categories.
 These components are used within Orchestra.

 Copyright (c) 2010, 2011 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
*/
$(document).data("cms_JQueryGeneral-LOADED",true);
(function($){$.widget("ui.ocmsPageContentHelp",{_create:function(){var self=this;var o=this.options;var helpContent=$(this.element[0]);if(!helpContent.hasClass("ocms-page-context-help"))helpContent.addClass("ocms-page-context-help");var helpHtml="<span>"+o.helpText+"</span>";var imgActiveSrc=$(document).data("btn_close_active");var imgInActiveSrc=$(document).data("btn_close_inactive");var closeButton=$('<img src="'+imgInActiveSrc+'" />');closeButton.hover(function(){$(this).attr("src",imgActiveSrc)},
function(){$(this).attr("src",imgInActiveSrc)});closeButton.click(function(){self.closeHelp()});helpContent.append(helpHtml);helpContent.append(closeButton);if($.isFunction(o.onOpen))o.onOpen(this);return this},closeHelp:function(){var o=this.options;var helpContent=$(this.element[0]);helpContent.hide();if($.isFunction(o.onClose))o.onClose(this)},showHelp:function(){var o=this.options;var helpContent=$(this.element[0]);helpContent.show();if($.isFunction(o.onOpen))o.onOpen(this)},options:{version:0.1,
helpText:null,onClose:null,onOpen:null}})})(jQuery);