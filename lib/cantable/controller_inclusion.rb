module CanTable
  module ControllerInclusion
    def can_table(resource)
      table = []
      actions = [:create, :read, :update, :destory]
      actions.map do |action|
        table << action if can? action, resource
      end
      table
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include CanTable::ControllerInclusion
  end
end