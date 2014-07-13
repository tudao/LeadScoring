public class bubbleCon {

   Bubble[] bubbles;
   opportunity opp;
   private List<Opportunity> baseOpptyList;

   public BubbleCon() { setBubbles(); }

   private List<Opportunity> getBaseOpptyList() {
     if(baseOpptyList == null) baseOpptyList = new List<Opportunity>([
     	select amount, account.name,
     		stagename, name, owner.name, lastActivityDate, closedate, probability,  
           	(select CloseDate from OpportunityHistories where createddate = LAST_N_DAYS:30) 
           	from Opportunity 
           	where isclosed = :false and amount > 0 and ownerid = :UserInfo.getUserId()
           	order by amount desc limit 100 ]);
     return baseOpptyList;

   }
 
   public void clearSelected() {
     for(Bubble b:bubbles) { b.setIsSelected(false); } 
   }

   private void setBubbles() { 
     bubbles = new Bubble[]{};
       List<opportunity> opptyList = getBaseOpptyList();
       for(Opportunity o:opptyList) {
       Integer hFactor = 0;
       Date lastCloseDate;
       for(OpportunityHistory h:o.opportunityHistories) { 
         if(lastCloseDate != null && lastCloseDate.daysBetween(h.closedate) < 0 ) hFactor+= 20;

         lastCloseDate = h.CloseDate;
       }
       Integer x = (o.probability).intValue();
		 
		Integer y = 100 - (o.lastActivitydate != null &&
		o.lastActivityDate.daysBetween(System.today()) > 15 ? 30 : 0) -
		(o.opportunityHistories == null ? 30 : 0) - hFactor;
		       if(y < 0) y = 0;

	   Bubble b = new Bubble(o.name, x, y, o.amount.doubleValue()); 
	   b.setId(o.id);
	   bubbles.add(b);
     }
   }

   public Bubble[] getBubbles() { return bubbles; }

   public Bubble[] getSelected() { 
     Bubble[] selected = new Bubble[]{};
     for (Bubble b : bubbles) {
        if (b.getIsSelected()) {
          selected.add(b);
        }
     }

     return selected; 
   }

   public integer getSelectedSize() { return getSelected().size(); }

   Id selectedId;
   public Id getSelectedId() {return selectedId;}
   public void setSelectedId(Id s) {selectedId = s;}

   public void setBubble() {
     for(Bubble b:bubbles) { 

       System.debug('BID: ' + b.getId() + ' == ' + selectedId + '?');
       if(b.getId() == selectedId) b.setIsSelected(true);
       else b.setIsSelected(false);
     }
   }

   public Opportunity getOpportunity() {
    if (getSelected().size() <> 1) {
       return new Opportunity();
    }
	
	opp = [select name, owner.name, accountId, account.name, amount,
	closedate, stagename, probability, lastActivityDate from opportunity
	where id = :getSelected()[0].getId()];
    return opp;
   }

   public void setOpportunity(Opportunity opp) { this.opp = opp; }

   public Opportunity[] getOpportunities() {
     Set<Id> idSet = new Set<Id>{};
     for (Bubble b:getSelected()) {
       idSet.add(b.getId()); 
     }
     if(IdSet.size() > 0) return [select name, owner.name, account.name, amount, closedate, stagename,
		probability, lastActivityDate from opportunity where id IN :idSet];
     else return getBaseOpptyList();
   }
   
}