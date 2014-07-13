public class Opp_Ext {
    private ApexPages.StandardController stdController;
    public String redirectUrl {public get; private set;}
    public Boolean shouldRedirect {public get; private set;}

    public Opp_Ext(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        shouldRedirect = false;
    }

    public PageReference doStuffAndRedirect() {
        shouldRedirect = true;
        redirectUrl = '/home/home.jsp';
        return null;
    }
}