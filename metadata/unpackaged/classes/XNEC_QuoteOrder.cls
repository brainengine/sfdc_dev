public class XNEC_QuoteOrder {

	public QuoteOrder__c record { get; set; }
	
	public XNEC_QuoteOrder(ApexPages.StandardController controller) {
		record = (QuoteOrder__c)controller.getRecord();
		String id = record.Id;
		for (QuoteOrder__c[] results : [select Id,Naam__c,Sales_Date__c,Customer__c,Contact__c,Salesperson__c,From__c,ClientOrderNo__c,Tel__c,Fax__c,Week__c,AmendNo__c,Rev_Descr__c,Terms__c,Probability__c,SP__c,SPA__c,SPN__c,SPJ__c,SN__c,SNA__c,SNN__c,SNJ__c,CCR__c,REP__c,IOQuoteNo__c,AttachementsXNRTF__c,Product__c,SeismicEnquiry__c,DescriptionShort__c,DescriptionXNRTF__c,CommentsXNRTF__c,ManufactureIn__c,PlanDate__c,QuoteDel__c,PlanningValidity__c,OrderDel__c,WorkOrderWeek__c,TransOrdNr__c,PlanningCommentsXNRTF__c,ExchRateUS__c,Currency__c,ExchRate__c,QuoExchangeRate__c,QuoExchangeRateUS__c,Q_BU_S__c,Q_BU_C__c,Q_Str_S__c,Q_Str_C__c,Q_Ind_S__c,Q_Ind_C__c,Q_Tst_S__c,Q_Tst_C__c,Q_sp_S__c,Q_Sp_C__c,PriceQuoted__c,QuotedCostPrice__c,QuoYN__c,QuoDate__c,QuoRevisedDate__c,AckExhangeRate__c,AckExhangeRateUS__c,A_BU_S__c,A_BU_C__c,A_Str_S__c,A_Str_C__c,A_Ind_S__c,A_Ind_C__c,A_Tst_S__c,A_Tst_C__c,A_Sp_S__c,A_Sp_C__c,PriceAcknld__c,AcknldCostPrice__c,AckYN__c,AckDate__c,AckRevisedDate__c,WorYN__c,WorDate__c,OrderCancelledYN__c,CancelDate__c,FolCommentXNRTF__c,P1WK__c,P1Val__c,P2WK__c,P2Val__c,P3WK__c,P3Val__c,P4WK__c,P4Val__c,P5WK__c,P5Val__c,P6WK__c,P6Val__c,P7WK__c,P7Val__c,P8WK__c,P8Val__c,ShipQuoteYN__c,EstGrossWeight__c,EstNettWeight__c,EstNoPacks__c,EstPackDims__c,ReqShipDestination__c,Forwarder__c,Packing__c,CartAndForwarding__c,Freight__c,Insurance__c,Documents__c,ShippingCommentsXNRTF__c,Invoice__c,ShippedDate__c,LastEditor__c,QuoteDelOld__c,QuoYN_Old__c,AckYN_Old__c,WorYN_Old__c,RevYN_Old__c,DeaYN_Old__c,FolYN_Old__c,OrderCancelledYN_Old__c,ShipQuoteYNDate__c,ShipQuoteYN_Old__c,QuoteProbability__c,QuoteDate__c,OrderDate__c,SalesRole__c,PlanningRole__c,ShippingRole__c from QuoteOrder__c where Id = :id]) {
			if (results.size() > 0) {
				record = results[0];
			}
		}
	}

	public PageReference save() {
		update record;
		return new PageReference('/' + record.Id);
	}
	
}