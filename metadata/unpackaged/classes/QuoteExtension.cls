public class QuoteExtension{

	public integer listIndex{get;set;}
	public integer currentIndex{get;set;}
	
	private final Quote quote;
	private List<LineItemWrapper> listLines  = new List<LineItemWrapper>();
	private List<LineItemWrapper> listLines2  = new List<LineItemWrapper>();
	private List<LineItemWrapper> fillerLines  = new List<LineItemWrapper>();
	
	public boolean hasSecondPage {get;set;}
	public integer pageOne {get;set;}
	public integer pageTwo {get;set;}	
	public integer pageCount {get;set;}
	
	public QuoteExtension(ApexPages.StandardController stdController) {
		this.quote = (Quote)stdController.getRecord();
		System.debug('quote def:::::::::::: ' + quote);
		listIndex = 0;
		pageOne = 1;
		pageTwo = 2;
		pageCount = 1;
		queryLineItems(); 
	}
	
	private void queryLineItems(){
		
		Set<Id> lineIds = new Set<Id>();
		List<QuoteLineItem> lineList = new List<QuoteLineItem>();
		
		integer index = 0;
	
		for(QuoteLineItem line : [Select Q.CreatedById, Q.CreatedDate, Q.CurrencyIsoCode, Q.ServiceDate, Q.IsDeleted, Q.Description__c, Q.Discount, Q.HasQuantitySchedule, Q.HasRevenueSchedule, Q.LastModifiedById, Q.LastModifiedDate, Q.Description, Q.LineNumber, Q.ListPrice, Q.Margin__c, Q.PricebookEntryId, Q.Quantity, Q.QuoteId, Q.Id, Q.UnitPrice, Q.HasSchedule, Q.SortOrder, Q.Subtotal, Q.SystemModstamp, 
									Q.Total_Cost__c, Q.Total_Margin__c, Q.TotalPrice, Q.Unit_Cost__c, Q.Unit_Margin__c 
									from QuoteLineItem Q where QuoteId =: quote.Id]){
		
			lineList.add(line);
			lineIds.add(line.Id);
		
		}
		
		for(QuoteLineItem line : lineList) {
			
			listLines.add(new LineItemWrapper(++listIndex, false, line));
			index += 1;
		}
		
		if(lineList.size()>5){
			pageCount = 2;
			hasSecondPage = true;
			
			Integer count = lineList.size();

			while (count < 14) {
				listLines.add(new LineItemWrapper(++listIndex, false, new QuoteLineItem(),''));
				count++;
			}
			
			count = 0;
			while (count < 3) {
				listLines2.add(new LineItemWrapper(++listIndex, false, new QuoteLineItem(),''));
				count++;
			}

			count = 0;
			while (count < 13) {
				fillerLines.add(new LineItemWrapper(++listIndex, false, new QuoteLineItem(),''));
				count++;
			}
			
		}else{
			
			Integer count = lineList.size();

			while (count < 4) {
				listLines.add(new LineItemWrapper(++listIndex, false, new QuoteLineItem(),''));
				count++;
			}
			
			hasSecondPage = false;	
			
		}
		
		
		System.debug('lstSpaces'+lineList);
		System.debug('lstSpaces size'+lineList.size());
		
	}
	
	public List<LineItemWrapper> getLineItems() {
		return listLines;
	}

	public List<LineItemWrapper> getLineItems2() {
		return listLines2;
	}
	
	public List<LineItemWrapper> getFillerItems() {
		return fillerLines;
	}
	
	public class LineItemWrapper {
        
		public integer index{get;set;}
		public Boolean isDeleted { get;set;} 
		public QuoteLineItem lineItem { get;set; }
		public string displayIndex{get;set;}
                        
		public LineItemWrapper(integer lIndex, boolean isDeleted, QuoteLineItem line) {
			this.lineItem = line;
			this.index = lIndex;
			this.isDeleted = isDeleted;	
			displayIndex = string.valueOf(lIndex);
		}
		
		public LineItemWrapper(integer lIndex, boolean isDeleted, QuoteLineItem line, string display) {
			this.lineItem = line;
			this.index = lIndex;
			this.isDeleted = isDeleted;	
			
			displayIndex = display;
		}
	}

}