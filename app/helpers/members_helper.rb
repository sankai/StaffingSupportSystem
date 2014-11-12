module MembersHelper

  include Kinukake

  include JqgridsHelper

  def members_jqgrid

    grid = [{
      :url => '/members_by_shell',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => ['code','name','email'],
      :colModel  => [
        { :name => 'code',   :index => 'code',  :width => 180 },
        { :name => 'name',   :index => 'name',  :width => 240 },
        { :name => 'email',  :index => 'email', :width => 300 }
      ],
      :pager => '#members_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :caption => 'Members List',
      :onSelectRow => "function() { alert('Row selected!');}".to_json_var
    }]

    jqgrid_api 'members_list', grid
  end

end
