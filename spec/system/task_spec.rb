require 'rails_helper'
 RSpec.describe 'task', type: :system do
  describe 'New Features'  do
    context 'case was the task to create a new'  do
      it ' task that you created is displayed '  do
     task=Task.create(name:" joshua", Details: "we are going out")
     visit task_path(task)
     expect(page).to have_content "joshua"
     expect(page).to have_content "we are going out"
    end
    end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        expect(page).to have_content "Testing"
        expect(page).to have_content "Testing again"
      end
    end
  end
  describe 'detailed display function'  do
     context 'if the transition to any task detail screen'  do
       it 'should delete a task' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        click_on 'Destroy'
        # expect(message).to have_content "Are you sure?"
        # click_on "OK"
        # expect(page).to have_content "Task was successfully destroyed."
        # accept_alert do
        # click_on "Destroy"
       end
     end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        click_on 'Show'
        expect(page).to have_content "Testing"
        expect(page).to have_content "Testing again"
      end
    end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'able to edit task' do
        task=Task.create(name: "joshua", Details: "we are going out")
        visit task_path(task.id)
        click_on 'Back'
        expect(page).to have_content "joshua"
        expect(page).to have_content "we are going out"
        end
      end
    end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'Updating task' do
        task=Task.create(name: "joshua", Details: "we are going out")
        visit tasks_path
        click_on 'Edit'
        click_button "Update Task"
        expect(page).to have_content 'Task was successfully updated.'
      end
    end
  end
 describe 'list display function' do
    context 'When tasks are arranged in descending order of creation and time'do
      it 'new task is displayed on top' do
      task=Task.create(name: "joshua", Details: "we are going out")
      visit tasks_path
      tasks = Task.all.order("created_at DESC")
   end
  end
 end
end
