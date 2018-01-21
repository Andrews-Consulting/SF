<aura:application >
    <c:RegistrationForm />

    
<!--    You are using a {!$Browser.formFactor}<br />
    IsTablet = {!$Browser.isTablet}<br />
    IsPhone = {!$Browser.isPhone}<br />
    isAndroid = {!$Browser.isAndroid}<br />
	Language = {!$Locale.language}<br />
    TimeZone = {!$Locale.timezone}<br />
    Number Format = {!$Locale.numberFormat}<br />
    Currency Format = {!$Locale.currencyFormat}<br />
-->    
    <!-- To pass an attribute value into the component from the app
		  I'm using the same name, but there are two variables in different namespaces.
   		  You can invoke this app with a query string of ?whom=george that will be passed to 
    	  the Lightning component and overwrite the default  -->
<!--    <aura:attribute name="whom" type="String" default="chris" /> -->
    <!-- If no default exists in the previous line, then this actually sets the attruibute to blank
  	 	 overriding any default we have in the component.  We need to invoke the component differently
  		 if there isn't a value specified, so that we can leverage the component's default value -->

<!--    <c:MyLightningComponent whom="{!v.whom}" />  -->
</aura:application>