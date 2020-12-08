['user', 'admin', 'super_admin'].each do |role|
  Role.create(name: role)
  puts "Role #{role}"
end
# User.create(role_id: 2, email: "admin@gmail.com", password: "123456", password_confirmation: "123456")

["SSC", "HSC", "Graduation", "Post Graduation", "Engineering", "Professional", "Under Graduate", "Doctorate", "Other"].each do |hq|
  HighestQualification.create(name: hq)
  puts "HighestQualification #{hq}"
end


["SSC", "HSC", "BCA", "MCA", "BSC", "MSC", "BE", "BCCA", "MCS", "BBA", "Other"].each do |hq|
  Qualification.create(name: hq)
  puts "Qualification #{hq}"
end

20.times do |dep|
  DependentNumber.create(name: dep)
  puts "DependentNumber #{dep}"
end

["Partnership Firm",
  "Private Limited Company",
  "Proprietoship Firm",
  "Public Limited Company"].each do |ct|
  CompanyType.create(name: ct)
  puts "CompanyType #{ct}"
end

["Architech", "Astrologer", "Autospare Dealers", "Builders and Developers", "Builders and Material Supliers", 
  "Cabel and TV Operators",
  "Chartered Accountants",
  "Chit Fund Operators/ SE Operating Finance Business",
  "Commission Agent",
  "Consultant Operating From Residence",
  "Contractors(All Types)",
  "Doctor",
  "DSA",
  "Film industry related people", "Garage Owner", "Inssurance Agent", "Labour Contractors", 
  "Manpower Consultants", "Manufacturing", "Massage Parlours/ Beauty Parlours", "MBBS Doctor", "MD/MS/MDS Doctor", 
  "Motor Training School", "Owner of private security services agent", "Petrol Pump Owner", "Retailer Services",
  "Small non branded courior Company", "Standalone STD/Xerox booth owners", "Trading", 
  "Young Inssurance Agent < 30 Years", "Other"].each do |ct|
  BusinessNature.create(name: ct)
  puts "BusinessNature #{ct}"
end

["Central Govt.",
  "Education Institute",
  "Partnership Firm",
  "Private Limited Company",
  "Proprietoship Firm",
  "Public Limited Company", 
  "Public Sector Undertaking",
  "Society",
  "State Govt.",
  "Trust",
  "Other"].each do |ct|
  IndustryType.create(name: ct)
  puts "IndustryType #{ct}"
end

["Rented", "Self-Owned", "Famaly-Owned", "Paying Guest", "Hotel", "Company Provided", "Other"].each do |ba|
  ResidenceType.create(name: ba)
  puts "ResidenceType #{ba}"
end

["Debt Consolidation", "Holidays", "Home Improvements", "Medical Emergency", "Wedding", "Education", "Business Expansion", "Other"].each do |ba|
  LoanPurpose.create(name: ba)
  puts "LoanPurpose #{ba}"
end

["0 to 5 lack", "5 lack to 30 lack", "30 lack to 50 lack", "50 lack to 80 lack", "80 lack to 1 cr", "Other"].each do |ba|
  HomeLoanAmount.create(name: ba)
  puts "HomeLoanAmount #{ba}"
end

["0 to 1 yr.", "1 yr. to 5 yrs.", "5 yrs. to 10yrs.", "10 yrs. to 50 yrs.", "Other"].each do |ba|
  BusinessYear.create(name: ba)
  puts "BusinessYear #{ba}"
end

["Permanent or fixed-term employees", "Casual employees", "Apprentices or trainees – employees", "Employment agency staff – also called labour hire", "Contractors and sub-contractors – hired staff", "Other"].each do |et|
  BusinessEmploymentType.create(name: et)
  puts "BusinessEmploymentType #{et}"
end

["Salaried", "Self Employed", "Professional"].each do |et|
  EmploymentType.create(name: et)
  puts "EmploymentType #{et}"
end

["Upto 5 lakh",
  "5 lakh to 10 lakh",
  "10 lakh to 20 lakh",
  "20 lakh to 30 lakh",
  "30 lakh to 50 lakh",
  "50 lakh to 75 lakh",
  "75 lakh to 1 crore",
  "Above 1 crore"].each do |at|
  AnnualTurnover.create(name: at)
  puts "AnnualTurnover #{at}"
end

{"Doctor": ["MBBS", "MD", "MS", "DM", "MCH", "DNB", "BDS", "MDS", "BHMS", "BAMS", "BUMS", "Other"],
 "Chartered Accountant(CA)": ["0 - 1year", "1 - 2years", "2 - 3years", "3 - 5years", "5years+"],
 "Architechure": ["Bacholor of Architechure", "Master of Architechure"],
 "Company Secretary(CS)": ["CS(Company Secretary)"],
 "Cost Accountant(ICWA)": [],
 "Consultant": [],
 "Engineer": []}.each do |key, val|
  profession = Profession.create(name: key.to_s)
  puts "Profession #{profession.id}"
  val.each do |degree|
    deg = Degree.new(profession_id: profession.id, name: degree)
    deg.save
    puts "Degree #{deg.id}"
  end
end

["TCS", "Tech Mahindra", "Infosys", "Other"].each do |com|
  Company.create(name: com)
  puts "Company #{com}"
end

["Residence","Office", "Permanent", "Other"].each do |ma|
  MailingAddress.create(name: ma)
  puts "MailingAddress #{ma}"
end

(1..100).each {|t| 
  StayCitySinceYear.create(name: t)
  puts "StayCitySinceYear #{t}"
}

(1..100).each {|t| 
  StayResidenceSinceYear.create(name: t)
  puts "StayResidenceSinceYear #{t}"
}

["Allahabad Bank",
"Andhra Bank",
"Axis Bank",
"Bank of Bahrain and Kuwait",
"Bank of Baroda - Corporate Banking",
"Bank of Baroda - Retail Banking",
"Bank of India",
"Bank of Maharashtra",
"Canara Bank",
"Central Bank of India",
"City Union Bank",
"Corporation Bank",
"Deutsche Bank",
"Development Credit Bank",
"Dhanlaxmi Bank",
"Federal Bank",
"ICICI Bank",
"IDBI Bank",
"Indian Bank",
"Indian Overseas Bank",
"IndusInd Bank",
"ING Vysya Bank",
"Jammu and Kashmir Bank",
"Karnataka Bank Ltd",
"Karur Vysya Bank",
"Kotak Mahindra Bank",
"Laxmi Vilas Bank",
"Oriental Bank of Commerce",
"Punjab National Bank - Corporate Banking",
"Punjab National Bank - Retail Banking",
"Punjab & Sind Bank",
"Shamrao Vitthal Co-operative Bank",
"South Indian Bank",
"State Bank of Bikaner & Jaipur",
"State Bank of Hyderabad",
"State Bank of India",
"State Bank of Mysore",
"State Bank of PatialSouth Indian Banka",
"State Bank of Travancore",
"Syndicate Bank",
"TamilnadSouth Indian Bank Mercantile Bank Ltd.",
"UCO Bank",
"Union Bank of India",
"United Bank of India",
"Vijaya Bank",
"Yes Bank Ltd",
"Bandhan Bank",
"Catholic Syrian Bank",
"DCB Bank",
"Dhanlaxmi Bank",
"HDFC Bank",
"IDFC First Bank",
"Jammu & Kashmir Bank",
"Kotak Mahindra Bank",
"Lakshmi Vilas Bank",
"Nainital Bank",
"RBL Bank",
"South Indian Bank",
"Tamilnad Mercantile Bank Limited",
"Other"].each do |ba|
  Bank.create(name: ba)
  puts "Bank #{ba}"
end


["12 months", "24 months", "36 months", "48 months", "60 months"].each do |ten|
  Tenure.create(name: ten)
  puts "Tenure #{ten}"
end

(1..30).map{|rr|  
  HomeLoanTenure.create(name: "#{rr} yr")
  puts "HomeLoanTenure #{rr} yr"
}

["3M INDIA LIMITED",
"AIRPORTS AUTHORITY OF INDIA",
"ABB LIMITED",
"ACC LIMITED",
"AIA ENGINEERING LIMITED",
"A R S S INFRASTRUCTURE PROJECTS LIMITED",
"AARTI INDUSTRIES LIMITED",
"ABBOT INDIA LIMITED",
"ACCENTURE SERVICES PRIVATE LIMITED",
"ADANI ENTERPRISES LIMITED",
"ADANI POWER LIMITED",
"ADANI WILMAR LIMITED",
"ADHUNIL METALICS LIMITED",
"ADITYA BIRLA NUVO LIMITED",
"AHLUWALIA CONTRACTS INDIA LIMITED",
"ALFA LAVAL INDIA LIMITED",
"ALLCARGO LOGISTICS LIMITED",
"ALSTOM ENGINEERING LIMITED",
"AMARA RAJA BATTERIES LIMITED",
"AMBUJA CEMENTS LIMITED",
"ANDHRA PRADESH POWER GENERATION CORPN. LIMITED",
"APAR INDUSTRIES LIMITED",
"APOLLO HOSPITALS",
"APOLLO TYRES",
"ARICENT TECHNOLOGIES HOLDINGS LIMITED",
"ARVIND MILL LIMITED",
"ASAHI INDIA GLASS LIMITED",
"ASHOK LEYLAND LIMITED",
"ASHOKA BUILDCON LIMITED",
"ASIAN PAINTS INDIA LIMITED",
"ASIAN STAR",
"ATLAS COPCO INDIA LIMITED",
"ATUL LIMITED",
"AUROBINDO PHARMA",
"AUTOMOTIVE AXLES LIMITED",
"AXIS BANK"].each do |em|
  Employer.create(name: em)
  puts "Employer #{em}"
end


[{ hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
 { fullerton_india: { name: "Fullerton India", roi: 25, processing_fee: 2, bank_image: "bank_images/fllutoran.png"}},
 { idfc_first_bank: { name: "IDFC First Bank", roi: 14, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 12, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { axis_bank: { name: "Axis Bank", roi: 13, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 { icici_bank: { name: "ICICI Bank", roi: 13, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { tata_capital: { name: "TATA capital", roi: 15, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
 { yes_bank: { name: "YES Bank", roi: 12, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 17, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
 { indusind_bank: { name: "IndusInd Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/IndusInd-bank.png"}},
 { aditya_birla: { name: "Aditya Birla", roi: 7.5, processing_fee: 2, bank_image: "bank_images/aditya-birla.png"}},
 { kotak_bank: { name: "Kotak Mahindra Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/kotak-bank.png"}}
].each do |k|
   k = k.flatten
   plb = PersonalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
   plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
   plb.save
   plbi = PersonalLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], personal_loan_bank_id: plb.id)
   plbi.save
   plbi = TransferPersonalLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], personal_loan_bank_id: plb.id)
   plbi.save
   puts "PersonalLoanBank #{plb}"
end


[{ hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
 { fullerton_india: { name: "Fullerton India", roi: 36, processing_fee: 2, bank_image: "bank_images/fllutoran.png"}},
 { idfc_first_bank: { name: "IDFC First Bank", roi: 17, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 16, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { axis_bank: { name: "Axis Bank", roi: 17.5, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 { icici_bank: { name: "ICICI Bank", roi: 15.5, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { tata_capital: { name: "TATA capital", roi: 14.5, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
 { yes_bank: { name: "YES Bank", roi: 18, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 22, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
 { indusind_bank: { name: "IndusInd Bank", roi: 16, processing_fee: 2, bank_image: "bank_images/IndusInd-bank.png"}},
 { neogrowth_finance: { name: "Neogrowth finance", roi: 16, processing_fee: 2, bank_image: "bank_images/neogrowth-finance.png"}},
 { aditya_birla: { name: "Aditya Birla", roi: 7.5, processing_fee: 2, bank_image: "bank_images/aditya-birla.png"}},
 { kotak_bank: { name: "Kotak Mahindra Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/kotak-bank.png"}},
 { au_small_bank: { name: "AU Small Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/au-small-bank.png"}},
 { rbl_bank: { name: "RBL Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/rbl-bank.png"}},
].each do |k|
   k = k.flatten
   blb = BusinessLoanBank.new(name: k[1][:name], slug: k[0].to_s)
   blb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
   blb.save
   blbi = BusinessLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], business_loan_bank_id: blb.id)
   blbi.save
   puts "BusinessLoanBank #{blb}"
end

[{ idfc_first_bank: { name: "IDFC First Bank", roi: 11, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 10.85, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { axis_bank: { name: "Axis Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 { icici_bank: { name: "ICICI Bank", roi: 14.50, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { yes_bank: { name: "YES Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
 { tata_capital: { name: "TATA capital", roi: 15, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 14.50, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
].each do |k|
  k = k.flatten
  plb = ProfessionalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  plb.save
  _id = Profession.find_by(name: "Doctor")
  plbi = ProfessionalLoanBankInfo.new(profession_id: _id.id, roi: k[1][:roi], processing_fee: k[1][:processing_fee], professional_loan_bank_id: plb.id)
  plbi.save
  puts "ProfessionalLoanBank #{plb}"
end

[{ idfc_first_bank: { name: "IDFC First Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 14.75, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 15.75, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
].each do |k|
  k = k.flatten
  plb = ProfessionalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  plb.save
  _id = Profession.find_by(name: "Architechure")
  plbi = ProfessionalLoanBankInfo.new(profession_id: _id.id, roi: k[1][:roi], processing_fee: k[1][:processing_fee], professional_loan_bank_id: plb.id)
  plbi.save
  puts "ProfessionalLoanBank #{plb}"
end

[{ idfc_first_bank: { name: "IDFC First Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 14.75, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 15.75, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
].each do |k|
  k = k.flatten
  plb = ProfessionalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  plb.save
  _id = Profession.find_by(name: "Chartered Accountant(CA)")
  plbi = ProfessionalLoanBankInfo.new(profession_id: _id.id, roi: k[1][:roi], processing_fee: k[1][:processing_fee], professional_loan_bank_id: plb.id)
  plbi.save
  puts "ProfessionalLoanBank #{plb}"
end

[{ idfc_first_bank: { name: "IDFC First Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 14.75, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 15.75, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
].each do |k|
  k = k.flatten
  plb = ProfessionalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  plb.save
  _id = Profession.find_by(name: "Company Secretary(CS)")
  plbi = ProfessionalLoanBankInfo.new(profession_id: _id.id, roi: k[1][:roi], processing_fee: k[1][:processing_fee], professional_loan_bank_id: plb.id)
  plbi.save
  puts "ProfessionalLoanBank #{plb}"
end

[
 { hdfc_housing: { name: "HDFC Housing", roi: 6.95, processing_fee: 2, bank_image: "bank_images/hdfc-housing.png"}},
 { icici_housing: { name: "ICICI Housing", roi: 7, processing_fee: 2, bank_image: "bank_images/icici-housing.svg"}},
 { idfc_first_bank: { name: "IDFC First Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { kotak_bank: { name: "Kotak Mahindra Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/kotak-bank.png"}},
 # //{ idbi_bank: { name: "IDBI Bank", roi: 7.30, processing_fee: 2, bank_image: "bank_images/idbi-bank.png"}},
 # //{ indiabulls_bank: { name: "Indiabulls Bank", roi: 9.50, processing_fee: 2, bank_image: "bank_images/indiabulls.png"}},
 { hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 17, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
 { axis_bank: { name: "Axis Bank", roi: 7, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 # //{ lic_housing: { name: "LIC Housing", roi: 6.5, processing_fee: 2, bank_image: "bank_images/lic-housing.jpeg"}},
 { aadhar_housing: { name: "Aadhar Housing", roi: 12, processing_fee: 2, bank_image: "bank_images/aadhar-housing.png"}},
 # //{ aawas_housing: { name: "Aawas Housing", roi: 12, processing_fee: 2, bank_image: "bank_images/aawas-housing.png"}},
 # //{ equitas_bank: { name: "Equitas Bank", roi: 10, processing_fee: 2, bank_image: "bank_images/equitas-bank.jpeg"}},
 # //{ utkarsh_small_bank: { name: "Utkarsh Small Bank", roi: 8.5, processing_fee: 2, bank_image: "bank_images/utkarsh-small-bank.png"}},
 # //{ bankdhan_bank: { name: "Bankdhan Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/bankdhan-bank.png"}},
 # //{ au_small_bank: { name: "AU Small Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/au-small-bank.png"}},
 { pnb_housing_bank: { name: "PNB Housing finance LTD", roi: 7.5, processing_fee: 2, bank_image: "bank_images/pnb-housing.png"}},
 { aditya_birla: { name: "Aditya Birla", roi: 7.5, processing_fee: 2, bank_image: "bank_images/aditya-birla.png"}},
].each do |k|
  k = k.flatten
  hlb = HomeLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  hlb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  hlb.save
  hlbi = HomeLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], home_loan_bank_id: hlb.id)
  hlbi.save
  hlbi = TransferHomeLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], home_loan_bank_id: hlb.id)
  hlbi.save
  puts "HomeLoanBank #{hlb}"
end

[
 { hdfc_housing: { name: "HDFC Housing", roi: 6.95, processing_fee: 2, bank_image: "bank_images/hdfc-housing.png"}},
 { icici_housing: { name: "ICICI Housing", roi: 7, processing_fee: 2, bank_image: "bank_images/icici-housing.svg"}},
 { idfc_first_bank: { name: "IDFC First Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { kotak_bank: { name: "Kotak Mahindra Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/kotak-bank.png"}},
 { hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 17, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
 { axis_bank: { name: "Axis Bank", roi: 7, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 { aadhar_housing: { name: "Aadhar Housing", roi: 12, processing_fee: 2, bank_image: "bank_images/aadhar-housing.png"}},
 { pnb_housing_bank: { name: "PNB Housing finance LTD", roi: 7.5, processing_fee: 2, bank_image: "bank_images/pnb-housing.png"}},
 { aditya_birla: { name: "Aditya Birla", roi: 7.5, processing_fee: 2, bank_image: "bank_images/aditya-birla.png"}},
 { au_small_bank: { name: "AU Small Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/au-small-bank.png"}}, 
].each do |k|
  k = k.flatten
  lap = LoanAgainstPropertyBank.new(name: k[1][:name], slug: k[0].to_s)
  lap.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  lap.save
  lapi = LoanAgainstPropertyBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], loan_against_property_bank_id: lap.id)
  lapi.save
  puts "LoanAgainstPropertyBank #{lap}"
end

[
 { hdfc_bank: { name: "HDFC Bank", roi: 7.5, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { icici_bank: { name: "ICICI Bank", roi: 9.50, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { yes_bank: { name: "YES Bank", roi: 11.75, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
].each do |k|
  k = k.flatten
  nclb = NewCarLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  nclb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  nclb.save
  nclbi = NewCarLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], new_car_loan_bank_id: nclb.id)
  nclbi.save
  puts "NewCarLoanBank #{nclb}"
end

[
 { icici_bank: { name: "ICICI Bank", roi: 12.10, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { au_small_bank: { name: "AU Small Finance Bank", roi: 13.75, processing_fee: 2, bank_image: "bank_images/au-small-bank.png"}},
 { yes_bank: { name: "YES Bank", roi: 13.50, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
].each do |k|
  k = k.flatten
  uclb = UsedCarLoanBank.new(name: k[1][:name], slug: k[0].to_s)
  uclb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  uclb.save
  uclbi = UsedCarLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], used_car_loan_bank_id: uclb.id)
  uclbi.save
  puts "UsedCarLoanBank #{uclb}"
end

[{"MARUTI"=> {models:["Eeco", "Celerio", "Celerio X", "Ignis", "Swift", "Ciaz", "Wagon R", "Baleno", "Ertiga", "S-Presso", "Vitara Brezza", "S-Cross", "Alto", "Dzire","XL6"]}},
{"HYUNDAI"=> {models: ["Kona Electric", "Grand i10", "Santro", "Venue", "Aura", "Creta", "Tucson", "Elantra", "Grand i10 Nios", "Verna","i20"]}},
{"HONDA"=> {models: ["Amaze", "CR-V", "WR-V", "All New City", "Civic", "Jazz", "BRIO", "HR-V", "HONDA CITY", "HONDA CITY4TH GENERATION"]}},
{"TATA"=> {models: ["Nexon EV" "Altroz", "Tiago", "Tigor", "Harrier", "Nexon", "Tata Yodha Pickup", "Tata Tigor EV"]}},
{"MAHINDRA"=> {models: ["e2o Plus", "XUV500", "XUV300", "Alturas G4", "Bolero", "Scorpio", "Mahindra Thar", "BoleroMahindra", "Mahindra Marazzo", "Mahindra KUV100 NXT", "Mahindra TUV 300", "Mahindra TUV 300 Plus", "Mahindra XUV300 Turbo Sportz"]}},
{"RENAULT"=> {models: ["Kwid", "Renault Triber", "Renault Duster"]}},
{"FORD"=> {models: ["Ford EcoSport", "Ford Endeavour", "Ford Figo", "Ford Freestyle", "Ford Aspire", "Ford EcoSport 2020"]}},
{"NISSAN"=> {models: ["Nissan Magnite", "Nissan Kicks", "Nissan GT-R", "Nissan Terra", "Nissan Leaf", "Nissan Note e Power", "Nissan X-Trail", "Nissan Sunny 2020"]}},
{"DATSUN"=> {models: ["Datsun redi-GO", "Datsun GO", "Datsun GO Plus"]}},
{"TOYOTA"=> {models: ["Toyota Innova Crysta", "Toyota Fortuner", "Toyota Glanza", "Toyota Yaris", "Toyota Fortuner 2021"]}},
{"MG"=> {models: ["MG Hector", "MG Gloster", "MG ZS EV", "MG Hector Plus"]}},
{"KIA"=> {models: ["Kia Carnival", "Kia Seltos", "Kia Sonet"]}},
{"VOLKSWAGEN"=> {models: ["Volkswagen Polo", "Volkswagen Vento", "Volkswagen T-Roc", "Volkswagen Tiguan Allspace"]}},
{"SKODA"=> {models: ["Skoda Octavia", "New Skoda Superb"]}},
{"JEEP"=> {models: ["Jeep Compass Trailhawk","Jeep Wrangler", "Jeep Compass"]}},
{"ISUZU"=> {models: []}},
{"AUDI"=> {models: ["Audi A6", "Audi Q2", "Audi Q8", "Audi A8", "Audi RS7", "Audi RS Q8"]}},
{"MERCEDES-BENZ"=> {models: ["Mercedes-Benz C-Class", "Mercedes-Benz E-Class"] }},
{"BMW"=> {models: ["BMW X1", "BMW X5", "BMW 3 Series", "BMW X3", "BMW X7", "BMW 5 Series", "BMW 2 Series", "BMW Z4", "BMW X6", "BMW 7 Series", "BMW M5", "BMW X4", "BMW 6 Series", "BMW 8 Series", "BMW M2", "BMW 3 Series GT", "BMW X3 M", "BMW X5 M"]}},
{"JAGUAR"=> {models: []}},
{"VOLO"=> {models: []}},
{"LEXUS"=>{models: []}},
{"LAND ROVER"=>{models: []}},
{"PORSCHE"=>{models: []}},
{"FERRARI"=>{models: []}},
{"ROLLS-ROYCE"=>{models: []}},
{"BENTLEY"=>{models: []}},
{"FORCE"=>{models: []}},
{"LAMBORGHINI"=>{models: []}},
{"MINI"=>{models: []}},
{"ASTON"=>{models: []}},
{"MASERATI"=>{models: []}}].each do |man|
  man_obj = man.flatten
  mn = CarManufacturer.new(name: man_obj[0], slug: man_obj[0].downcase)
  mn.save
  man_obj[1][:models].each do |mod|
    cm = CarModel.new(name: mod, slug: mod.downcase, car_manufacturer_id: mn.id)
    cm.save
  end
  puts "CarManufacturer #{mn}"
end


["Port Blair", "Addanki", "Adoni", "Agnigundala", "Akkampeta", "Allagadda", "Amalapuram", "Amaravati", "Ambajipeta", "Ambakapalle", "Ambativalasa", "Anamasamudrampeta", "Anantapur", "Anaparthy", "Angallu", "Annavaram", "Attili", "Bapatla", "Bhadrachalam", "Bhadravaram", "Bhimadolu", "Bhimavaram", "Brahmanagudem", "Chagallu", "Chandrala", "Chintalapeta", "Chintalapudi", "Chirala", "Chittavaram", "Chittoor", "Cumbum", "Dargamitta", "Darsi", "Dharmajigudem", "Dharmapuri", "Dharmavaram", "Dhone", "Eluru", "Enikepadu", "Ganapavaram", "Gannavaram", "Garividi", "Gollamudi", "Gollapudi", "Gopalapuram", "Gudipadu", "Gudivada", "Gudur", "Gunadala", "Guntakal", "Guntur", "Hindupur", "Hukumpeta", "Jaggayyapeta", "Jammalamadugu", "Kadapa", "Kadiri", "Kaikalur", "Kakinada", "Kandukur", "Kanigiri", "Kanuru", "Kavali", "Kodur", "Kovvur", "Kuppam", "Kurnool", "Lankam", "Machavaram", "Machilipatnam", "Madanapalle", "Madanapalli", "Malkapuram", "Mandapeta", "Mangalagiri", "Markapur", "Maruteru", "Medarametla", "Mummidivaram", "Nallajerla", "Nallamada", "Namburu", "Nandigama", "Nandyal", "Narasapuram", "Narasaraopet", "Narayanapuram", "Narsapuram", "Narsipatnam", "Nellimarla", "Nellore", "Nidadavole", "Nuzvid", "Ongole", "Palakollu", "Pedana", "Peddapalli", "Pithapuram", "Podili", "Poranki", "Proddatur", "Puttaparthi", "Rajahmundry", "Rajampeta", "Ramabhadrapuram", "Ramachandrapuram", "Ramapuram", "Rampachodavaram", "Ravulapalem", "Razole", "Renigunta", "Repalle", "Rompicherla", "Samalkot", "Singarayakonda", "Srikakulam", "Srikalahasti", "Tanuku", "Tekkali", "Thenali", "Tirumala - Tirupati", "Undi", "Velpuru", "Vijayawada", "Vinukonda", "Visakhapatnam", "Vizianagaram", "Vuyyuru", "Yanam", "Bomdila", "Itanagar", "Naharlagun", "Nirjuli", "Roing", "Abhayapuri", "Barpeta", "Bijni", "Biswanath Chariali", "Bokajan", "Bokakhat", "Bongaigaon", "Chabua", "Dhekiajuli", "Dhemaji", "Dhubri", "Dibrugarh", "Digboi", "Diphu", "Dispur", "Goalpara", "Gohpur", "Golaghat", "Guwahati", "Haflong", "Hailakandi", "Hojai", "Jagiroad", "Jakhalabandha", "Jorhat", "Karimganj", "Kokrajhar", "Makum", "Mangaldai", "Morigaon", "Nalbari", "Nazira", "North Lakhimpur", "Pandu", "Patharkandi", "Pathsala", "Rangia", "Rowta", "Sibsagar", "Silchar", "Simaluguri", "Sonari", "Sonitpur", "Tezpur", "Tihu", "Tinsukia", "Udalguri", "Ajhaur", "Akorha", "Amolwa", "Araria", "Arrah", "Aurangabad", "Babhnoul", "Bakhri Dua", "Bakhtiyarpur", "Balhampur", "Ballia", "Barari", "Bargaon", "Barhiya", "Begusarai", "Bettiah", "Bhagalpur", "Bhatta Bazar", "Bihar Sharif", "Bihariganj", "Bihta", "Bikramganj", "Buxar", "Chandparsa", "Chanpatia", "Chapra", "Chhapra", "Darbhanga", "Forbesganj", "Gaya", "Gopalganj", "Hajipur", "Harnaut", "Hisua", "Katihar", "Kesariya", "Khagaria", "Khaira Tola", "Kishanganj", "Kochas", "Lalganj", "Madhepura", "Madhubani", "Mahuwa", "Motihari", "Munger", "Muzaffarpur", "Narkatiaganj", "Nawada", "Patna", "Purnea", "Purnia", "Raghunandanpur", "Rajgir", "Ramnagar", "Raxaul", "Saharsa", "Samastipur", "Sarabe", "Sasaram", "Sheohar", "Sitamarhi", "Siwan", "Sonbarsa Raj", "Sukhpur", "Supaul", "Tajnipur", "Tarwara", "Badheri", "Chandigarh", "Ambikapur", "Arjuni", "Bacheli", "Bahtarai", "Balod", "Bemetara", "Bhatapara", "Bhilai", "Bilaspur", "Boriguma", "Dhamtari", "Durg", "Gharghoda", "Gidam", "Jagdalpur", "Kanker", "Kawardha", "Khamtarai", "Kirandul", "Korba", "Kunkuri", "Mahasamund", "Manendragarh", "Mopka", "Naya Raipur", "Raigarh", "Raipur", "Sarangarh", "Surajpur", "Telipara", "Daman", "Diu", "Anand Parbat", "Badarpur", "Burari", "Civil Lines", "Connaught Place", "Delhi", "Janakpuri", "Kair", "Mahipalpur", "Najafgarh", "Narela", "New Delhi", "Shahdara", "Silvassa", "Agonda", "Anjuna", "Assagao", "Bambolim", "Bardez", "Calangute", "Carambolim", "Carmona", "Chicalim", "Chinchinim", "Colva", "Cuncolim", "Curchorem", "Curtorim", "Davorlim", "Dona Paula", "Guirdolim", "Loutolim", "Madgaon", "Navelim", "Nuvem", "Old Goa", "Panjim", "Parra", "Ponda", "Saligao", "Sancoale", "Sanguem", "Usgao", "Vagator", "Varca", "Vasco da Gama", "Verna", "Adalaj", "Ahmedabad", "Alkapuri", "Ambheti", "Amrapur", "Amreli", "Amroli", "Anand", "Anjar", "Ankleshwar", "Bamroda", "Bardoli", "Bayad", "Bhanvad", "Bharuch", "Bhatha", "Bhavnagar", "Bhiloda", "Bhuj", "Bilimora", "Borsad", "Botad", "Chandkheda", "Charadva", "Chhapi", "Chikhli", "Dahegam", "Dakor", "Daxini Society", "Deesa", "Dela", "Dhansura", "Dharampur", "Dhari", "Dhoraji", "Dhrangadhra", "Dhrol", "Dudhathal", "Dwarka", "Gandevi", "Gandhidham", "Gandhinagar", "Godhra", "Gondal", "Halol", "Himatnagar", "Idar", "Jambusar", "Jamnagar", "Jasdan", "Jetpur", "Jhalod", "Junagadh", "Kadi", "Kalol", "Kamrej", "Kanodar", "Kapadvanj", "Karamsad", "Kathlal", "Kawant", "Khambhaliya", "Khambhat", "Kheda", "Kheralu", "Khergam", "Khodiyarnagar", "Kodinar", "Kosamba", "Latipur", "Limbdi", "Limkheda", "Madhapar", "Mahemdavad", "Mahesana", "Mahuva", "Manavadar", "Mandvi", "Mansa", "Memnagar", "Modasa", "Morvi", "Mundra", "Nadiad", "Naliya", "Nandasan", "Navsari", "Paddhari", "Palanpur", "Palitana", "Pardi", "Patan", "Patdi", "Petlad", "Porbandar", "Prantij", "Radhanpur", "Rajkot", "Ranavav", "Ranip", "Rapar", "Sagbara", "Sanand", "Savarkundla", "Sinor", "Songadh", "Surat", "Surendranagar", "Talaja", "Umreth", "Una", "Unjha", "Vadgam", "Vadodara", "Valsad", "Vapi", "Veraval", "Viramgam", "Virpur", "Visavadar", "Visnagar", "Vyara", "Waghai", "Amb", "Arki", "Auli", "Baddi", "Baduhi", "Balh Churani", "Banala", "Banjar", "Bari", "Bhuntar", "Bilaspur", "Chamba", "Dagshai", "Daulatpur", "Dharamsala", "Garli", "Ghumarwin", "Hamirpur", "Jari", "Kangra", "Karsog", "Kasauli", "Kotla", "Manali", "Mandi", "Nadaun", "Nahan", "Nalagarh", "Narkanda", "Nurpur", "Palampur", "Paonta Sahib", "Rajgarh", "Rampur", "Rohru", "Shahpur", "Shamshi", "Shimla", "Solan", "Tanda", "Theog", "Una", "Adampur", "Ahirka", "Ahulana", "Ambala", "Asa Khera", "Babail", "Badhawar", "Bagthala", "Bahadurgarh", "Bahu Akbarpur", "Balachaur", "Ballabgarh", "Barwala", "Basana", "Bhiwani", "Bilaspur", "Charkhi Dadri", "Dabwali", "Dhanaura", "Dhareru", "Faridabad", "Fatehabad", "Ganaur", "Gharaunda", "Gohana", "Gurgaon", "Hansi", "Haryana", "Hisar", "Ismailabad", "Jagadhri", "Jhajjar", "Jind", "Jodhpur", "Kaithal", "Kalwan", "Karnal", "Khandsa", "Khirajpur", "Kosli", "Kurukshetra", "Ladwa", "Mahendragarh", "Mandi Dabwali", "Murthal", "Narnaul", "Narwana", "Nigdhu", "Nilokheri", "Nuh", "Palwal", "Panchkula", "Panipat", "Pataudi", "Pehowa", "Pundri", "Radaur", "Ratia", "Rewari", "Rohtak", "Sadhaura", "Safidon", "Sampla", "Sirsa", "Sohna", "Sonipat", "Taoru", "Tohana", "Yamunanagar", "Adardih", "Asansol", "Baidmara", "Bara Ghaghra", "Barharwa", "Bariatu", "Barughutu", "Bhurkunda", "Bokaro Steel City", "Chatra", "Deoghar", "Dhanbad", "Durgapur", "Giridih", "Godda", "Gua", "Gumia", "Hazaribagh", "Jamshedpur", "Khunti", "Kusunda", "Lohardaga", "Madhupur", "Medininagar", "Mesra", "Pakur", "Palamu", "Ramgarh", "Ranchi", "Sahibganj", "Torpa", "Anantnag", "Ban", "Banihal", "Doda", "Gandarbal", "Jammu", "Kathua", "Katra", "Kishtwar", "Kulgam", "Kupwāra", "Pulwama", "Samba", "Srinagar", "Talab Tillo", "Udhampur", "Agarkhed", "Ajjavara", "Alanahalli", "Amruthahalli", "Anegundi", "Angol", "Athani", "Bagalkot", "Balehonnur", "Bangarapet", "Barebettu", "Belaguru", "Belgaum", "Bellary", "Bengaluru", "Bhadravati", "Bhatkal", "Bhoj", "Bidar", "Bijapur", "Bittangala", "Bommanahalli", "Bommasandra", "Byahatti", "Chamrajnagar", "Channahalli", "Chikmagalūr", "Chinchali", "Chincholi", "Chintamani", "Chitradurga", "Dandeli", "Davangere", "Devadurga", "Dharwad", "Electronics City", "Gadag", "Gokak", "Gonikoppal", "Gulbarga", "Hangal", "Harihar", "Hassan", "Haveri", "Hirebennūr", "Honnali", "Hoodi", "Hoskote", "Hospet", "Hubli", "Hunsur", "Ilkal", "Karkala", "Karwar", "Kembhavi", "Kolar", "Konaje", "Koppa", "Koppal", "Krishnarajapuram", "Kudupu", "Kumta", "Kushalnagar", "Kutta", "Lokapur", "Madavara", "Maddur", "Madikeri", "Mahalingpur", "Mandya", "Mangalore", "Manipal", "Mudgal", "Mudhol", "Mulki", "Mundgod", "Mysore", "Old Hubli", "Puttur", "Raichur", "Ranibennur", "Sagar", "Savanur", "Shahabad", "Shimoga", "Shirali", "Shorapur", "Sidlaghatta", "Sirsi", "Somvarpet", "Sringeri", "Sullia", "Tekkatte", "Tiptur", "Tumkūr", "Udupi", "Yeshwanthpur", "Alappuzha", "Aluva", "Amayur", "Ambalavayal", "Amballur", "Anchal", "Aniyaram", "Aroor", "Attadappa", "Attingal", "Ayilakkad", "Ayur", "Bedradka", "Chayalode", "Chengannur", "Cherai", "Cherpulassery", "Cherthala", "Chirakkal", "Chiyyaram", "Edakkara", "Edappal", "Edavilangu", "Eranellur", "Ernakulam", "Ettumanoor", "Ferokh", "Haripad", "Harippad", "Idukki", "Irinjalakuda", "Iritty", "Kadannamanna", "Kakkanad", "Kalamasseri", "Kallambalam", "Kanhangad", "Kannur", "Kasaragod", "Kattanam", "Kavida", "Kayamkulam", "Kazhakuttam", "Kochi", "Kodungallur", "Kolathur", "Kolenchery", "Kollam", "Kommeri", "Kondotty", "Kotancheri", "Kothamangalam", "Kottakkal", "Kottarakara", "Kottayam", "Kottukal", "Kozhikode", "Kunnamkulam", "Mahe", "Makkaraparamba", "Mala", "Malappuram", "Manjeri", "Mankada", "Maradu", "Mattam", "Mattathur", "Mavelikara", "Mongam", "Mukkulam", "Mundamveli", "Munnar", "Muvattupuzha", "Nadapuram", "Nedumangad", "Nedumbassery", "Nedumkandam", "Nilambur", "Nileshwar", "Ochanthuruth", "Ochira", "Ottapalam", "Ottappalam", "Padanilam", "Palakkad", "Palazhi", "Panamaram", "Panampilly Nagar", "Panangattur", "Parappanangadi", "Pathanamthitta", "Pattambi", "Payyanur", "Perintalmanna", "Perumbavoor", "Ponnani", "Punalur", "Shoranur", "Taliparamba", "Tellicherry", "Thodupuzha", "Thrissur", "Tirur", "Tirurangadi", "Tiruvalla", "Trivandrum", "Valluvambram", "Varkala", "Vayalar", "Vazhuthacaud", "Venmony", "Vyttila", "Kargil", "Kalpeni", "Kavaratti", "Ahmednagar", "Airoli", "Akola", "Akot", "Akurdi", "Alibag", "Amalner", "Ambajogai", "Ambarnath", "Amravati", "Andheri", "Andheri East", "Arjuni", "Aurangabad", "Badlapur", "Ballarpur", "Bamni", "Baramati", "Beed", "Bhamragarh", "Bhandara", "Bharam", "Bhasgaon", "Bhiwandi", "Bhokardan", "Bhose", "Boisar", "Bokadvira", "Borgaon", "Borivali West", "Bramhapuri", "Buldana", "Chakan", "Chalisgaon", "Chandgad", "Chandol", "Chandori", "Chandrapur", "Chikhli", "Chiplun", "Chopda", "Dahanu", "Dahegaon", "Danda", "Dapoli", "Daund", "Desaiganj", "Dharavi", "Dhule", "Diva", "Dombivali", "Dondaicha", "Gadhinglaj", "Gargoti", "Ghansoli", "Gogaon", "Gondia", "Goregaon", "Goregaon East", "Hinganghat", "Hinjewadi", "Ichalkaranji", "Igatpuri", "Indapur", "Islampur", "Jalgaon", "Jalna", "Janephal", "Jath", "Jejuri", "Kalamboli", "Kalamnuri", "Kalyan", "Kanadi", "Kanhan", "Karad", "Kargani", "Karjat", "Karmala", "Khadki", "Khamgaon", "Khandala", "Khapri", "Kharghar", "Khed", "Khopoli", "Kolhapur", "Kopargaon", "Kotul", "Kudal", "Kurla", "Lasalgaon", "Latur", "Lonand", "Lonar", "Lonavla", "Mahabaleshwar", "Mahad", "Mahim", "Malegaon", "Malvan", "Manchar", "Mangaon", "Manor", "Mhasla", "Mira Road", "Miraj", "Morshi", "Mulund East", "Mulund West", "Mumbai", "Murud", "Nagpur", "Nanded", "Nandurbar", "Narayangaon", "Nashik", "Nasrapur", "Navapur", "Neral", "Nilanga", "Osmanabad", "Pachora", "Palghar", "Pandharpur", "Panvel", "Parbhani", "Parli", "Parola", "Partur", "Patan", "Paud", "Pen", "Phaltan", "Pimpri-Chinchwad", "Pinjar", "Prabhadevi", "Pulgaon", "Pune", "Purna", "Rahata", "Rahimatpur", "Rahuri", "Ramtek", "Ratnagiri", "Renapur", "Risod", "Roha", "Sakur", "Sangamner", "Sangli", "Saphale", "Satara", "Savda", "Sawantwadi", "Shahada", "Shahapur", "Shevgaon", "Shirdi", "Shirol", "Shirwal", "Shrigonda", "Sillod", "Sindewahi", "Sindkheda", "Sinnar", "Sion", "Sironcha", "Solapur", "Talegaon Dabhade", "Thane", "Ulhasnagar", "Umbraj", "Umred", "Uran", "Vada", "Varangaon", "Vasai", "Virar", "Vita", "Wada", "Wadwani", "Wardha", "Washim", "Worli", "Yavatmal", "Yeola", "Yerwada", "Jowai", "Laitumkhrah", "Shillong", "Churachandpur", "Imphal", "Kakching", "Kanglatongbi", "Thoubal", "Tulihal", "Adhartal", "Agar", "Alot", "Ambachandan", "Ambah", "Anuppur", "Ashta", "Awan", "Baihar", "Balaghat", "Barwani", "Basoda", "Beohari", "Berasia", "Betul", "Bhopal", "Biaora", "Burhanpur", "Chhatarpur", "Chhindwara", "Dabra", "Damoh", "Datia", "Dewas", "Dhar", "Gadarwara", "Guna", "Gwalior", "Hoshangabad", "Indore", "Jabalpur", "Jamai", "Jaora", "Jawad", "Jhabua", "Karadiya", "Kareli", "Khargone", "Khurai", "Kolaras", "Kothri", "Kukshi", "Lakhnadon", "Maheshwar", "Mandla", "Mandsaur", "Mhow", "Morena", "Mundi", "Murwara", "Nagda", "Narsinghpur", "Nepanagar", "Pithampur", "Raipur", "Raisen", "Rajgarh", "Ratlam", "Rewa", "Sagar", "Saleha", "Satna", "Sehore", "Sendhwa", "Seoni", "Shahdol", "Sihora", "Singrauli", "Sitapur", "Sohagpur", "Susner", "Suwasra", "Timarni", "Ujjain", "Vidisha", "Zirapur", "Aizawl", "Lunglei", "Mamit", "Dimapur", "Kohima", "Mokokchung", "Wokha", "Angul", "Arabaka", "Baincha", "Balanda", "Balangir", "Balasore", "Balisahi", "Balugaon", "Barbil", "Bargarh", "Baripada", "Belpahar", "Betnoti", "Bhanjanagar", "Bhawanipatna", "Bhubaneswar", "Birmitrapur", "Brahmapur", "Buguda", "Burla", "Chandbali", "Chatrapur", "Cuttack", "Deogarh", "Dhenkanal", "Gaisilat", "Ganjam", "Hirakud", "Jaipatna", "Jajpur", "Jaraka", "Jeypore", "Jharsuguda", "Kalahandi", "Kantapal", "Karanjia", "Khandagiri", "Koraput", "Korukonda", "Kuchinda", "Nuapada", "Paradip", "Puri", "Rajgangpur", "Raurkela", "Rayagada", "Sambalpur", "Sonepur", "Sunabeda", "Sundargarh", "Talcher", "Turekela", "Abohar", "Adampur", "Adamwal", "Akhara", "Aklia", "Alawalpur", "Aliwal", "Allachaur", "Allowal", "Amloh", "Amritsar", "Ayali Kalan", "Badian", "Bagha Purana", "Bahadurpur", "Baharwal", "Ballamgarh", "Banga", "Banur", "Barnala", "Basarke", "Batala", "Bathinda", "Beas", "Bhagwanpura", "Bhucho Mandi", "Bilga", "Boparai", "Dad", "Dalla", "Dasuya", "Dhaipai", "Dhuri", "Dinanagar", "Faridkot", "Fatehabad", "Fatehgarh Churian", "Firozpur", "Garhdiwala", "Garhshankar", "Goraya", "Gurdaspur", "Hajipur", "Harchowal", "Hoshiarpur", "Hoshiarpur Kalota", "Jagraon", "Jalalabad", "Jalandhar", "Jhingran", "Kapurthala Town", "Kartarpur", "Khanna", "Kharar", "Kot Kapura", "Kotkapura", "Kumbh", "Kumbra", "Kurali", "Ludhiana", "Machhiwara", "Makhu", "Maler Kotla", "Manauli", "Mansa", "Maur", "Moga", "Mohali", "Mukerian", "Nabha", "Nakodar", "Nangal", "Naraingarh", "Nathana", "Nurmahal", "Pathankot", "Patial", "Patiala", "Patran", "Patti", "Phagwara", "Qadian", "Raikot", "Rajpura", "Rampura Phul", "Ropar", "Rupnagar", "Samana", "Sangat Kalan", "Sangrur", "Sardulgarh", "Sirhind", "Sunam", "Talwara", "Tarn Taran", "Zira", "Karaikal", "Puducherry", "Abu Road", "Agolai", "Ajgara", "Ajmer", "Akhepura", "Alipura", "Alwar", "Amarsar", "Amarwasi", "Amet", "Anupgarh", "Asalwas", "Bagawas", "Balicha", "Ballupura", "Balotra", "Bandikui", "Bani Park", "Banswara", "Baran", "Bari", "Barmer", "Bayana", "Beawar", "Begun", "Behror", "Bharatpur", "Bhilwara", "Bhinmal", "Bhiwadi", "Bikaner", "Borawar", "Bundi", "Chandangaon", "Chhoti Sadri", "Chittaurgarh", "Chomu", "Churu", "Dariba", "Dausa", "Degana", "Didwana", "Dungarpur", "Falna", "Gajsinghpur", "Goa", "Hanumangarh", "Harsora", "Hindaun", "Jaipur", "Jaisalmer", "Jaitaran", "Jhalawar", "Jodhpur", "Kapasan", "Karauli", "Khanpur", "Kishangarh", "Kota", "Kotkasim", "Kotputli", "Kuchaman", "Mansarovar", "Nadbai", "Nagaur", "Nasirabad", "Nathdwara", "Nawalgarh", "Neem ka Thana", "Neemrana", "Nimbahera", "Niwai", "Nohar", "Pali", "Phalodi", "Phalsund", "Pilani", "Pindwara", "Pisangan", "Pratapgarh", "Pushkar", "Raisinghnagar", "Rajgarh", "Rajsamand", "Ratangarh", "Rawatbhata", "Sadri", "Sakroda", "Sangaria", "Sapotra", "Sardarshahr", "Sarola Kalan", "Sawai Madhopur", "Shahjahanpur", "Sheoganj", "Sikar", "Sirohi", "Sojat", "Sujangarh", "Surajgarh", "Suratgarh", "Tabiji", "Talwas", "Todabhim", "Tonk", "Udaipur", "Udaipurwati", "Vaishali Nagar", "Weir", "Gangtok", "Jorethang", "Namchi", "Rangpo", "Singtam", "Soreng", "Abbaipalem", "Abbenda", "Abids", "Adilabad", "Adivarampet", "Almasguda", "Alwal", "Amaravaram", "Amberpet", "Arepalli", "Asifabad", "Attapur", "Ballepalli", "Bangarigadda", "Banjara Hills", "Bhongir", "Bhupalpally", "Bichkunda", "Bodhan", "Bodupal", "Champapet", "Chandanagar", "Dasturabad", "Dhanwada", "Elkalapalli", "Erragadda", "Gadwal", "Ghatkesar", "Hanamkonda", "Husnabad", "Huzurabad", "Hyderabad", "Ibrahimpatnam", "Jadcherla", "Jagitial", "Jagtial", "Jangaon", "Jinnaram", "Jogipet", "Jubilee Hills", "Kanaiguda", "Karimnagar", "Khammam", "Kismatpur", "Kottagudem", "Madhapur", "Mahbubnagar", "Malakpet", "Malkajgiri", "Mallampet", "Mancherial", "Manikonda", "Manuguru", "Medak", "Medchal", "Mehdipatnam", "Nagpur", "Nalgonda", "Narsapur", "Nirmal", "Nizamabad", "Palwancha", "Patancheru", "Prakashamnagar", "Ramagundam", "Ramannapet", "Ramayampet", "Ramchandrapuram", "Rudraram", "Sathupalli", "Secunderabad", "Shadnagar", "Shamirpet", "Siddipet", "Somajiguda", "Subedari", "Tarnaka", "Tolichowki", "Vikarabad", "Warangal", "Yellandu", "Zahirabad", "Adirampattinam", "Aliyanilai", "Ambattur", "Ambur", "Andarkuppam", "Anjugramam", "Anna Nagar", "Annamalainagar", "Anthiyur", "Arakkonam", "Aranarai", "Arani", "Arcot", "Ariyalur", "Ariyanendal", "Arni", "Arumanai", "Aruvankadu", "Attur", "Auroville", "Avadi", "Avinashi", "Ayyavadi", "Bargur", "Bommidi", "Chengalpattu", "Chennai", "Cheyyar", "Chidambaram", "Chinna Salem", "Chinnalapatti", "Choolai", "Coimbatore", "Colachel", "Coonoor", "Cuddalore", "Dharapuram", "Dharmapuri", "Dindigul", "Egattur", "Egmore", "Elavanur", "Erode", "Gingee", "Gobichettipalayam", "Gopalasamudram", "Guindy", "Gunduperumbedu", "Hale Dharmapuri", "Harur", "Hosur", "Injambakkam", "Kakkaveri", "Kalavakkam", "Kallankattuvalasu", "Kalpakkam", "Kanchipuram", "Kandigai", "Kangayam", "Karaikudi", "Karur", "Katpadi", "Kattankulathur", "Kelambakkam", "Kilakadu", "Kilakarai", "Kiliyanur", "Kilpauk", "Kodaikanal", "Kotagiri", "Kovilpatti", "Krishnagiri", "Kumbakonam", "Kumulam", "Kuttalam", "Madukkur", "Madurai", "Mannargudi", "Manojipatti", "Marthandam", "Marungulam", "Mayiladuthurai", "Mettur", "Mudittanendal", "Nagapattinam", "Nagercoil", "Namakkal", "Nandambakkam", "Nanganallur", "Nellikuppam", "Neyveli", "Ooty", "Padmanabhapuram", "Palani", "Paranur", "Paravai", "Peelamedu", "Perambalur", "Peravurani", "Perumbakkam", "Perundurai", "Pollachi", "Pongalur", "Ponneri", "Porayar", "Pudukkottai", "Pudupakkam", "Puduvayal", "Ramanathapuram", "Rasipuram", "Salem", "Sankarankovil", "Sathyamangalam", "Sattur", "Shenoy Nagar", "Sholinghur", "Siruseri", "Sivaganga", "Sivakasi", "Sriperumbudur", "Tambaram", "Thanjavur", "Theni", "Thiruthuraipoondi", "Thiruvarur", "Thoothukudi", "Tiruchchendur", "Tiruchengode", "Tiruchi", "Tirunelveli", "Tirupattur", "Tirupur", "Tiruvallur", "Tiruvannamalai", "Tiruvengadam", "Ulundurpet", "Usilampatti", "Vadapalani", "Vallioor", "Velacheri", "Vellore", "Villivakkam", "Villupuram", "Virudhachalam", "Vriddhachalam", "Walajapet", "Agartala", "Dharmanagar", "Kailashahar", "Kamalpur", "Khowai", "Kumarghat", "Abhaipur", "Achheja", "Adari", "Adaun", "Agra", "Agri", "Ahmedabad", "Akbaria", "Akha", "Alamnagar", "Alampur", "Aliganj", "Aligarh", "Alipur Bangawan", "Allahabad", "Amauli", "Amethi", "Amoi", "Amraigaon", "Amroha", "Arail", "Arjunganj", "Asandra", "Ashapur", "Assi", "Aung", "Auraiya", "Ayodhya", "Azamgarh", "Babrala", "Bachhaon", "Badheri Ghoghu", "Baghar", "Bagpat", "Bahraich", "Bairua", "Bakhira", "Ballia", "Banda", "Banhpur", "Bankegaon", "Baraini", "Baraut", "Bareilly", "Barra", "Barsana", "Basantpur", "Basti", "Bati", "Behat", "Belra", "Beohara", "Bhadaiyan", "Bhadohi", "Bhandsar", "Bijnor", "Bikapur", "Bindki", "Bisalpur", "Bisrakh", "Budaun", "Bulandshahr", "Chandpur", "Chewar Pachhim", "Chhibramau", "Chilwa", "Dadri", "Dankaur", "Daranagar", "Dariyabad", "Datawali", "Dehli", "Deoband", "Deoria", "Dhampur", "Dildarnagar", "Etah", "Etawah", "Faizabad", "Farrukhabad", "Fatehpur", "Firozabad", "Gajraula", "Gangoh", "Gauriganj", "Ghaziabad", "Ghazipur", "Ghorawal", "Ghosi", "Gola", "Gonda", "Gorakhpur", "Greater Noida", "Gurgaon", "Gyanpur", "Hamirpur", "Hanumanganj", "Hapur", "Harchandpur", "Hardoi", "Hasanpur", "Hathras", "Ikauna", "Indirapuram", "Itwa", "Jaunpur", "Jhansi", "Kanpur", "Karwi", "Kasganj", "Khaga", "Khajura", "Khalilabad", "Khatauli", "Kheri", "Khurja", "Konch", "Lakhimpur", "Lucknow", "Madhogarh", "Maharajganj", "Mainpuri", "Manpuri", "Mathura", "Mau", "Meerut", "Mirzapur", "Mohanlalganj", "Moradabad", "Muzaffarnagar", "Nadwa", "Nagina", "Najibabad", "Noida", "Orai", "Padrauna", "Pratapgarh", "Raebareli", "Rampur", "Rasulpur Rohta", "Renukoot", "Robertsganj", "Rohta", "Rudauli", "Saharanpur", "Sahibabad", "Sambhal", "Shahganj", "Shahjahanpur", "Shamli", "Sirathu", "Sultanpur", "Tanda", "Tulshipur", "Unnao", "Varanasi", "Vrindavan", "Almora", "Amsaur", "Araghar", "Bageshwar", "Bagoli", "Bazpur", "Belra", "Bhagwanpur", "Champawat", "Dehradun", "Dwarahat", "Gadarpur", "Garur", "Haldwani", "Haridwar", "Jaspur", "Jhabrera", "Kashipur", "Khatima", "Kichha", "Kotdwara", "Lalkua", "Mussoorie", "Nainital", "Pali", "Pantnagar", "Pauri", "Pithoragarh", "Ranikhet", "Rishikesh", "Roorkee", "Rudarpur", "Rudraprayag", "Sitarganj", "Srinagar", "Tanakpur", "Tehri", "Uttarkashi", "Agarpara", "Amta", "Andal", "Arambagh", "Asansol", "Atai", "Baduria", "Bagnan", "Bagula", "Baharampur", "Baharu", "Ballygunge", "Balurghat", "Banarhat", "Bandel", "Bangaon", "Bankura", "Baranagar", "Barasat", "Bardhaman", "Bargachia", "Barnia", "Baruipur", "Basirhat", "Begampur", "Behala", "Belda", "Beldanga", "Belgachia", "Belgharia", "Bhadreswar", "Bhagwangola", "Birpara", "Bolpur", "Burnpur", "Chakdaha", "Chalsa", "Champadanga", "Champahati", "Champdani", "Chandannagar", "Chandpara", "Chittaranjan", "Contai", "Dantan", "Darjeeling", "Debipur", "Dhaniakhali", "Dhulian", "Diamond Harbour", "Digha", "Dinhata", "Dubrajpur", "Durgapur", "Egra", "Falakata", "Ghatal", "Gorubathan", "Gujrat", "Habra", "Haldia", "Halisahar", "Haripal", "Hasnabad", "Hindmotor", "Howrah", "Hridaypur", "Ichapur", "Jalpaiguri", "Jhargram", "Jiaganj", "Kakdwip", "Kaliachak", "Kalimpong", "Kalna", "Kalyani", "Kanchrapara", "Kandi", "Kankinara", "Karimpur", "Kharagpur", "Kolaghat", "Kolkata", "Konnagar", "Krishnanagar", "Kulti", "Lalgola", "Mahishadal", "Mainaguri", "Mal Bazar", "Malda", "Manteswar", "Matigara", "Mayapur", "Medinipur", "Memari", "Mohanpur", "Murarai", "Murshidabad", "Nabadwip", "Nagrakata", "Nalhati", "Panagarh", "Pandua", "Puruliya", "Raghunathpur", "Raiganj", "Ranaghat", "Raniganj", "Rishra", "Sabang", "Sainthia", "Saktipur", "Salt Lake City", "Serampore", "Shantipur", "Shyamnagar", "Siliguri", "Siuri", "Sonamukhi", "Swarupnagar", "Tamluk", "Tapan", "Tarakeswar", "Uttarpara"].each {|val|
  city = City.new(name: val, slug: val.parameterize)
  city.save
  puts "City #{city}"
}

[{sbi: { name: "SBI Credit Card", bank_image: "bank_images/sbi-bank.png", first_year_fee: 100.00, annual_fee: 300}},
 {icici: { name: "ICICI Credit Card", bank_image: "bank_images/icici-bank.png", first_year_fee: 100.00, annual_fee: 300}},
 {indusind: { name: "IndusInd Credit Card", bank_image: "bank_images/IndusInd-bank.png", first_year_fee: 100.00, annual_fee: 300}},
 {hdfc: { name: "HDFC Credit Card", bank_image: "bank_images/hdfc-bank.png", first_year_fee: 100.00, annual_fee: 300}}
].each do |k|
  k = k.flatten
  card = Card.new(name: k[1][:name], first_year_fee: k[1][:first_year_fee], annual_fee: k[1][:annual_fee])
  card.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
  card.save
  puts "Card #{card}"
end