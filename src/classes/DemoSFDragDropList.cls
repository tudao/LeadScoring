/**
name        : DemoSFDragDropList
author      : Aslam Bari (www.aslambari.com)
date        : 14th May, 2011
description : Demo page Controller to show the selected values
*/
public class DemoSFDragDropList{
    public string list2FinalItems{get;set;}
    public DemoSFDragDropList(){
        
    }
    
    public pagereference showSelectedItems(){
        list2FinalItems = ApexPages.currentpage().getParameters().get('list_2_serialised');
        return null;
    }
    
    @istest
    private static void testthis(){
        DemoSFDragDropList cont = new DemoSFDragDropList();
        cont.showSelectedItems();    
    }
}