require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :task => "MyString",
      :time => "MyString",
      :description => "MyText",
      :tags => "MyString"
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_task", :name => "task[task]"
      assert_select "input#task_time", :name => "task[time]"
      assert_select "textarea#task_description", :name => "task[description]"
      assert_select "input#task_tags", :name => "task[tags]"
    end
  end
end
