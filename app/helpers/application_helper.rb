# Methods added to this helper will be available to all templates in the application.
require 'fusioncharts_helper'

module ApplicationHelper
  include FusionChartsHelper
  include ReportHelper

  #Action responsável pela procura de algum campo específico
  def search(search_url)
    render(:partial => "shared/search" ,
    :locals => {
      :search_url => search_url
    })
  end
end