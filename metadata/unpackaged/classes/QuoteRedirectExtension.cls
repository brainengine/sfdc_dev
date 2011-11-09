public class QuoteRedirectExtension{

	public  integer listIndex{get;set;}
	public  integer currentIndex{get;set;}
	
	private final Quote quote;
	private final Opportunity oppty;
	private List<LineItemWrapper> listLines  = new List<LineItemWrapper>();
	
	public QuoteRedirectExtension(ApexPages.StandardController stdController) {
		//this.quote = (Quote)stdController.getRecord();
		if(this.quote == null) {
			this.quote = [Select Id, Name, OpportunityId from quote where id =:ApexPages.currentPage().getParameters().get('id')]; 
		}

		System.debug('quote def:::::::::::: ' + quote);
		
		oppty = [Select O.Entity__c, O.Id, O.Type from Opportunity O where Id =:  this.quote.OpportunityId];
		System.debug('oppty def:::::::::::: ' + oppty);
		
		listIndex =0;
		//queryLineItems(); 
	}
	
	public PageReference  queryLineItems(){
		
		if(oppty.Type != 'Strings'){		
			if(oppty.Entity__c == 'Cayman'){
				PageReference pageRef = new PageReference('https://c.cs4.visual.force.com/apex/Cayman_Proposal?scontrolCaching=1&id=' + this.quote.Id);
				pageRef.setRedirect(true);
				return pageRef;
			}else{
				PageReference pageRef = new PageReference('https://c.cs4.visual.force.com/apex/Nederland_Proposal?scontrolCaching=1&id=' + this.quote.Id);
				pageRef.setRedirect(true);
				return pageRef;
			}
		}else{
			PageReference pageRef = new PageReference('https://c.cs4.visual.force.com/apex/Strings_Proposal?scontrolCaching=1&id=' + this.quote.Id);
			pageRef.setRedirect(true);
			return pageRef;	
		}
		
		/*
		Set<Id> lineIds = new Set<Id>();
		List<QuoteLineItem> lineList = new List<QuoteLineItem>();
	
		for(QuoteLineItem line : [Select Q.CreatedById, Q.CreatedDate, Q.CurrencyIsoCode, Q.ServiceDate, Q.IsDeleted, Q.Description__c, Q.Discount, Q.HasQuantitySchedule, Q.HasRevenueSchedule, Q.LastModifiedById, Q.LastModifiedDate, Q.Description, Q.LineNumber, Q.ListPrice, Q.Margin__c, Q.PricebookEntryId, Q.Quantity, Q.QuoteId, Q.Id, Q.UnitPrice, Q.HasSchedule, Q.SortOrder, Q.Subtotal, Q.SystemModstamp, 
		Q.Total_Cost__c, Q.Total_Margin__c, Q.TotalPrice, Q.Unit_Cost__c, Q.Unit_Margin__c 
			from QuoteLineItem Q where QuoteId =: quote.Id]){
		
		lineList.add(line);
		lineIds.add(line.Id);
		
	}
		
		for(QuoteLineItem line : lineList) {
			listLines.add(new LineItemWrapper(++listIndex, false, line));
		}
		
		System.debug('lstSpaces'+lineList);
		System.debug('lstSpaces size'+lineList.size());
*/
		
		}
	
	public List<LineItemWrapper> getLineItems() {
		return listLines;
	}
	
	
	public class LineItemWrapper {
        
		public integer index{get;set;}
		public Boolean isDeleted { get;set;} 
		public QuoteLineItem lineItem { get;set; }
                        
		public LineItemWrapper(integer lIndex, boolean isDeleted, QuoteLineItem line) {
			this.lineItem = line;
			this.index = lIndex;
			this.isDeleted = isDeleted;	
		}
	}
	
}