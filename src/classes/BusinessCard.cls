public class BusinessCard {
//    public String subject{get;set;}
//    public String body{get;set;}
    
    public String CustomerEmail{get; set; }
    
    public BusinessCard() {}

    public PageReference send() 
    {

        // validate that a dest email exists.
        if (String.isEmpty(CustomerEmail)) return null;

        List <String> toAddresses = new List <String>();
        toAddresses.add(CustomerEmail);


        User usr = [ Select name, firstname, lastname, title, email, phone from User u where u.id = :Userinfo.getUserId()];
        system.debug('user firstname - ' + usr.firstname);
        system.debug('user lastname - ' + usr.lastName);
        system.debug('user title - ' + usr.title);
        system.debug('user email - ' + usr.email);
        system.debug('user phone - ' + usr.phone);
        system.debug('user name - ' + usr.name);
                                                   
         try {

            // Define the email 
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
    
            // Sets the paramaters of the email 
            email.setToAddresses( toAddresses );
            email.setBccSender(false);
            email.setReplyTo(usr.email);
            email.setSubject('Contact information for ' + usr.Name);
            email.setSaveAsActivity(false);
            email.setHtmlBody('<html><head></head><body>Contact Information for ' + usr.Name + 
                      '<br/>Name: ' + usr.FirstName + ' ' + usr.Lastname + 
                      '<br/>Title: ' + usr.Title + 
                      '<br/>Email: ' + usr.email + 
                      '<br/>Phone: ' + usr.phone + 
                      '<br /></body></html>');
    
       
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
            if(r[0].isSuccess()) {
                        System.debug('Mail sent successfully');
                    } else {
                        System.debug('I had a booboo.');
                    }
          } catch(Exception e) { 
                 System.debug('Error Occurred: \n\n' + (e.getMessage() + e));
         }
        return null;
    }
}