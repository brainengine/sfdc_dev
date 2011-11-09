<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Planning_Completed</fullName>
        <description>Planning Completed</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sensor Testers</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SENSOR_Emails/Planning_Completed</template>
    </alerts>
    <alerts>
        <fullName>Planning_Details_Required</fullName>
        <description>Planning Details Required</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sensor Testers</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SENSOR_Emails/Notify_Planning</template>
    </alerts>
    <alerts>
        <fullName>Shipping_Completed</fullName>
        <description>Shipping Completed</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sensor Testers</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SENSOR_Emails/Shipping_Completed</template>
    </alerts>
    <alerts>
        <fullName>Shipping_Details_Required</fullName>
        <description>Shipping Details Required</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sensor Testers</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>Sensor Shipping</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SENSOR_Emails/Notify_Shipping</template>
    </alerts>
    <fieldUpdates>
        <fullName>Acknowledgement_Date_Update</fullName>
        <field>Acknowledgment_Date__c</field>
        <formula>Today()</formula>
        <name>Acknowledgement Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Acknowledgement_Rate</fullName>
        <field>Acknowledgment_Exchange_Rate__c</field>
        <formula>Case( Currency__c , &quot;USD ($)&quot;, Acknowledgement_Exchange_Rate_L__r.Exchange_Rate_USD__c ,&quot;GB(£)&quot;, Acknowledgement_Exchange_Rate_L__r.Exchange_Rate_GBP__c ,&quot;Euro ( €)&quot;, 1, null)</formula>
        <name>Acknowledgement Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Amount_Reset</fullName>
        <field>Amount</field>
        <formula>0</formula>
        <name>Amount Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Amount_Update</fullName>
        <field>Amount</field>
        <formula>IF( Revenue__c &lt;&gt; 0,  Revenue__c , Amount )</formula>
        <name>Amount Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BUForecastCloseDateLoad</fullName>
        <field>BU_Close_Date__c</field>
        <formula>IF( BU_Close_Date_Override__c=true,BU_Close_Date__c,CloseDate)</formula>
        <name>BU Forecast Close Date Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BUForecastDateLoad</fullName>
        <field>BU_Close_Date__c</field>
        <formula>IF(  BU_Close_Date_Override__c  = null,   CloseDate ,  BU_Close_Date__c )</formula>
        <name>BU Forecast Date Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BUForecastMarginLoad</fullName>
        <field>Forecast_Margin__c</field>
        <formula>IF(Forecast_Margin_Override__c=true,Forecast_Margin__c,Sales_Margin__c)</formula>
        <name>BU Forecast Margin Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BUForecastRevenueLoad</fullName>
        <field>Forecast_Revenue__c</field>
        <formula>IF(Forecast_Revenue_Override__c=true,Forecast_Revenue__c, Revenue__c )</formula>
        <name>BU Forecast Revenue Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BU_Comments_Archive_Update</fullName>
        <field>Business_Unit_Comments_Archieve__c</field>
        <formula>Business_Unit_Comments__c &amp; BR() &amp; BR() &amp;  Business_Unit_Comments_Archieve__c</formula>
        <name>BU Comments Archive Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BU_Comments_History_Update</fullName>
        <field>Old_Business_Unit_Comments__c</field>
        <formula>Business_Unit_Comments__c</formula>
        <name>BU Comments History Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BU_Comments_Update</fullName>
        <field>Business_Unit_Comments__c</field>
        <formula>Business_Unit_Comments__c &amp; &apos; - &apos; &amp; MID(TEXT( TODAY()),6,2) &amp; &apos;/&apos; &amp; MID(TEXT( TODAY()),9,2) &amp; &apos;/&apos; &amp; MID(TEXT( TODAY()),3,2) &amp; &apos; &apos;&amp; LEFT( $User.FirstName, 1) &amp; LEFT( $User.LastName, 1)</formula>
        <name>BU Comments Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BU_Comments_Update_Date</fullName>
        <field>Comments_Update_Date__c</field>
        <formula>now()</formula>
        <name>BU Comments Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BU_Comments_Update_User</fullName>
        <field>Comments_Update_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>BU Comments Update User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Date</fullName>
        <field>Cancel_Date__c</field>
        <formula>Today()</formula>
        <name>Cancel Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Carry_Hasp_Update</fullName>
        <field>Carry_Hasp__c</field>
        <formula>SyncedQuote.Carry_Hasp__c</formula>
        <name>Carry Hasp Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Type_Update</fullName>
        <field>Case_Type__c</field>
        <formula>SyncedQuote.Case_Type__c</formula>
        <name>Case Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseMonthUpdate</fullName>
        <field>Close_Month__c</field>
        <formula>MONTH( CloseDate )</formula>
        <name>Close Month Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseQuarterUpdate</fullName>
        <field>Close_Quarter__c</field>
        <formula>CASE(MONTH(CloseDate), 1, 1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 4)</formula>
        <name>Close Quarter Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseYearUpdate</fullName>
        <field>Close_Year__c</field>
        <formula>YEAR( CloseDate )</formula>
        <name>Close Year Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Connectors_Update</fullName>
        <field>Connectors__c</field>
        <formula>SyncedQuote.Connectors__c</formula>
        <name>Connectors Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Damping_Resistor</fullName>
        <field>Damping_Resistor__c</field>
        <formula>SyncedQuote.Damping_Resistor__c</formula>
        <name>Damping Resistor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Dimension_Tolerance</fullName>
        <field>Dimension_Tolerance__c</field>
        <formula>SyncedQuote.Dimension_Tolerance__c</formula>
        <name>Dimension Tolerance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Final_Exchange_Rate</fullName>
        <field>Final_Exchange_Rate__c</field>
        <formula>Case( Currency__c , &quot;USD ($)&quot;,   Final_Exchange_Rate_L__r.Exchange_Rate_USD__c   ,&quot;GB(£)&quot;, Final_Exchange_Rate_L__r.Exchange_Rate_GBP__c ,&quot;Euro ( €)&quot;, 1, null)</formula>
        <name>Final Exchange Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastFlagClone</fullName>
        <field>Previous_Include_In_Forecast_Flag_Value__c</field>
        <literalValue>1</literalValue>
        <name>Forecast Flag Clone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastFlagUpdate</fullName>
        <field>Previous_Include_In_Forecast_Flag_Value__c</field>
        <literalValue>0</literalValue>
        <name>Forecast Flag Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupClosedLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>Total Revenue Recognized to Date</literalValue>
        <name>Forecast Group Closed Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupContractLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>Signed Contracts - No Issues for Revenue Recognition</literalValue>
        <name>Forecast Group Contract Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupOmitLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>Omitted</literalValue>
        <name>Forecast Group Omit Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupPipelineLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>Pipeline</literalValue>
        <name>Forecast Group Pipeline Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupProbableLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>No Signed Contracts - Probable</literalValue>
        <name>Forecast Group Probable Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupUpdate</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>Pipeline</literalValue>
        <name>Forecast Group Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastGroupUpsideLoad</fullName>
        <field>Forecast_Group__c</field>
        <literalValue>No Signed Contracts - Upside</literalValue>
        <name>Forecast Group Upside Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastIssueUpdate</fullName>
        <field>Forecast_Issue__c</field>
        <literalValue>1</literalValue>
        <name>Forecast Issue Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupContractwIssLoa</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>Signed Contracts - Issues Outstanding for Revenue Recognition</literalValue>
        <name>Forecast Report Group Contract w Iss Loa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupContractwoILoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>Signed Contracts - No Issues for Revenue Recognition</literalValue>
        <name>Forecast Report Group Contract wo I Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupOmittedLoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>Omitted</literalValue>
        <name>Forecast Report Group Omitted Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupPipelineLoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>Pipeline</literalValue>
        <name>Forecast Report Group Pipeline Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupProbableLoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>No Signed Contracts - Probable</literalValue>
        <name>Forecast Report Group Probable Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupRevRecLoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>Total Revenue Recognized to Date</literalValue>
        <name>Forecast Report Group Rev Rec Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForecastReportGroupUpsideLoad</fullName>
        <field>Forecast_Report_Override_Group__c</field>
        <literalValue>No Signed Contracts - Upside</literalValue>
        <name>Forecast Report Group Upside Load</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Geophone_Interval</fullName>
        <field>Geophone_Interval_m__c</field>
        <formula>SyncedQuote.Geophone_Interval_m__c</formula>
        <name>Geophone Interval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Geophone_Type_Update</fullName>
        <field>Geophone_Type__c</field>
        <formula>SyncedQuote.Geophone_Type__c</formula>
        <name>Geophone Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Hidden_Opportunity_Name</fullName>
        <field>Hidden_Opportunity_Name__c</field>
        <formula>Hidden_Quote_Name__c  


&amp;IF(OR
(LEN(Hidden_Quote_Name__c)=0,
LEN(Hidden_Order_Number__c)=0),&quot;&quot;,&quot;/&quot;)&amp; 



Hidden_Order_Number__c</formula>
        <name>Hidden Opportunity Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ID_Tag</fullName>
        <field>ID_Tag__c</field>
        <formula>SyncedQuote.ID_Tag__c</formula>
        <name>ID Tag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ID_Tag_Side_One</fullName>
        <field>ID_Tag_Side_One__c</field>
        <formula>SyncedQuote.ID_Tag_Side_One__c</formula>
        <name>ID Tag Side One</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ID_Tag_Side_Two</fullName>
        <field>ID_Tag_Side_Two__c</field>
        <formula>SyncedQuote.ID_Tag_Side_Two__c</formula>
        <name>ID Tag Side Two</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LISDStageProbabilityUpdate</fullName>
        <field>Probability</field>
        <formula>IF(
AND(
ISPICKVAL(StageName, &quot;3.) Quote/Proposal Submission&quot;),
ISPICKVAL(Division__c,  &quot;LISD&quot;)
), 0.25,
IF(
AND(
ISPICKVAL(StageName, &quot;4.) Quote/Negotiation: Ongoing Dialogue&quot;),
ISPICKVAL(Division__c,  &quot;LISD&quot;)
), 0.50, 
  Probability ))</formula>
        <name>LISD Stage Probability Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LastStepUpdate</fullName>
        <field>Last_Step__c</field>
        <formula>Next_Step_History__c</formula>
        <name>Last Step Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_in_Update</fullName>
        <field>Lead_In__c</field>
        <formula>SyncedQuote.Lead_in__c</formula>
        <name>Lead in Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Margin_Reset</fullName>
        <field>Sales_Margin__c</field>
        <formula>0</formula>
        <name>Margin Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NextStepHistoryUpdate</fullName>
        <field>Next_Step_History__c</field>
        <formula>NextStep</formula>
        <name>Next Step History Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NextStepUpdate</fullName>
        <field>Next_Step_History__c</field>
        <formula>NextStep</formula>
        <name>Next Step Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Number_of_Phones</fullName>
        <field>Number_of_Phones__c</field>
        <formula>SyncedQuote.Number_of_Phones__c</formula>
        <name>Number of Phones</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityAmountUpdate</fullName>
        <field>Old_Amount__c</field>
        <formula>Amount</formula>
        <name>Opportunity Amount Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityCloseDateUpdate</fullName>
        <field>Old_Close_Date__c</field>
        <formula>CloseDate</formula>
        <name>Opportunity Close Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityCreateFlagUpdate</fullName>
        <field>New_Opportunity__c</field>
        <literalValue>0</literalValue>
        <name>Opportunity Create Flag Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityForecastGroupUpdate</fullName>
        <field>Old_Forecast_Group__c</field>
        <formula>CASE( Forecast_Group__c , &apos;Pipeline&apos;, &apos;Pipeline&apos;, &apos;No Signed Contracts – Upside&apos;, &apos;No Signed Contracts – Upside&apos;, &apos;No Signed Contracts – Probable&apos;, &apos;No Signed Contracts – Probable&apos;, &apos;No Signed Contracts - Highly Probable&apos;, &apos;No Signed Contracts - Highly Probable&apos;, &apos;Signed Contracts - Issues Outstanding for Revenue Recognition&apos;, &apos;Signed Contracts - Issues Outstanding for Revenue Recognition&apos;, &apos;Signed Contracts - No Issues for Revenue Recognition&apos;, &apos;Signed Contracts - No Issues for Revenue Recognition&apos;, &apos;Total Sales Margin (Cost) Impacts&apos;, &apos;Total Sales Margin (Cost) Impacts&apos;, &apos;Total Revenue Recognized to Date&apos;, &apos;Total Revenue Recognized to Date&apos;, &apos;Omitted&apos;)</formula>
        <name>Opportunity Forecast Group Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityMarginUpdate</fullName>
        <field>Old_Sales_Margin__c</field>
        <formula>Sales_Margin__c</formula>
        <name>Opportunity Margin Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OpportunityStageUpdate</fullName>
        <field>Old_Stage__c</field>
        <formula>CASE( StageName,
&apos;1 - Lead Generation and Management&apos;, &apos;1 - Lead Generation and Management&apos;,
&apos;2 - Opportunity Assessment&apos;, &apos;2 - Opportunity Assessment&apos;,
&apos;3 - Solution Development&apos;, &apos;3 - Solution Development&apos;,
&apos;4 - Proposal Development&apos;, &apos;4 - Proposal Development&apos;,
&apos;5 - Negotiation and Verbal Acceptance&apos;, &apos;5 - Negotiation and Verbal Acceptance&apos;,
&apos;6 - Won - Contract and Receive PO&apos;, &apos;6 - Won - Contract and Receive PO&apos;,
&apos;7 - Close: Bus. Fulfillment Rev Recog.&apos;, &apos;7 - Close: Bus. Fulfillment Rev Recog.&apos;,
&apos;Closed - Lost to Competitor&apos;, &apos;Closed - Lost to Competitor&apos;,
&apos;Closed - No Bid&apos;, &apos;Closed - No Bid&apos;,
&apos;Closed - Not Pursued&apos;)</formula>
        <name>Opportunity Stage Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Overall_Length</fullName>
        <field>Overall_Length_m__c</field>
        <formula>SyncedQuote.Overall_Length_m__c</formula>
        <name>Overall Length</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_1_Update</fullName>
        <field>Payment_1__c</field>
        <formula>Revenue__c</formula>
        <name>Payment 1 Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Date_1_Update</fullName>
        <field>Payment_Date_1__c</field>
        <formula>CloseDate + Payment_Days__c</formula>
        <name>Payment Date 1 Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pick_up_Loops</fullName>
        <field>Pick_up_Loops__c</field>
        <formula>SyncedQuote.Pick_up_Loops__c</formula>
        <name>Pick up Loops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PlanFlagUpdate</fullName>
        <field>Planned_Opportunity__c</field>
        <literalValue>Yes</literalValue>
        <name>Plan Flag Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Date</fullName>
        <field>Planning_Date__c</field>
        <formula>Today()</formula>
        <name>Plan Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Date_Update</fullName>
        <field>Plan_Close_Date__c</field>
        <formula>CloseDate</formula>
        <name>Plan Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Margin_Update</fullName>
        <field>Plan_Margin__c</field>
        <formula>Sales_Margin__c</formula>
        <name>Plan Margin Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Region_Update</fullName>
        <field>Plan_Sales_Region__c</field>
        <formula>Sales_Region__c</formula>
        <name>Plan Region Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Revenue_Update</fullName>
        <field>Plan_Revenue__c</field>
        <formula>Revenue__c</formula>
        <name>Plan Revenue Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_Sales_Margin_Update</fullName>
        <field>Sales_Margin__c</field>
        <formula>IF( Sales_Margin__c = 0,  Revenue__c * 0.70,  Sales_Margin__c )</formula>
        <name>Plan Sales Margin Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Plan_date_is_today</fullName>
        <field>Plan_Date__c</field>
        <formula>today()</formula>
        <name>Plan date is today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Polarity</fullName>
        <field>Polarity__c</field>
        <formula>SyncedQuote.Polarity__c</formula>
        <name>Polarity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>QuoteRequestFlagReset</fullName>
        <description>Resets the Request Quote flag following the email notification and task creation</description>
        <field>Request_Shipping_Quote__c</field>
        <literalValue>0</literalValue>
        <name>Quote Request Flag Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Date_Updated</fullName>
        <field>Quote_Date__c</field>
        <formula>Today()</formula>
        <name>Quote Date Updated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quote_Exchange_Rate</fullName>
        <field>Quote_Exchange_Rate__c</field>
        <formula>Case( Currency__c , &quot;USD ($)&quot;,  Quote_Exchange_Rate_L__r.Exchange_Rate_USD__c  ,&quot;GB(£)&quot;, Quote_Exchange_Rate_L__r.Exchange_Rate_GBP__c ,&quot;Euro ( €)&quot;, 1, null)</formula>
        <name>Quote Exchange Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Quoted_Opportunity</fullName>
        <field>Quoted__c</field>
        <literalValue>1</literalValue>
        <name>Quoted Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Request_Date_Update</fullName>
        <field>Request_Date__c</field>
        <formula>Today()</formula>
        <name>Request Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Revenue_Reset</fullName>
        <field>Revenue__c</field>
        <formula>0</formula>
        <name>Revenue Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sensor_Opportunity_Name</fullName>
        <field>Name</field>
        <formula>Hidden_Oppty_Name__c</formula>
        <name>Sensor Opportunity Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Spike_Base</fullName>
        <field>Spike_Base__c</field>
        <formula>SyncedQuote.Spike_Base__c</formula>
        <name>Spike/Base</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatusUpdateDate</fullName>
        <field>Status_Update_Date__c</field>
        <formula>now()</formula>
        <name>Status Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatusUpdateUser</fullName>
        <field>Status_Update_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp;  $User.LastName</formula>
        <name>Status Update User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Archive_Update</fullName>
        <field>Opportunity_Status_Archive__c</field>
        <formula>Opportunity_Issues__c &amp; BR() &amp; BR() &amp;  Opportunity_Status_Archive__c</formula>
        <name>Status Archive Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_History_Update</fullName>
        <field>Old_Opportunity_Status__c</field>
        <formula>Opportunity_Issues__c</formula>
        <name>Status History Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update</fullName>
        <field>Opportunity_Issues__c</field>
        <formula>Opportunity_Issues__c &amp; &apos; - &apos; &amp; MID(TEXT( TODAY()),6,2) &amp; &apos;/&apos; &amp; MID(TEXT( TODAY()),9,2) &amp; &apos;/&apos; &amp; MID(TEXT( TODAY()),3,2) &amp; &apos; &apos;&amp; LEFT( $User.FirstName, 1) &amp;  LEFT( $User.LastName, 1)</formula>
        <name>Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Notify_Sales</fullName>
        <field>Notify_Sales_P__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Notify Sales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Planning_Request</fullName>
        <field>Request_Planning_Info__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Planning Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Shipping_Quote_Complete</fullName>
        <field>Shipping_Quote_Complete__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Shipping Quote Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Shipping_Request</fullName>
        <field>Request_Shipping_Quote__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Shipping Request</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ack_GB_Rate</fullName>
        <field>Acknowledgment_Exchange_Rate_GB__c</field>
        <formula>Acknowledgement_Exchange_Rate_L__r.Exchange_Rate_GBP__c</formula>
        <name>Update Ack. GB Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ack_US_Rate</fullName>
        <field>Acknowledgment_Exchange_Rate_US__c</field>
        <formula>Acknowledgement_Exchange_Rate_L__r.Exchange_Rate_USD__c</formula>
        <name>Update Ack. US Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cable_Type</fullName>
        <field>Cable_Type__c</field>
        <formula>SyncedQuote.Cable_Type__c</formula>
        <name>Update Cable Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Final_GB_Rate</fullName>
        <field>Final_Exchange_Rate_GB__c</field>
        <formula>Final_Exchange_Rate_L__r.Exchange_Rate_GBP__c</formula>
        <name>Update Final. GB Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Final_US_Rate</fullName>
        <field>Final_Exchange_Rate_US__c</field>
        <formula>Final_Exchange_Rate_L__r.Exchange_Rate_USD__c</formula>
        <name>Update Final US Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_JA_Order_Type</fullName>
        <field>Order_Type__c</field>
        <literalValue>JA</literalValue>
        <name>Update JA Order Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_GB_Rate</fullName>
        <field>Quote_Exchange_Rate_GB__c</field>
        <formula>Quote_Exchange_Rate_L__r.Exchange_Rate_GBP__c</formula>
        <name>Update Quote. GB Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_US_Rate</fullName>
        <field>Quote_Exchange_Rate_US__c</field>
        <formula>Quote_Exchange_Rate_L__r.Exchange_Rate_USD__c</formula>
        <name>Update Quote. US Rate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_SN_Order_Type</fullName>
        <field>Order_Type__c</field>
        <literalValue>SN</literalValue>
        <name>Update SN Order Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workorder_Date</fullName>
        <field>Workorder_Date__c</field>
        <formula>Today()</formula>
        <name>Workorder Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Acknowledgement Date Update</fullName>
        <actions>
            <name>Acknowledgement_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Sensor Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acknowledgment_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BU Comments Update</fullName>
        <actions>
            <name>BU_Comments_Archive_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BU_Comments_History_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BU_Comments_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BU_Comments_Update_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BU_Comments_Update_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Business_Unit_Comments__c  &lt;&gt;  Old_Business_Unit_Comments__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BU Forecast Data Load</fullName>
        <actions>
            <name>BUForecastCloseDateLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BUForecastMarginLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BUForecastRevenueLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Forecast Impacts,Spares / Replacements - Transaction Opportunity,Run Rate,Standard Opportunity,System Opportunity</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Business Segment Update - Data Management</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>CSL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Business Segment Update - Marine</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>MISD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSL Opportunity Forecast Issue</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>CSL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CSL Opportunity Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>CSL</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CSL Opportunity Win</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6.) Ship - Invoice (100%)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>CSL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Date Update</fullName>
        <actions>
            <name>Cancel_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Sensor Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Order_Canceled__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Date Updates</fullName>
        <actions>
            <name>CloseMonthUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CloseQuarterUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CloseYearUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates Close Month, Quarter and Year fields</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Evaluation</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Group - Closed Update</fullName>
        <actions>
            <name>ForecastGroupClosedLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>7.) Ship - Invoice</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Group - Omit Update</fullName>
        <actions>
            <name>ForecastGroupOmitLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed - Lost,Closed - Not Pursued,2008 Plan</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Issue Update</fullName>
        <actions>
            <name>ForecastIssueUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Comments__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Contract with Issues Load</fullName>
        <actions>
            <name>ForecastReportGroupContractwIssLoa</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>Signed Contracts - Issues Outstanding for Revenue Recognition</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Contract without Issues Load</fullName>
        <actions>
            <name>ForecastReportGroupContractwoILoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>Signed Contracts - No Issues for Revenue Recognition</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Omitted Load</fullName>
        <actions>
            <name>ForecastReportGroupOmittedLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>Omitted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Pipeline Load</fullName>
        <actions>
            <name>ForecastReportGroupPipelineLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>Pipeline</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Probable Load</fullName>
        <actions>
            <name>ForecastReportGroupProbableLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>No Signed Contracts - Probable</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Rev Rec Load</fullName>
        <actions>
            <name>ForecastReportGroupRevRecLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>Total Revenue Recognized to Date</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Report Group Upside Load</fullName>
        <actions>
            <name>ForecastReportGroupUpsideLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Group__c</field>
            <operation>equals</operation>
            <value>No Signed Contracts - Upside</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Forecast_Report_Group_Override__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>INOVA Payment Update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LISD,ARAM,INOVA</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LISD Opportunity Forecast Issue</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LISD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LISD Opportunity Notification</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LISD</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LISD Opportunity Win</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6.) Ship - Invoice (100%)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LISD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LSBU Opportunity Forecast Issue</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LSBU</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LSBU Opportunity Win</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6.) Ship - Invoice (100%)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>LSBU</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MISD Opportunity Forecast Issue</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Forecast_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>MISD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MISD Opportunity Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>MISD</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MISD Opportunity Win</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6.) Ship - Invoice (100%)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>MISD</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Margin Rollup</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>DELETE - SFDC Clean-Up</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New ISC%2FME Opportunity</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Sales_Territory__c</field>
            <operation>equals</operation>
            <value>ISC,Middle East</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Next Step Setup</fullName>
        <actions>
            <name>NextStepHistoryUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.NextStep</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Next Step Update</fullName>
        <actions>
            <name>LastStepUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>NextStepUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NextStep &lt;&gt;  Next_Step_History__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify Planning</fullName>
        <actions>
            <name>Planning_Details_Required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Uncheck_Notify_Sales</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Planning_Info__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Shipping</fullName>
        <actions>
            <name>Shipping_Details_Required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Uncheck_Shipping_Quote_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Shipping_Quote__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Creation</fullName>
        <actions>
            <name>ForecastGroupUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Payment</fullName>
        <actions>
            <name>Payment_1_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISNEW() &amp;&amp; ($RecordType.Name = &quot;INOVA System Opportunity&quot;  || $RecordType.Name = &quot;INOVA Run Rate Opportunity&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Payment Date</fullName>
        <actions>
            <name>Payment_Date_1_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISNEW() &amp;&amp; ($RecordType.Name = &quot;INOVA System Opportunity&quot; || $RecordType.Name = &quot;INOVA Run Rate Opportunity&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Update</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Update TEST</fullName>
        <actions>
            <name>OpportunityAmountUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OpportunityCloseDateUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OpportunityCreateFlagUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OpportunityForecastGroupUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OpportunityMarginUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>OpportunityStageUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND (ISPICKVAL (Division__c , &quot;LSBU&quot;) , NOT (ISNEW()),  OR (ISCHANGED(Amount), ISCHANGED(Sales_Margin__c), ISCHANGED(CloseDate), ISCHANGED(Deal_Probability__c), ISCHANGED(Forecast_Group__c), ISCHANGED(StageName), ISCHANGED(Opportunity_Issues__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Value Update</fullName>
        <actions>
            <name>Amount_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Revenue__c &lt;&gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Plan Margin Update</fullName>
        <actions>
            <name>Plan_Sales_Margin_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>INOVA Rental Opportunity</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Plan Opportunity Conversion</fullName>
        <actions>
            <name>Amount_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Margin_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Revenue_Reset</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>INOVA System Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>0 - Plan</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Plan Value Update</fullName>
        <actions>
            <name>Plan_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Plan_Margin_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Plan_Region_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Plan_Revenue_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>INOVA 2010 Plan Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Division__c</field>
            <operation>equals</operation>
            <value>ARAM,LISD,INOVA</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Planning Completed</fullName>
        <actions>
            <name>Planning_Completed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Uncheck_Planning_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Notify_Sales_P__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>contains</operation>
            <value>Sensor Planning</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Plan Date</fullName>
        <actions>
            <name>Plan_date_is_today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Planning_Date__c</field>
            <operation>greaterThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Quote Date Update</fullName>
        <actions>
            <name>Quote_Date_Updated</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Quote_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Sensor Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Request Date Update</fullName>
        <actions>
            <name>Request_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Request_Shipping_Quote__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Sensor Opportunity</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Revenue and Margin Update</fullName>
        <actions>
            <name>BUForecastMarginLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BUForecastRevenueLoad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>$RecordType.Name = &apos;INOVA System Opportunity&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Shipping Completed</fullName>
        <actions>
            <name>Shipping_Completed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Uncheck_Shipping_Request</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Shipping_Quote_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>contains</operation>
            <value>Sensor Shipping</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Status Update</fullName>
        <actions>
            <name>StatusUpdateDate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>StatusUpdateUser</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_Archive_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_History_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Opportunity_Issues__c &lt;&gt;  Old_Opportunity_Status__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Test Workflow</fullName>
        <active>false</active>
        <formula>Amount &lt;&gt;  Old_Amount__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Opportunity Exchange Rates</fullName>
        <actions>
            <name>Acknowledgement_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Final_Exchange_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Quote_Exchange_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Ack_GB_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Ack_US_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Final_GB_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Final_US_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Quote_GB_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Quote_US_Rate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( Acknowledgement_Exchange_Rate_L__c &lt;&gt;null,  Final_Exchange_Rate_L__c &lt;&gt;null, Quote_Exchange_Rate_L__c &lt;&gt;null)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Order String Info</fullName>
        <actions>
            <name>Carry_Hasp_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Case_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Connectors_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Damping_Resistor</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Dimension_Tolerance</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Geophone_Interval</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Geophone_Type_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ID_Tag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ID_Tag_Side_One</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Cable_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>SyncedQuote.Id &lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Order String Info2</fullName>
        <actions>
            <name>ID_Tag_Side_Two</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_in_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Number_of_Phones</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Overall_Length</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pick_up_Loops</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Polarity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Spike_Base</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>SyncedQuote.Id &lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Order Type</fullName>
        <actions>
            <name>Update_JA_Order_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.OPLI_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Quote_Type__c</field>
            <operation>equals</operation>
            <value>JAQ</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Order Type%3A SN</fullName>
        <actions>
            <name>Update_SN_Order_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.OPLI_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Quote_Type__c</field>
            <operation>equals</operation>
            <value>SP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Sensor Opportunity Name</fullName>
        <actions>
            <name>Sensor_Opportunity_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>or(RecordTypeId =&quot;012P0000000CkHO&quot;, RecordTypeId=&quot;012P0000000CrC6&quot;, RecordTypeId=&quot;012P0000000CrEl&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Work order Date Update</fullName>
        <actions>
            <name>Workorder_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Sensor Opportunity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Workorder_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
