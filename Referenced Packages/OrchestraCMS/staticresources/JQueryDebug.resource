/*
 JQueryDebug.js - jQuery Plugin for a simple logger within javascript.

 If a console exists like in firebug it simple sends the messages to the console.  If no console it creates a DEBUG window and appends it
 to body and the messages are logged to this console window at the bottom of the page.
 SAFARI also has a console as well to enable enter this in terminal and restart Safari (WORKS)
 defaults write com.apple.Safari IncludeDebugMenu 1
 CHROME has no console but you can get this extension that says it works,(TESTED DIDN'T WORK???)
 https://chrome.google.com/extensions/detail/bmagokdooijbeehmkpknfglimnifench
 INTERNET EXPLORER has no console but you can install FireBug Lite (NOT TESTED)
 http://getfirebug.com/lite.html

 Copyright (c) 2010, 2011 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.

 $Date: 2010-06-01 $
 $Rev: 01 $

 Copyright (c) 2010 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.

 $Date: 2010-06-01 $
 $Rev: 01 $

 Copyright (c) 2010 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
*/
$(document).data("cms_JQueryDebug-LOADED",true);var bDEBUG=false;var bCONSOLE=hasConsole();$(document).ready(function(){bCONSOLE=hasConsole();if(!bCONSOLE&&bDEBUG)addDebugWindow()});function hasConsole(){return window.console||$.browser.mozilla}function turnOnDebug(){bCONSOLE=hasConsole();bDEBUG=true;if(!bCONSOLE)addDebugWindow()}
function addDebugWindow(){bCONSOLE=false;if($("#DEBUG-CONSOLE")==null)$(document.body).append('<div id="DEBUG-CONSOLE"><div id="DEBUG-TITLE">OCMS DEBUG CONSOLE</div><div id="DEBUG-CONTENT"><ol></ol></div></div>');"Debug Console Enabled".logInfo()}String.prototype.logTODO=function $String$$logTODO$(){if(!bDEBUG)return;var s=this;for(var i=0;i<arguments.length;i++)s=s.replace("{"+i+"}",objectToString(arguments[i]));try{window.console.debug("TODO: "+s)}catch(ex){sendToConsole("TODO",s)}};
String.prototype.logDebug=function $String$$logDebug$(){if(!bDEBUG)return;var s=this;for(var i=0;i<arguments.length;i++)s=s.replace("{"+i+"}",objectToString(arguments[i]));try{window.console.debug(s)}catch(ex){sendToConsole("DEBUG",s)}};String.prototype.logInfo=function $String$$logInfo$(){if(!bDEBUG)return;var s=this;for(var i=0;i<arguments.length;i++)s=s.replace("{"+i+"}",objectToString(arguments[i]));try{window.console.info(s)}catch(ex){sendToConsole("INFO",s)}};
String.prototype.logWarn=function $String$$logWarn$(){if(!bDEBUG)return;var s=this;for(var i=0;i<arguments.length;i++)s=s.replace("{"+i+"}",objectToString(arguments[i]));try{window.console.warn(s)}catch(ex){sendToConsole("WARN",s)}};String.prototype.logError=function $String$$logError$(){if(!bDEBUG)return;var s=this;for(var i=0;i<arguments.length;i++)s=s.replace("{"+i+"}",objectToString(arguments[i]));try{window.console.error(s)}catch(ex){sendToConsole("ERROR",s)}};
$.logTODO=function $$$logTODO$(){if(!bDEBUG)return;var message=arguments[0];var args=Array.prototype.slice.call(arguments,0);args.splice(0,1);var s=objectToString(message);s.logTODO.apply(s,args)};$.logDebug=function $$$logDebug$(){if(!bDEBUG)return;var message=arguments[0];var args=Array.prototype.slice.call(arguments,0);args.splice(0,1);var s=objectToString(message);s.logDebug.apply(s,args)};
$.logInfo=function $$$logInfo$(){if(!bDEBUG)return;var message=arguments[0];var args=Array.prototype.slice.call(arguments,0);args.splice(0,1);var s=objectToString(message);s.logInfo.apply(s,args)};$.logWarn=function $$$logWarn$(){if(!bDEBUG)return;var message=arguments[0];var args=Array.prototype.slice.call(arguments,0);args.splice(0,1);var s=objectToString(message);s.logWarn.apply(s,args)};
$.logError=function $$$logError$(){if(!bDEBUG)return;var message=arguments[0];var args=Array.prototype.slice.call(arguments,0);args.splice(0,1);var s=objectToString(message);s.logError.apply(s,args)};
function formatLogMessage(message){objectToString(message);var str=message.toString();if(!bCONSOLE)try{str="&lt;";str+=message[0].nodeName.toLowerCase();for(var i=0;i<message[0].attributes.length;i++)str+=" "+message[0].attributes[i].nodeName.toLowerCase()+'="'+message[0].attributes[i].nodeValue+'"';str+="&gt;"}catch(e){str=message.toString()}return str}
function objectToString(obj){var sObjString="";if(obj==null)sObjString="NULL";else if($.isArray(obj))sObjString=arrayToString(obj);else if($.orchestracmsUtil.isString(obj))sObjString=obj;else if($.orchestracmsUtil.isNumber(obj))sObjString=obj;else if($.orchestracmsUtil.isBoolean(obj))sObjString=obj.toString();else{var s=obj.toString();if(s=="[object Object]")sObjString=$.orchestracmsUtil.objectStringify(obj);else sObjString=s.replace(s,s)}if(sObjString===""&&$.isEmptyObject(obj))sObjString="({EMPTY})";
return sObjString}function arrayToString(obj){var sToString="[";$.each(obj,function(index,item){sToString+=objectToString(item)});return sToString+"]"}
function sendToConsole(level,message){if(bCONSOLE)return;if("DEBUG"==level)$("#DEBUG-CONSOLE ol").append('<li style="color:white">'+level+": "+message+"</li>");else if("INFO"==level)$("#DEBUG-CONSOLE ol").append('<li style="color:blue">'+level+": "+message+"</li>");else if("WARN"==level)$("#DEBUG-CONSOLE ol").append('<li style="color:yellow">'+level+": "+message+"</li>");else if("ERROR"==level)$("#DEBUG-CONSOLE ol").append('<li style="color:red">'+level+": "+message+"</li>");else if("TODO"==level)$("#DEBUG-CONSOLE ol").append('<li style="color:lightgreen">'+
level+": "+message+"</li>")};