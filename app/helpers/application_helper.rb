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

  def only_cities
    [['-Select City-','']] + City.all.order('name').map{ |val| [val.name, val.slug] }.uniq
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

  def car_manufacturer
    [['-Select-','']] + CarManufacturer.pluck(:name, :id)
  end

  def car_model(obj)
    if obj.object.car_manufacturer.nil?
      [['-Select-','']]
    else
      [['-Select-','']] + CarManufacturer.find_by(id: obj.object.car_manufacturer).car_models.pluck(:name, :id)
    end
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
  	[['-Select Gender-',''], ['Male','male'], ['Female','female']]
  end

  def is_rbi_offer
  	[['-Select RBI Offer-',''], ["Yes", "yes"], ["No", "no"]]
  end

  def residence_type
  	[['-Select Residence Type-','']] + ResidenceType.pluck(:name, :id)
  end

  def company_type
  	[['-Select Company Type-','']] + CompanyType.pluck(:name, :id)
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

  def persoanl_bank_name
    [['-Select Bank Name-','']] + [['Cheque','cheque']] + [['Cash','cash']] + Bank.pluck(:name, :id)
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

  def home_loan_tenure
    [['-Select Tenure-','']] + HomeLoanTenure.pluck(:name, :id)
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

  def percentage_roi(roi)
    "%.2f" % roi + "%"
  end

  def processing_fee(processing_fee, loan_amount, bank)
    if ["HomeLoanBank", "TransferHomeLoanBank", "LoanAgainstPropertyBank"].include?(bank.class.name) || (bank.slug == 'au_small_bank' && bank.class.name == "BusinessLoanBank")
      return processing_fee.to_f
    else
      return (processing_fee.to_f / 100.to_f) * loan_amount.to_f
    end
  end

  def calculate_emi(personal_loan_info, personal_loan)
    r = personal_loan_info.roi / (12 * 100)
    t = personal_loan.tenure * 12
    emi = (personal_loan.loan_amount * r * ((1 + r)**t))/((1 + r)**t - 1)
    return "%.2f" % emi
  end

  def tr_calculate_emi(personal_loan_info, personal_loan)
    r = personal_loan_info.roi / (12 * 100)
    t = personal_loan.tenure * 12
    emi = (personal_loan.desired_loan_amount * r * ((1 + r)**t))/((1 + r)**t - 1)
    return "%.2f" % emi
  end

  def existing_card
    [['-Select Option-', ''], ['Yes','true'], ['No', 'false']]
  end

  def is_topup_amount
    [['-Select Option-', ''], ['Yes','true'], ['No', 'false']]
  end  

end
