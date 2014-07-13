/*
 TabInterface.js - Interface methods for internal IFrames to communicate with the MainTabController

 Copyright (c) 2010, 2011 - Stantive Technologies Group (http://www.stantive.com)
 All Rights Reserved.
 NOTE: THIS FILE IS GENERATED, PLEASE MODIFY THE FILE LOCATED IN "other-src/web/ocmsJS/" DIRECTORY.
*/
$(document).data("cms_TabInterface-LOADED",true);function openTab(label,url,object_id){var main=window.top;if(main!=null)main.addTab("preview",label,url,object_id)}function openPageTab(label,version,url,object_id){openTab(label+" - <em>v"+version+"</em>",url,object_id)}
function openContentTab(label,version,url,object_id,type){var sName=$(document).data("sname");$.logWarn("openContentTab {0},{1},{2},{3}",label,version,url,type);if(type!="SiteMap")openTab(label+" - <em>v"+version+"</em>",url,object_id);else openTab("Manage Pages","/apex/PageManager?sname="+sName,"PageManager")}function updateTab(tabid,label,object_id){var main=window.top;if(main!=null)main.updateTab(tabid,label,object_id)}
function closeTab(tabid){var main=window.top;if(main!=null)main.remoteRemoveTab(tabid)}function closeCurrentTab(){var main=window.top;if(main!=null){tabid=main.getCurrentTabId();closeTab(tabid)}}function refreshTab(tab_id){var main=window.top;if(main!=null){if(tab_id==null)tab_id=main.getCurrentTabId();main.refreshTab(tab_id)}}
function setPageContextHelp(helpContent){var main=window.top;if(main!=null){var tabId=main.getCurrentTabId();$.orchestracmsUtil.setPageContextHelpSystemText(tabId,helpContent)}}function maskApplication(){var main=window.top;if(main!=null)$.orchestracmsUtil.showMaskNow()}function unMaskApplication(){var main=window.top;if(main!=null)$.orchestracmsUtil.hideMaskNow()}
function addTabListener(tId,func){var main=window.top;if(main!=null){var tabId;if(tId===null)tabId=main.getCurrentTabId();else tabId=tId;tabId=tabId.replace("%23","#");main.registerTabListener(tabId,func)}}function removeTabListener(sId){var main=window.top;if(main!=null)main.unSubscribe(sId)}function getCurrentTab(){var main=window.top;if(main!=null)return main.getCurrentTabId();return null}function addSubscriber(sEvt,cbFunc){var main=window.top;return main.subscribe(sEvt,cbFunc)}
function removeSubscriber(sId){var main=window.top;main.unSubscribe(sId)}function publishEvent(sEvt,sObject,cbFunc){var main=window.top;parent.notifySubscribers(sEvt,sObject,cbFunc)};