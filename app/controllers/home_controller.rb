class HomeController < ApplicationController
  def index 
    @current_tab = "About Equipe Browser"
  end
  
  def test
    @current_tab = "Page2"
    @u = {:label1 => "xxx", :label2 => "yyy"}
    respond_to do |format|
      format.html # render test.html
      format.xml  { render :xml => @u }
      format.json  { render :json => @u }
    end
  end
  
  def about
    @current_tab = "About Equipe Browser"
  end
end