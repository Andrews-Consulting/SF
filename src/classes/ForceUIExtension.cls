public with sharing class ForceUIExtension {

    // Empty constructor, required for Visualforce controller extension
    public ForceUIExtension(ApexPages.StandardController controller) { }
    
    // Simple accessors for the System.UserInfo theme methods
    public String getContextUserUiTheme() {
        return UserInfo.getUiTheme();
    }    
    public String getContextUserUiThemeDisplayed() {
        return UserInfo.getUiThemeDisplayed();
    }    

}