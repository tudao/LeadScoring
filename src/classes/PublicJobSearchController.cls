public with sharing class PublicJobSearchController {

    Position__c[] ccts;
    String searchPosition;
    String positionid;
    String DepartmentName = '%';
    String LocationName = '%';
    String likeStr =  '%';

    private String viewDepartmentName = 'Department';
    private String viewLocationName = 'Locations';
 
// Department Picklist for Search Page
    private static final List<SelectOption> VIEW_DEPARTMENT = new SelectOption[] {
        new SelectOption('0','All Departments'),
        new SelectOption('Engineering','Engineering'),
        new SelectOption('Finance','Finance'),
        new SelectOption('IT','IT'),
        new SelectOption('Sales','Sales'),
        new SelectOption('Support','Support')
    };
    
// Location Picklist for Search Page
    private static final List<SelectOption> VIEW_LOCATION = new SelectOption[] {
        new SelectOption('0','All Locations'),
        new SelectOption('San Francisco, CA - USA','San Francisco, CA - USA'),
        new SelectOption('New York, NY - USA','New York, NY - USA'),
        new SelectOption('Reston, VA - USA','Reston, VA - USA'),
        new SelectOption('Toronto, ON - Canada','Toronto, ON - Canada')

    };
       public List<SelectOption> getDepartmentViewNames() {
        return VIEW_DEPARTMENT;
    }
    
        public List<SelectOption> getLocationViewNames() {
        return VIEW_LOCATION;
    }
    
    public void setViewDepartmentName(String viewDepartmentName) {
        this.viewDepartmentName = viewDepartmentName;
    }

    public String getViewDepartmentName() {
        return viewDepartmentName;
    }

    public void setViewLocationName(String viewLocationName) {
        this.viewLocationName = viewLocationName;
    }

    public String getViewLocationName() {
        return viewLocationName;
    }

// Page onLoad action to auto-run the job postings query
    public void initList() {
        query();
    }  
    
    public String getSearchPosition() {
        return this.searchPosition;
    }

    public void setSearchPosition(String search) {
        this.searchPosition = search;
    }

    public void populateQuery() {
        likeStr =  '%' + searchPosition + '%';
        if (viewDepartmentName != '0') DepartmentName = viewDepartmentName;
        if (viewLocationName != '0') LocationName = viewLocationName;
        query();
    }

// Query to return the first 100 matching positions
    public PageReference query() {
        ccts = [SELECT id, name, Department__c, Location__c, Job_Description__c, Status__c
                FROM Position__c 
                WHERE Department__c like :DepartmentName 
                AND Location__c like :LocationName
                AND name like :likeStr 
                AND Status__c = 'Open'
                ORDER BY Name ASC
                LIMIT 100];
        return null;
    }
    
    public Position__c[] getPosition() {
        return ccts;
    }

 }