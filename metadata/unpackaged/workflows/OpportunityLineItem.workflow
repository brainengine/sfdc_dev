<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Product_Description</fullName>
        <field>Description</field>
        <formula>Product2.Description</formula>
        <name>Product Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Total_Cost</fullName>
        <field>Cost__c</field>
        <formula>Total_Cost__c</formula>
        <name>Total Cost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Discount</fullName>
        <field>Discount</field>
        <formula>(Unit_Discount__c *100)/ UnitPrice</formula>
        <name>Update Discount %</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Unit_Discount</fullName>
        <field>Unit_Discount__c</field>
        <formula>UnitPrice * Discount</formula>
        <name>Update Unit Discount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Product Description</fullName>
        <actions>
            <name>Product_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>LEN(Description) =0</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Regular Updates</fullName>
        <actions>
            <name>Total_Cost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Id&lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Discount %25</fullName>
        <actions>
            <name>Update_Discount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OpportunityLineItem.Unit_Discount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Discount</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Unit Discount</fullName>
        <actions>
            <name>Update_Unit_Discount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Discount</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
