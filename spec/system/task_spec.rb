require 'rails_helper'
 RSpec.describe 'Task management function', type: :system do
   
  describe 'New Features' do
    context 'case was the task to create a new' do
      it 'task that you created is displayed' do
     task=Task.create(name:" joshua", Details: "we are going out", Deadline: "2020/2/2", status: "Unstarted", priority: "Low")
     visit task_path(task)
     expect(page).to have_content "joshua"
     expect(page).to have_content "we are going out"
    end
   end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit tasks_path
        click_on "Register New Task"
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        select 'Completed'
        select 'Low'
        click_on "Create Task"
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
        fill_in "Name", with: "Testing6"
        fill_in "Details", with: "Testing again8"
        click_on "Create Task"
        visit tasks_path
        click_on 'Delete'

       end
     end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_on "Create Task"
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
        click_on "Update Task"
        expect(page).to have_content 'Task was successfully updated.'
      end
    end
  end
 describe 'list display function' do
    context 'When tasks are arranged in descending order of creation and time'do
      it 'new task is displayed on top' do
      task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1")
      visit tasks_path
      click_on 'Deadline'
      tasks = Task.all.order("Task DESC")
   end
  end
 end
 describe 'detailed display function'  do
    context 'if the transition to any task detail screen'  do
      it 'Register task and sort with Deadline' do
       visit new_task_path
       fill_in "Name", with: "Try"
       fill_in "Details", with: "Testing"
       fill_in "Deadline", with: "2021/1/4"
       click_on "Create Task"
       visit tasks_path
       click_on 'Deadline'
       tasks=Task.all.order("Deadline DESC")
     end
    end
  end
  describe 'detailed display function'  do
     context 'if the transition to any task detail screen'  do
       it 'Register task and sort by priority' do
        visit new_task_path
        task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1", status:"Unstarted", priority: "Medium")
        visit tasks_path
        click_on 'priority'
        tasks=Task.all.order("priority DESC")
      end
     end
   end
     describe 'list display function' do
        context 'When tasks are arranged in descending order of creation and time'do
        it 'display task with status and priority' do
        task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1", status:"Unstarted", priority: "Medium")
        visit tasks_path
        expect(page).to have_content 'Unstarted'
        expect(page).to have_content 'Medium'
       end
      end
     end

     describe 'list display function' do
          context 'When tasks are arranged in descending order of creation and time'do
          it 'Search by status' do
          task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1", status:"Unstarted", priority: "Medium")
          visit tasks_path
          fill_in 'Status', with: "Unstarted"
          click_on "Search"
          expect(page).to have_content 'Unstarted'
       end
      end
     end

     describe 'list display function' do
          context 'When tasks are arranged in descending order of creation and time'do
          it 'Search by name' do
          task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1", status:"Unstarted", priority: "Low")
          visit tasks_path
          fill_in 'Name', with: "hobies"
          click_on "Search"
          expect(page).to have_content 'Low'
       end
      end
     end
     describe 'list display function' do
          context 'When tasks are arranged in descending order of creation and time'do
          it 'Search by both status and name' do
          task=Task.create(name: "hobies", Details: "sports", Deadline: "2021/1/1", status:"Unstarted", priority: "Low")
          visit tasks_path
          fill_in 'Name', with: "hobies"
          fill_in 'Status', with: "Unstarted"
          click_on "Search"
          expect(page).to have_content 'hobies'
          expect(page).to have_content 'Unstarted'
       end
      end
     end
     #STEP 4
    #  describe 'User Registration' do
    #       context 'user can be created'do
    #       it 'user sign up' do
    #       user=User.create(name: "job", email: "job@gmail.com", password:"job92", password_confirmation: "job92")
    #       visit tasks_path
    #       expect(page).to have_content 'User was successfully created'
    #    end
    #   end
    # end
    #
    # describe 'User Registration' do
    #      context 'user can be created'do
    #      it 'user login' do
    #      user=User.create(name: "job", email: "job@gmail.com", password:"job92", password_confirmation: "job92")
    #      click_on "Logout"
    #      visit new_session_path
    #      click_on "login"
    #      fill_in 'email', with: "job@gmail.com"
    #      fill_in 'password', with: "job92"
    #      click_on "login"
    #   end
    #  end
    # end
    #

end
