// This is an anonymous self-executing function closure thingie,
// like all the cool kids are using these days.
(function(myContext){

    // Deal with possible order-of-execution issues.
    // Don't overwrite ourself if we already exist.
    myContext.ForceUI = myContext.ForceUI || {};

    // Utility methods that make simple string comparisons
    // against a local UserUITheme value. This value is
    // injected from a Visualforce page to allow expression
    // evaluation of the $User.UIThemeDisplayed global.
    myContext.ForceUI.isSalesforceClassic = function() {
        return (this.UserUITheme == 'Theme3');
    }
    myContext.ForceUI.isLightningExperience = function() {
        return (this.UserUITheme == 'Theme4d');
    }
    myContext.ForceUI.isSalesforce1 = function() {
        return (this.UserUITheme == 'Theme4t');
    }
})(this);