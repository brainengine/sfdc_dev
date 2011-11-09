<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Product_Description</fullName>
        <field>Description</field>
        <formula>PricebookEntry.Product2.Description</formula>
        <name>Product Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Total_Cost_Update</fullName>
        <field>Total_Cost_FU__c</field>
        <formula>Unit_Cost__c * Quantity</formula>
        <name>Total Cost Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Total_Margin_Update</fullName>
        <field>Total_Margin_fu__c</field>
        <formula>(Quantity * IF(Discount&lt;&gt;0,1-Discount, 1) * UnitPrice )- Total_Cost__c</formula>
        <name>Total Margin Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Autoupdate Product Description</fullName>
        <actions>
            <name>Product_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Id&lt;&gt;null</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Margin and Cost</fullName>
        <actions>
            <name>Total_Cost_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Total_Margin_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Id&lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
