<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
   <head>
  <meta http-equiv="Content-Script-Type" content="text/javascript" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
      <title>${institution_name} Document Share URL Information</title>
      <style type="text/css">
         a
         {
            text-decoration: none; 
            color:           #1948b1;
         }
         #pageheader
         {
            margin-bottom:    1em;
            margin-left: auto;
            margin-right: auto;
            width:            700px;
            padding:          2pt;
            border:           0pt;
            font-family:      Verdana;
            font-size:        18pt;
            color:            #000000;
            text-align:       center;
            display-align:    center;
         }
         #pagefooter
         {
            margin-bottom:    1em;
            border:           0pt;
            font-family:      Verdana;
            font-size:        8pt;
            text-align:       center;
            display-align:    center;
         }

         #para
         {
            margin-bottom:    1em;
            width:            700px;
            padding:          2pt;
            font-family:      Verdana;
            font-size:        10pt;
            color:            #000000;
            text-align:       justify;
            display-align:    center;
         }

         #section
         {
            padding:          2pt;
            font-family:      Verdana;
            font-size:        14pt;
            color:            #000000;
            text-align:       left;
            display-align:    center;
         }

         .para
         {
            margin-bottom:    1em;
            margin-left: auto;
            margin-right: auto;
            width:            700px;
            padding:          2pt;
            font-family:      Verdana;
            font-size:        10pt;
            color:            #000000;
            text-align:       justify;
            display-align:    center;
         }

         .section
         {
            padding:          2pt;
            margin-left: auto;
            margin-right: auto;
            width:            700px;
            font-family:      Verdana;
            font-size:        14pt;
            color:            #000000;
            text-align:       left;
            display-align:    center;
         }

         #fieldlabel
         {
            font-family:      Verdana;
            font-weight:      bold;
            font-size:        12pt;
            color:            #000000;
            text-align:       left;
         }
         #fieldvalue
         {
            font-family:      Verdana;
            font-weight:      none;
            font-size:        12pt;
            color:            #000000;
            text-align:       left;
         }
      </style>
   </head>
   <#assign accessType = ticket.getAccessType()?int />
   <#assign expiry = ticket.getExpires() />
   <body bgcolor="#ffffff">

      <div id="pageheader">${institution_name}<br/>Document Share URL Information</div>
      <br/><br/>

      <div class="para">This email was automatically sent to you by ${institution_name} at the request of ${user.getFullName()} (<a href="mailto:${user.getEmailAddress()}">${user.getEmailAddress()}</a>), who is a student or graduate of
       ${institution_name}. ${institution_name} has issued ${user.getFullName()} with an electronic ${document.getProfileDTO().getProfileName()} which can be securely verified online at a website controlled by ${institution_name}.
      </div>
      <br/><br/>

      <div class="section">How do I know this email is genuine?</div>
      <div class="para">This email is <strong>digitally signed</strong> using an email address at ${institution_name}, and cannot be fabricated or modified. You can check the digital signature on this email using your 
      email application.
      </div>
      <br/><br/>

      <div class="section">How do I verify the document online?</div>
      <div class="para">${institution_name} provides a <strong>free and secure online service</strong> for recruiters and other third parties to verify the authenticity of official documents issued to its graduates. Only authorised
      officials of ${institution_name} can create documents on this site, however students/graduates can control and monitor <em>who</em> accesses their official documents online. This is the <strong>official</strong> way 
      for these types of documents to be verified at ${institution_name}, and is more secure than using paper documents.
      <br/><br/>
      To verify the document online, click on the <em>document share URL</em> shown below:<br/><br/>

      <a href="${verifydaturl}?datid=${ticket.getTicketId()}" style="color:red">${verifydaturl}?datid=${ticket.getTicketId()}</a><br/><br/>

      <#if accessType != 3>
           You will need to register your details at ${institution_name} online if you have not already done so. Registration is free and straightforward, and has been requested by ${user.getFullName()} in 
           order to restrict access to his/her document for Data Protection reasons. Once you are registered and logged in, you can access the document online by visiting the document share URL shown above.
      </#if>
      <br/>
      The document will be verified online and you will be able to view the document as it was originally issued by ${institution_name}.
      <br/><br/>

      <#if accessType == 2>
           Note that access to this URL is restricted to the recipient at the email address: <strong>${ticket.getRecipient()}</strong>
      <#elseif accessType == 3>
           Access to this URL is open to anybody who has obtained the permission of ${user.getFullName()}, no registration is required.
      <#elseif accessType == 1>
           Access to this URL is open to anybody who has obtained the permission of ${user.getFullName()}, however online registration at ${institution_name} is required.
      </#if>
      <br/><br/>

      <#if expiry != "-1">
          The document is accessible via the above URL until: ${formatter.formatDate("${expiry}")}
      </#if>
      </div>

      <br/><br/>
      <div class="section">Where can I find more information?</div>
      <div class="para">Log on to the secure document verification website at ${institution_name}. The URL is: <a href="${verifier_webroot}">${verifier_webroot}</a></div>

      <br/><br/>            
      <div id="pagefooter">Powered by <a href="http://www.digitary.net">Digitary&reg;</a></div>
   </body>
</html>


