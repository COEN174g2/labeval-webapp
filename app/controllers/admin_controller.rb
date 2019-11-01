class AdminController < ApplicationController
  def index
  end

  def upload_regdata
  	xlsx = Roo::Spreadsheet.open('../assets/regdata.xlsx')

	print xlsx.info
	# => Returns basic info about the spreadsheet file
  end
end
