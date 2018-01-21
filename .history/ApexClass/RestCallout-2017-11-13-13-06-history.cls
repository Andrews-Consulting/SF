public with sharing class RestCallout {

	public void SampleCall() {
		 HttpRequest req = new HttpRequest(); 
		 
		  //Set HTTPRequest Method
		  req.setMethod('GET');

		  //Set HTTPRequest header properties
		  req.setHeader('content-type', 'application/xml');
		  req.setHeader('Content-Length','1024');
		  req.setHeader('Host','www.googleapis.com');
		  req.setEndpoint('https://www.googleapis.com/drive/v3/about?fields=kind%2CmaxUploadSize%2CstorageQuota%2Cuser&key=AIzaSyCRKIwurVUoYggesVgdCQtWvasWYiu4RH0' );

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