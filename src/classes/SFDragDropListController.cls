/**
name        : SFDragDropListController
author      : Aslam Bari (www.aslambari.com)
date        : 14th May, 2011
description : Component Controller to split items and helper to show on page
*/
public class SFDragDropListController{
    public string list1 {get;set;}
    public string list2 {get;set;}
    public SFDragDropListController(){
    }
    
    public List<string> getList1Items(){
        return list1 != null ? list1.split(';') : null;        
    }
    
    public List<string> getList2Items(){
        return list2 != null ? list2.split(';') : null;        
    }
    
    @istest
    private static void testthis(){
        SFDragDropListController cont = new SFDragDropListController();
        cont.getList1Items();    
        cont.getList2Items();    
    }
}