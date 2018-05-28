class EmployeesController < ApplicationController
  # make sure the employee is signed in to access anything
  # actions in the employees controller
  before_action :authenticate_employee!

  def index
    @orders = ["order1", "order2"]
  end

  def show
  end
end
