class Form::FixedcostForm < Form::Base
  attr_accessor :fixedcost_values
  
  def intialize(attributes = {} )
    super attributes
     
     fixedcosts = Fixedcost.order(created_at: :asc)
     self.fixedcost_values = fixedcost.map { |fixedcost| FixedcostValue.new(fixedcost.id) } unless fixedcost_values.present?
  end
  
  def fixedcost_values_attributes=(attributes)
    self.fixedcost_values = attributes.map do |_, fixedcost_value_attributes|
      Form::FixedcostValue.new(fixedcost_value_attributes).tap { |v| puts v}
    end
  end
  
  def vaild?
    vaild_fixedcost_values = self.fixedcost_values,map(&:valid?).all?
  def save
    return false unless valid?
    FixedcostValue.transaction {
      seld.fixedcost_values.select.each { |fixedcost_value|
      a1 = FixedcostValue.new(:fixedcost_value.fixedcost_id,
           :year_month => fixedcost_value.year_month,
           :value => fixedcost_value.value,
           :desceiption => fixedcost_value.description)
      a1.save!
      }
    }
    true
  end
  
  def target_fixedcost_values
    self.fixedcost_values.select { |v| '*' }
  end
end