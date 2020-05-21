require 'rails_helper' 
require 'pry'

describe Cnab, :type => :model do

  it '.create_from_file(data) return instance of Cnab' do
    data = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA'
    
    cnab = Cnab.create_from_file(data)

    expect(cnab).to be_a Cnab
  end

  it '.create_from_file(data) raise if line size has less than 80 chars' do
    data = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO'

    expect{Cnab.create_from_file(data)}.to raise_error(ArgumentError)
  end

  it '.create_from_file(data) raise if line size has grether than 80 chars' do
    data = '3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

    expect{Cnab.create_from_file(data)}.to raise_error(ArgumentError)
  end

end
