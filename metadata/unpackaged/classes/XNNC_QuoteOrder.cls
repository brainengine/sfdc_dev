public class XNNC_QuoteOrder {

	public QuoteOrder__c record { get; set; }

	public XNNC_QuoteOrder(ApexPages.StandardController controller) {
		record = new QuoteOrder__c();
	}

	public PageReference save() {
		insert record;
		return new PageReference('/' + record.Id);
	}

    public static testMethod void testNew() {
        Test.setCurrentPage(Page.XNNP_QuoteOrder);
        QuoteOrder__c record = new QuoteOrder__c();
        XNNC_QuoteOrder controller = new XNNC_QuoteOrder(new ApexPages.StandardController(record));
        controller.save();
    }

    public static testMethod void testEdit() {
        Test.setCurrentPage(Page.XNEP_QuoteOrder);
        QuoteOrder__c record = new QuoteOrder__c();
        insert record;
        XNEC_QuoteOrder controller = new XNEC_QuoteOrder(new ApexPages.StandardController(record));
        controller.save();
    }

    public static testMethod void testView() {
        Test.setCurrentPage(Page.XNVP_QuoteOrder);
        QuoteOrder__c record = new QuoteOrder__c();
        XNVC_QuoteOrder controller = new XNVC_QuoteOrder(new ApexPages.StandardController(record));
    }

}