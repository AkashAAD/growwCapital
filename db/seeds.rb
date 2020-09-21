['user', 'admin', 'super_admin'].each do |role|
  Role.create(name: role)
end
User.create(role_id: 2, email: "admin@gmail.com", password: "123456", password_confirmation: "123456")

["SSC", "HSC", "Graduation", "Post Graduation", "Engineering"].each do |hq|
  HighestQualification.create(name: hq)
end


["SSC", "HSC", "BCA", "MCA", "BSC", "MSC", "BE", "BCCA", "MCS", "BBA"].each do |hq|
  Qualification.create(name: hq)
end

20.times do |dep|
  DependentNumber.create(name: dep)
end

["Partnership Firm", "Own Firm", "Rent Firm"].each do |ct|
  CompanyType.create(name: ct)
end

["Trade/Wholesaler", "Merchandising", "Manufacturing", "Hybrid", "Sole Proprietorship", "Limited Liability Company", "Corporation"].each do |ct|
  BusinessNature.create(name: ct)
end

["Aerospace Industry", "Transport Industry", "Computer Industry", "Agriculture industry", "elecommunication industry", "Education Industry", "Pharmaceutical Industry"].each do |ct|
  IndustryType.create(name: ct)
end

["SBI", "ICICI", "BOI", "AXIS BANK", "BOB"].each do |ba|
  Bank.create(name: ba)
end

["Rented", "Own"].each do |ba|
  ResidenceType.create(name: ba)
end

["Wedding", "Home Construction", "Other"].each do |ba|
  LoanPurpose.create(name: ba)
end

["0 to 50,000 Rs.", "50,000 Rs. to 10,0000 Rs.", "10,0000 Rs. to 100,0000 Rs.", "100,0000 Rs. to 500,0000 Rs."].each do |ba|
  HomeLoanAmount.create(name: ba)
end

["0 to 1 yr.", "1 yr. to 5 yrs.", "5 yrs. to 10yrs.", "10 yrs. to 50 yrs."].each do |ba|
  BusinessYear.create(name: ba)
end

["Permanent or fixed-term employees", "Casual employees", "Apprentices or trainees – employees", "Employment agency staff – also called labour hire", "Contractors and sub-contractors – hired staff"].each do |et|
  BusinessEmploymentType.create(name: et)
end

["Salaried", "Contract basis"].each do |et|
  EmploymentType.create(name: et)
end

["0 to 50 lack", "50 lack to 1 crore", "1 crore to 5 crore", "5 crore to 10 crore"].each do |at|
  AnnualTurnover.create(name: at)
end

["Doctor", "Engineer", "Lawyer", "Singer", "Writer"].each do |pr|
  Profession.create(name: pr)
end