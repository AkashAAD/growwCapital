module ApplicationHelper

  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        "#{field_name.to_s.split("_").join(" ")} #{object.errors.messages[field_name].join(", ")}"
      end
    end
  end

  def cities(obj, state, city)
    if obj.object.send(city).blank?
      [['-Select City-','']]
    else
      [['-Select City-','']] + CS.cities(obj.object.send(state).to_sym, :in).map{ |val| [val, val.downcase] }
    end
  end

  def degrees(obj)
    if obj.object.profession_type.blank?
      [['-Select Degree-','']]
    else
      [['-Select Degree-','']] + Degree.where(profession_id: obj.object.profession_type).pluck(:name, :id)
    end
  end

  def states
    [['-Select State-','']] + CS.states(:in).map{ |val| [val[1], val[0].downcase] }
  end

  def current_employment
  	[['-Select Your Emplyment-','']] + BusinessEmploymentType.pluck(:name, :id)
  end

  def employment_type
    [['-Select Your Emplyment-','']] + EmploymentType.pluck(:name, :id)
  end

  def annual_turnover
  	[['-Select Annual Turnover-','']] + AnnualTurnover.pluck(:name, :id)
  end

  def gender
  	[['-Select Gender-',''], ['Male','male'], ['Female','female'], ['Transgender','transgender']]
  end

  def is_rbi_offer
  	[['-Select RBI Offer-',''], ["Yes", "yes"], ["No", "no"]]
  end

  def residence_type
  	[['-Select Residence Type-','']] + ResidenceType.pluck(:name, :id)
  end

  def company_type
  	[['-Select Residence Type-','']] + CompanyType.pluck(:name, :id)
  end

  def business_nature
    [['-Select Business Nature-','']] + BusinessNature.pluck(:name, :id)
  end

  def industry_type
    [['-Select Industry Type-','']] + IndustryType.pluck(:name, :id)
  end

  def business_year
    [['-Select Business Year-','']] + BusinessYear.pluck(:name, :id)
  end

  def marital_status
    [['-Select Marital Status-',''], ["Married", "married"], ["Unmarried", "unmarried"]]
  end

  def highest_qualification
    [['-Select Highest Qualification-','']] + HighestQualification.pluck(:name, :id)
  end

  def dependent_number
    [['-Select Dependent Number-','']] + DependentNumber.pluck(:name, :id)
  end

  def purpose_of_loan
    [['-Select Loan Purpose-','']] + LoanPurpose.pluck(:name, :id)
  end

  def qualification
    [['-Select Qualification-','']] + Qualification.pluck(:name, :id)
  end

  def home_loan_amount
    [['-Select Home Loan Amount-','']] + HomeLoanAmount.pluck(:name, :id)
  end

  def land_type
    [['-Select Property Type-',''], ["NATP", "natp"], ["RL", "rl"], ["NA", "na"], ["Gramin", "gramin"]]
  end

  def property_type
    [['-Select Property Type-',''],
    ["Flat", "flat"],
    ["Plot", "plot"],
    ["Consturcted Property", "consturcted_property"],
    ["Commercial Property", "commercial_property"]]    
  end

  def profession_type
    [['-Select Profession Type-','']] + Profession.pluck(:name, :id)
  end

  def bank_name
    [['-Select Bank Name-','']] + Bank.pluck(:name, :id)
  end

  def open_land_constructed_property
    [['-Select Land Type-',''], ["Residential", "residential"], ["Commercial", "commercial"]]
  end

  def company_name
    [['-Select Company Name-','']] + Company.pluck(:name, :id)
  end

  def mailing_address
    [['-Select Mailing Address-','']] + MailingAddress.pluck(:name, :id)
  end

  def current_residency_since_year
    [['-Select Residence Since Year-','']] + StayResidenceSinceYear.pluck(:name, :id)
  end

  def current_profession_since_year
    [['-Select Profession Since Year-','']] + StayResidenceSinceYear.pluck(:name, :id)
  end

  def current_city_since_year
    [['-Select City Since Year-','']] + StayCitySinceYear.pluck(:name, :id)
  end

  def tenure
    [['-Select Tenure-','']] + Tenure.pluck(:name, :id)
  end

  def profession_status
    [['-Select Profession Status-',''],
    ['Salaried','salaried'],
    ['Self Employed','self-employed']]
  end

  def active_tab(tab)
    if params['controller'].eql?('home')
      return 'active' if params[:action] == tab
    end
  end

end
