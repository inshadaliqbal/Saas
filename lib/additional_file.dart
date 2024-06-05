class AdditionalFiles {
  List mainIndustryList = [
    MainIndustries(name: 'Fitness'),
    MainIndustries(name: 'Medical'),
    MainIndustries(name: 'Real Estate'),
    MainIndustries(name: 'Restaurant & Catering'),
    MainIndustries(name: 'Automotive'),
    MainIndustries(name: 'Dealership'),
    MainIndustries(name: 'Trucking'),
    MainIndustries(name: 'Hair Salon'),
    MainIndustries(name: 'Lawyer'),
    MainIndustries(name: 'Photography'),
    MainIndustries(name: 'Transportation'),
    MainIndustries(name: 'Electrician'),
    MainIndustries(name: 'Landscaping'),
    MainIndustries(name: 'eCommerce'),
    MainIndustries(name: 'Musician'),
    MainIndustries(name: 'Insurance'),
    MainIndustries(name: 'Handy Man Servive'),
    MainIndustries(name: 'Accountant'),
    MainIndustries(name: 'Cannabis'),
    MainIndustries(name: 'Wholesaler'),
    MainIndustries(name: 'Barber'),
    MainIndustries(name: 'Spa Business'),
    MainIndustries(name: 'Therapist'),
    MainIndustries(name: 'Credit Repair Company'),
    MainIndustries(name: 'Wedding Planner'),
    MainIndustries(name: 'Construction'),
  ];

  List industryServiceList = [
    IndustryService(name: 'Business Entity'),
    IndustryService(name: 'EIN Number'),
    IndustryService(name: 'Business License'),
    IndustryService(name: 'Virtual Address'),
    IndustryService(name: 'Business Bank AC'),
    IndustryService(name: 'Duns Number'),
    IndustryService(name: 'Website Creation'),
    IndustryService(name: 'Fax Number'),
    IndustryService(name: 'Toll Free Number'),
    IndustryService(name: 'Domain'),
    IndustryService(name: 'Merchant Account'),
    IndustryService(name: 'Professional Email'),
    IndustryService(name: 'Check Good Standing'),
    IndustryService(name: 'Bring Back Your Business'),
  ];
}

class MainIndustries {
  String? name;
  String? imagePath;
  MainIndustries({this.name, this.imagePath});
}

class IndustryService {
  String? name;
  String? imagePath;

  IndustryService({this.name, this.imagePath});
}
