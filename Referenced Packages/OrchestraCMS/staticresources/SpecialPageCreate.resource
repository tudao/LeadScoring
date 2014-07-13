/*
 SpecialPageCreate.js

 Copyright (c) 2010, 2011 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
*/
$(document).data("cms_SpecialPageCreate-LOADED",true);
(function($,document,window,undefined){$(document).ready(function(){$(".create-link").click(function(){var self=this;var page_name=$(this).attr("title");$("<div></div>").createPageWizard({sname:$(document).data("sname"),allowPublicTags:$(document).data("allowPublicTags"),allowPersonalTags:$(document).data("allowPersonalTags"),afterCreate:function(data,dialog,page_id){var newlink=$('<a href="#" class="setup-link">'+page_name+"</link>");newlink.click(function(){openPageTab(page_name,"1.0","/apex/Edit?sname="+
$(document).data("sname")+"&id="+page_id,page_id)});$(self).parent().html(newlink)},page_name:page_name,page_type:page_name,token:$(document).data("token")})})})})(jQuery,document,window);