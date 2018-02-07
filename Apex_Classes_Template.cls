public without sharing class Apex_Classes_Template {
  public CUSTOM_OBJECT_API_NAME refObject {get; set;}
  public List<String> fieldNames {get; set;}
  public Boolean success {get; set;}

  public Apex_Classes_Template () {
    refObject = new CUSTOM_OBJECT_API_NAME();
    fieldNames = new List<String>{
      '---',
      'h:Company Contact Information',
      'Company_Name__c',
      'Company_Website__c',
      'Company_Contact_s_Name_Title__c',
      'Company_Contact_s_Phone__c',
      'Company_Contact_s_Email__c',

      '---',
      'h:Company Address',
      'Company_Address_Line_1__c',
      'Company_Address_Line_2__c',
      'City__c',
      'State__c',
      'Zip_Code__c',

      '---',
      'h:Referral Partner\'s Contact Information',
      'p:All requests for small business assistant services must come from referrals from partners including; incubators, SBDC, PTAC offices, ITCs, University of Illinois Extension Offices, or higher education entrepreneurial programs.',
      'Referring_Partner_s_Name_Organization__c',
      'Referring_Partner_s_Phone__c',
      'Referring_Partner_s_Email__c',

      '---',
      'h:Business Description',
      'Business_Description__c',
      'Business_Plan__c',
      'Business_Market__c',
      'Current_Status__c',
      'Entrepreneurial_Team__c',
      'Product_Development_Status__c',
      'Intellectual_Property__c',
      'Intellectual_Property_Explain__c',
      'College_Relationship__c',
      'College_Relationship_Explain__c',
      'Outside_Funding__c',
      'OutSide_Funding_Explain__c',
      'Assistance__c',
      'Assistance_Explain__c',
      'Project_Description__c',
      'Effectiveless__c',
      'Deadline__c'

      '---',
      'Receipt_Email__c'
    };
    success = false;
  }

  public PageReference createObject () {
    try {
      insert refObject;
      success = true;
    } catch (Exception ex) {
      ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, ex.getMessage());
      ApexPages.addMessage(msg);
    }
    return null;
  }

  public CUSTOM_OBJECT_API_NAME getObject (String id) {
    String soql = 'Select id ';
    for(String fieldName : fieldNames){
      soql = soql + ', ' + fieldName;
    }
    soql = soql + ' From CUSTOM_OBJECT_API_NAME where id = :id';
    return (CUSTOM_OBJECT_API_NAME)Database.Query(soql);
  }
}