# frozen_string_literal: true

class CnabParserService < ApplicationService
  attr_accessor :file
  def initialize(file)
    @file = file
  end

  def call
    cnab_file = File.open(file[:file].to_s)
    Store.find_or_create_by(name: store_name, owner: store_owner)
    # cnab_file.each_line do |line|
    #   #puts line
    #   # puts line.slice(0,1)
    #   # puts line.slice(1,8)
    #   # puts line.slice(9,10)
    #   # puts line.slice(19,11)
    #   # puts line.slice(30,12)
    #   # puts line.slice(42,6)

    #   store_owner = line.slice(48, 14).strip
    #   store_name =  line.slice(62,19).strip

    #   Store.find_or_create_by(name: store_name, owner: store_owner)
    # end
    :success
  end
  byebug
end
