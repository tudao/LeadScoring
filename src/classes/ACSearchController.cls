/******************************************************************************************/
//Name                : ACSearchController
//Author              : Aslam Bari
//Date                : 04 March, 2010
//Description         : Popup Search controller for SearchPage
/******************************************************************************************/
public class ACSearchController{
   public string qry {get;set;}
   public string search_type {get;set;}
   public string lookupDisplayData {get;set;}
   public List<Contact> listData {get;set;}
   public String filter;
   //Constructor
   public ACSearchController(){
       listData = new List<Contact>();
       lookupDisplayData = '';        
       qry  = ApexPages.currentPage().getParameters().get('q');
       search_type= ApexPages.currentPage().getParameters().get('search_type');
       String query = '';
           
       listData  = getQuery(); 
       lookupDisplayData = getDisplayData(listData);
           
   }
   
   /**
   //GetContactQuery
   //Gives query to be fired for 'Contact' popup Page
   */
   private List<Contact> getQuery(){
        filter = '%' + qry + '%';
        return [SELECT id, Name, Account.Name from Contact WHERE name like :filter order by Name limit 20];
   }
   
   
   /**
   //getContactDisplayData
   //Gives output as string from contact data list to show on screen
   */
   private string getDisplayData(List<Contact> dataList){
        string output = '';
        for(Contact item: dataList){
            output += item.Name + ', ' + item.Account.Name + '|' + item.Name + '|' + item.id +'\n';
        }
        return output;
   }
     
}