<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Shipping_and_Handling_Total</fullName>
        <field>ShippingHandling</field>
        <formula>Opportunity.Cart_Forwarding__c + Opportunity.Freight__c + Opportunity.Packing__c + Opportunity.Insurance__c</formula>
        <name>Shipping and Handling Total</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Quote_Name</fullName>
        <field>Name</field>
        <formula>IF(Text( Opportunity.Entity__c )=&quot;Cayman&quot;,&quot;JAQ &quot; &amp; Opportunity.Quote_No__c&amp;&quot;-&quot;&amp;Right( QuoteNumber ,3),
IF(Text(Opportunity.Entity__c)=&quot;Nederland&quot;,&quot;SP &quot; &amp; Opportunity.Quote_No__c&amp;&quot;-&quot;&amp;Right( QuoteNumber ,3),
null))</formula>
        <name>Update Quote Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Quote Name</fullName>
        <actions>
            <name>Shipping_and_Handling_Total</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Quote_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Id&lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
