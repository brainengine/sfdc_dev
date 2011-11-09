public class OpportunityExtension{

	public  integer listIndex{get;set;}
	public  integer currentIndex{get;set;}
	
	private final Opportunity oppty;
	private List<LineItemWrapper> listLines  = new List<LineItemWrapper>();
	private List<LineItemWrapper> listLines2  = new List<LineItemWrapper>();
	private List<LineItemWrapper> fillerLines  = new List<LineItemWrapper>();
	
	public boolean hasSecondPage {get;set;}
	public integer pageOne {get;set;}
	public integer pageTwo {get;set;}	
	public integer pageCount {get;set;}
	
	public OpportunityExtension(ApexPages.StandardController stdController) {
		this.oppty = (Opportunity)stdController.getRecord();
		System.debug('quote def:::::::::::: ' + oppty);
		listIndex =0;
		queryLineItems(); 
	}
	
	private void queryLineItems(){
		
		Set<Id> lineIds = new Set<Id>();
		List<OpportunityLineItem> lineList = new List<OpportunityLineItem>();
	
		integer index = 0;
		
		for(OpportunityLineItem line : [Select O.Acknowledgement_Cost__c, O.BIGM_Cost__c, O.Category_Code__c, O.Category_Code_Historical__c, O.Closing_Quarter__c, O.Cost__c, 
									O.CreatedById, O.CreatedDate, O.CurrencyIsoCode, O.ServiceDate, O.IsDeleted, O.BIGM_Discount__c, O.Discount, O.Discount_Type__c, O.Expected_Quantity__c, 
									O.BIGM_Extended_Net_Total__c, O.External_Identifier__c, O.HasQuantitySchedule, O.HasRevenueSchedule, O.HasSchedule, O.HasOLIS__c, O.LastModifiedById, O.LastModifiedDate, O.Legacy_ID__c, 
									O.Description, O.Id, O.ListPrice, O.MarginP__c, O.Margin__c, O.OpportunityId, O.PricebookEntryId, O.Quantity, O.Quoted_Cost__c, O.Quoted_Price__c, O.ConnectionReceivedId, 
									O.Report_Product_Margin__c, O.Report_Product_Revenue__c, O.Reportable__c, O.UnitPrice, O.Seismic_Enquiry__c, O.ConnectionSentId, O.SortOrder, O.Subtotal, O.SystemModstamp, O.Total_Cost__c, 
									O.Total_Discount__c, O.Total_Margin__c, O.TotalPrice, O.Total_Product_Margin__c, O.Type__c, O.Unit_Cost__c, O.Unit_Discount__c, O.Unit_Margin__c, O.Unit_MarginQ__c, O.Unit_Price__c 
									from OpportunityLineItem O where OpportunityId =: oppty.Id]){
		
			lineList.add(line);
			lineIds.add(line.Id);
		
		}
		
		for(OpportunityLineItem line : lineList) {
			listLines.add(new LineItemWrapper(++listIndex, false, line));
		}
		
		if(lineList.size()>5){
			pageCount = 2;
			hasSecondPage = true;
			
			Integer count = lineList.size();

			while (count < 14) {
				listLines.add(new LineItemWrapper(++listIndex, false, new OpportunityLineItem(),''));
				count++;
			}
			
			count = 0;
			while (count < 3) {
				listLines2.add(new LineItemWrapper(++listIndex, false, new OpportunityLineItem(),''));
				count++;
			}

			count = 0;
			while (count < 13) {
				fillerLines.add(new LineItemWrapper(++listIndex, false, new OpportunityLineItem(),''));
				count++;
			}
			
		}else{
			
			Integer count = lineList.size();

			while (count < 4) {
				listLines.add(new LineItemWrapper(++listIndex, false, new OpportunityLineItem(),''));
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
		public OpportunityLineItem lineItem { get;set; }
		public string displayIndex{get;set;}
                        
		public LineItemWrapper(integer lIndex, boolean isDeleted, OpportunityLineItem line) {
			this.lineItem = line;
			this.index = lIndex;
			this.isDeleted = isDeleted;	
			displayIndex = string.valueOf(lIndex);
		}
		
		public LineItemWrapper(integer lIndex, boolean isDeleted, OpportunityLineItem line, string display) {
			this.lineItem = line;
			this.index = lIndex;
			this.isDeleted = isDeleted;	
			
			displayIndex = display;
		}
	}

}