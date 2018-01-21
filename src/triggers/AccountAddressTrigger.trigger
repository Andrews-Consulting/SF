trigger AccountAddressTrigger on Account (before insert, before update) {

//if an Account has a Billing Postal Code and 'Match_Billing_Address__c' is true, 
    for (Account a: Trigger.New) {
        if (a.BillingPostalCode != null && a.Match_Billing_Address__c) {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }

}