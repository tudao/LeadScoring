public class orgchart {

Public String getuserdata()
{
    List<User> allusers = [Select Name,Manager.Name from User where IsActive = TRUE and ManagerId != NULL];
    String datastr = '';
    for (integer i=0;i<allusers.size();i++)
    {
        datastr = datastr + '[\'';
        datastr += allusers[i].Name;
        datastr+= '\',\'';
        datastr+= allusers[i].Manager.Name;
        datastr+='\',\'Tooltip\'],';
    } 
    datastr = datastr + '';
    return datastr;

}   
}