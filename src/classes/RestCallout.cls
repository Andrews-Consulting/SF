public with sharing class RestCallout {

	public void SampleCall() {
		 HttpRequest req = new HttpRequest(); 
		 
		  //Set HTTPRequest Method
		  req.setMethod('GET');

		  //Set HTTPRequest header properties
		  req.setHeader('Host','www.googleapis.com');
		  req.setEndpoint('https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http%3A%2F%2Fwww.andrewsconsulting.com&filter_third_party_resources=false&key=AIzaSyA56xI7UrPBpMBy8HcAkwMX9U3ZrjuMPI0' );

		  //Set the HTTPRequest body	
		  // req.setBody(body); 	

		  Http http = new Http();
		  
		   try {
		 
		        //Execute web service call here		
		        HTTPResponse res = http.send(req);	

		        //Helpful debug messages
		        System.debug(res.toString());
		        System.debug('STATUS:'+res.getStatus());
		        System.debug('STATUS_CODE:'+res.getStatusCode());
				
		} catch(System.CalloutException e) {
			System.debug(e.getMessage());

		}		
	}
}