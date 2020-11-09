# ['user', 'admin', 'super_admin'].each do |role|
#   Role.create(name: role)
#   puts "Role #{role}"
# end
# User.create(role_id: 2, email: "admin@gmail.com", password: "123456", password_confirmation: "123456")

# ["SSC", "HSC", "Graduation", "Post Graduation", "Engineering", "Professional", "Under Graduate", "Doctorate", "Other"].each do |hq|
#   HighestQualification.create(name: hq)
#   puts "HighestQualification #{hq}"
# end


# ["SSC", "HSC", "BCA", "MCA", "BSC", "MSC", "BE", "BCCA", "MCS", "BBA", "Other"].each do |hq|
#   Qualification.create(name: hq)
#   puts "Qualification #{hq}"
# end

# 20.times do |dep|
#   DependentNumber.create(name: dep)
#   puts "DependentNumber #{dep}"
# end

# ["Partnership Firm", "Own Firm", "Rent Firm"].each do |ct|
#   CompanyType.create(name: ct)
#   puts "CompanyType #{ct}"
# end

# ["Architech", "Astrologer", "Autospare Dealers", "Builders and Developers", "Builders and Material Supliers", "Cabel and TV Operators", "Chartered Accountants", "Chit Fund Operators/ SE Operating Finance Business", "Commission Agent", "Consultant Operating From Residence", "Contractors(All Types)", "Doctor", "DSA",
#   "Film industry related people", "Garage Owner", "Inssurance Agent", "Labour Contractors", 
#   "Manpower Consultants", "Manufacturing", "Massage Parlours/ Beauty Parlours", "MBBS Doctor", "MD/MS/MDS Doctor", 
#   "Motor Training School", "Owner of private security services agent", "Petrol Pump Owner", "Retailer Services",
#   "Small non branded courior Company", "Standalone STD/Xerox booth owners", "Trading", 
#   "Young Inssurance Agent < 30 Years", "Other"].each do |ct|
#   BusinessNature.create(name: ct)
#   puts "BusinessNature #{ct}"
# end

# ["Central Govt.", "Education Institute", "Partnership Firm", "Private Limited Company", "Proprietoship Firm", "Public Limited Company", "Public Sector Undertaking", "Society", "State Govt.", "Trust", "Other"].each do |ct|
#   IndustryType.create(name: ct)
#   puts "IndustryType #{ct}"
# end

# ["Rented", "Self-Owned", "Famaly-Owned", "Paying Guest", "Hotel", "Company Provided", "Other"].each do |ba|
#   ResidenceType.create(name: ba)
#   puts "ResidenceType #{ba}"
# end

# ["Debt Consolidation", "Holidays", "Home Improvements", "Medical Emergency", "Wedding", "Education", "Business Expansion", "Other"].each do |ba|
#   LoanPurpose.create(name: ba)
#   puts "LoanPurpose #{ba}"
# end

# ["0 to 5 lack", "5 lack to 30 lack", "30 lack to 50 lack", "50 lack to 80 lack", "80 lack to 1 cr", "Other"].each do |ba|
#   HomeLoanAmount.create(name: ba)
#   puts "HomeLoanAmount #{ba}"
# end

# ["0 to 1 yr.", "1 yr. to 5 yrs.", "5 yrs. to 10yrs.", "10 yrs. to 50 yrs.", "Other"].each do |ba|
#   BusinessYear.create(name: ba)
#   puts "BusinessYear #{ba}"
# end

# ["Permanent or fixed-term employees", "Casual employees", "Apprentices or trainees – employees", "Employment agency staff – also called labour hire", "Contractors and sub-contractors – hired staff", "Other"].each do |et|
#   BusinessEmploymentType.create(name: et)
#   puts "BusinessEmploymentType #{et}"
# end

# ["Salaried", "Self Employed", "Professional", "Other"].each do |et|
#   EmploymentType.create(name: et)
#   puts "EmploymentType #{et}"
# end

# ["0 to 50 lack", "50 lack to 1 crore", "1 crore to 5 crore", "5 crore to 10 crore", "Other"].each do |at|
#   AnnualTurnover.create(name: at)
#   puts "AnnualTurnover #{at}"
# end

# {"Doctor": ["MBBS", "MBBS MD", "MBBS MS", "BMS", "BHMS", "BDS", "Deploma"],
#  "CA": ["Plain CA", "FCA"],
#  "Architechure": ["Bacholor of Architechure", "Master of Architechure"],
#  "CS(Company Secretary)": ["CS(Company Secretary)"]}.each do |key, val|
#   profession = Profession.create(name: key.to_s)
#   puts "Profession #{profession.id}"
#   val.each do |degree|
#     deg = Degree.new(profession_id: profession.id, name: degree)
#     deg.save
#     puts "Degree #{deg.id}"
#   end
# end

# ["TCS", "Tech Mahindra", "Infosys", "Other"].each do |com|
#   Company.create(name: com)
#   puts "Company #{com}"
# end

# ["Residence","Office", "Permanent", "Other"].each do |ma|
#   MailingAddress.create(name: ma)
#   puts "MailingAddress #{ma}"
# end

# (1..100).each {|t| 
#   StayCitySinceYear.create(name: t)
#   puts "StayCitySinceYear #{t}"
# }

# (1..100).each {|t| 
#   StayResidenceSinceYear.create(name: t)
#   puts "StayResidenceSinceYear #{t}"
# }

# ["Allahabad Bank",
# "Andhra Bank",
# "Axis Bank",
# "Bank of Bahrain and Kuwait",
# "Bank of Baroda - Corporate Banking",
# "Bank of Baroda - Retail Banking",
# "Bank of India",
# "Bank of Maharashtra",
# "Canara Bank",
# "Central Bank of India",
# "City Union Bank",
# "Corporation Bank",
# "Deutsche Bank",
# "Development Credit Bank",
# "Dhanlaxmi Bank",
# "Federal Bank",
# "ICICI Bank",
# "IDBI Bank",
# "Indian Bank",
# "Indian Overseas Bank",
# "IndusInd Bank",
# "ING Vysya Bank",
# "Jammu and Kashmir Bank",
# "Karnataka Bank Ltd",
# "Karur Vysya Bank",
# "Kotak Bank",
# "Laxmi Vilas Bank",
# "Oriental Bank of Commerce",
# "Punjab National Bank - Corporate Banking",
# "Punjab National Bank - Retail Banking",
# "Punjab & Sind Bank",
# "Shamrao Vitthal Co-operative Bank",
# "South Indian Bank",
# "State Bank of Bikaner & Jaipur",
# "State Bank of Hyderabad",
# "State Bank of India",
# "State Bank of Mysore",
# "State Bank of PatialSouth Indian Banka",
# "State Bank of Travancore",
# "Syndicate Bank",
# "TamilnadSouth Indian Bank Mercantile Bank Ltd.",
# "UCO Bank",
# "Union Bank of India",
# "United Bank of India",
# "Vijaya Bank",
# "Yes Bank Ltd",
# "Bandhan Bank",
# "Catholic Syrian Bank",
# "DCB Bank",
# "Dhanlaxmi Bank",
# "HDFC Bank",
# "IDFC First Bank",
# "Jammu & Kashmir Bank",
# "Kotak Mahindra Bank",
# "Lakshmi Vilas Bank",
# "Nainital Bank",
# "RBL Bank",
# "South Indian Bank",
# "Tamilnad Mercantile Bank Limited",
# "Other"].each do |ba|
#   Bank.create(name: ba)
#   puts "Bank #{ba}"
# end


# ["1 Yr", "2 yr", "3 yr", "4 yr", "5 yr"].each do |ten|
#   Tenure.create(name: ten)
#   puts "Tenure #{ten}"
# end

# ["3M INDIA LIMITED",
# "AIRPORTS AUTHORITY OF INDIA",
# "ABB LIMITED",
# "ACC LIMITED",
# "AIA ENGINEERING LIMITED",
# "A R S S INFRASTRUCTURE PROJECTS LIMITED",
# "AARTI INDUSTRIES LIMITED",
# "ABBOT INDIA LIMITED",
# "ACCENTURE SERVICES PRIVATE LIMITED",
# "ADANI ENTERPRISES LIMITED",
# "ADANI POWER LIMITED",
# "ADANI WILMAR LIMITED",
# "ADHUNIL METALICS LIMITED",
# "ADITYA BIRLA NUVO LIMITED",
# "AHLUWALIA CONTRACTS INDIA LIMITED",
# "ALFA LAVAL INDIA LIMITED",
# "ALLCARGO LOGISTICS LIMITED",
# "ALSTOM ENGINEERING LIMITED",
# "AMARA RAJA BATTERIES LIMITED",
# "AMBUJA CEMENTS LIMITED",
# "ANDHRA PRADESH POWER GENERATION CORPN. LIMITED",
# "APAR INDUSTRIES LIMITED",
# "APOLLO HOSPITALS",
# "APOLLO TYRES",
# "ARICENT TECHNOLOGIES HOLDINGS LIMITED",
# "ARVIND MILL LIMITED",
# "ASAHI INDIA GLASS LIMITED",
# "ASHOK LEYLAND LIMITED",
# "ASHOKA BUILDCON LIMITED",
# "ASIAN PAINTS INDIA LIMITED",
# "ASIAN STAR",
# "ATLAS COPCO INDIA LIMITED",
# "ATUL LIMITED",
# "AUROBINDO PHARMA",
# "AUTOMOTIVE AXLES LIMITED",
# "AXIS BANK"].each do |em|
#   Employer.create(name: em)
#   puts "Employer #{em}"
# end


[{ hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
 { fllutoran_india: { name: "Fllutoran India", roi: 25, processing_fee: 2, bank_image: "bank_images/fllutoran.png"}},
 { idfc_first_bank: { name: "IDFC First Bank", roi: 14, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
 { hdfc_bank: { name: "HDFC Bank", roi: 12, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
 { axis_bank: { name: "Axis Bank", roi: 13, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
 { icici_bank: { name: "ICICI Bank", roi: 13, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
 { tata_capital: { name: "TATA capital", roi: 15, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
 { yes_bank: { name: "YES Bank", roi: 12, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
 { bajaj_finserve: { name: "Bajaj Finserve", roi: 17, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
 { indusind_bank: { name: "IndusInd Bank", roi: 15, processing_fee: 2, bank_image: "bank_images/IndusInd-bank.png"}}].each do |k|
   k = k.flatten
   plb = PersonalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
   plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
   plb.save
   plbi = PersonalLoanBankInfo.new(roi: k[1][:roi], processing_fee: k[1][:processing_fee], personal_loan_id: plb.id)
   plbi.save
   puts "PersonalLoanBank #{plb}"
end


# [{ hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
#  { fllutoran_india: { name: "Fllutoran India", roi: 36, processing_fee: 2, bank_image: "bank_images/fllutoran.png"}},
#  { idfc_first_bank: { name: "IDFC First Bank", roi: 17, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
#  { hdfc_bank: { name: "HDFC Bank", roi: 16, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
#  { axis_bank: { name: "Axis Bank", roi: 17.5, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
#  { icici_bank: { name: "ICICI Bank", roi: 15.5, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
#  { tata_capital: { name: "TATA capital", roi: 14.5, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
#  { yes_bank: { name: "YES Bank", roi: 18, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
#  { bajaj_finserve: { name: "Bajaj Finserve", roi: 22, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
#  { indusind_bank: { name: "IndusInd Bank", roi: 16, processing_fee: 2, bank_image: "bank_images/IndusInd-bank.png"}},
#  { neogrowth_finance: { name: "Neogrowth finance", roi: 16, processing_fee: 2, bank_image: "bank_images/neogrowth-finance.png"}}
# ].each do |k|
#    k = k.flatten
#    blb = BusinessLoanBank.new(name: k[1][:name], slug: k[0].to_s)
#    blb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
#    blb.save
#    puts "BusinessLoanBank #{plb}"
# end

# [{ hero_fincorp: { name: "Hero Fincorp", roi: 21, processing_fee: 2, bank_image: "bank_images/hero-fincorp.png"}},
#  { fllutoran_india: { name: "Fllutoran India", roi: 36, processing_fee: 2, bank_image: "bank_images/fllutoran.png"}},
#  { idfc_first_bank: { name: "IDFC First Bank", roi: 11, processing_fee: 2, bank_image: "bank_images/idfc-bank.gif"}},
#  { hdfc_bank: { name: "HDFC Bank", roi: 10.85, processing_fee: 2, bank_image: "bank_images/hdfc-bank.png"}},
#  { axis_bank: { name: "Axis Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/axis-bank.png"}},
#  { icici_bank: { name: "ICICI Bank", roi: 14.50, processing_fee: 2, bank_image: "bank_images/icici-bank.png"}},
#  { tata_capital: { name: "TATA capital", roi: 14.5, processing_fee: 2, bank_image: "bank_images/tata-capital.webp"}},
#  { yes_bank: { name: "YES Bank", roi: 15.50, processing_fee: 2, bank_image: "bank_images/yes-bank.png"}},
#  { bajaj_finserve: { name: "Bajaj Finserve", roi: 14.50, processing_fee: 2, bank_image: "bank_images/bajaj-logo.png"}},
#  { indusind_bank: { name: "IndusInd Bank", roi: 16, processing_fee: 2, bank_image: "bank_images/IndusInd-bank.png"}},
#  { neogrowth_finance: { name: "Neogrowth finance", roi: 16, processing_fee: 2, bank_image: "bank_images/neogrowth-finance.png"}}
# ].each do |k|
#    k = k.flatten
#    plb = ProfessionalLoanBank.new(name: k[1][:name], slug: k[0].to_s)
#    plb.bank_image.attach(io: File.open(File.join(Rails.root, k[1][:bank_image])), filename: k[1][:bank_image].split('/')[1])
#    plb.save
#    puts "BusinessLoanBank #{plb}"
# end

