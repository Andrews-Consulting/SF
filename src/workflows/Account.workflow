<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Approve_New_Account_To_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Approve New Account To Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approve_New_Account_To_Pending</fullName>
        <description>Approve New Account Update type field to pending</description>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>Approve New Account To Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approve_New_Account_to_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Approve New Account to Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Send_Account_Info</fullName>
        <apiVersion>40.0</apiVersion>
        <endpointUrl>http://andrewsconsulting.com/test</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>BillingState</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>chrisa@andrewsconsulting.com</integrationUser>
        <name>Send Account Info</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>outbound Message on Create</fullName>
        <actions>
            <name>Send_Account_Info</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
