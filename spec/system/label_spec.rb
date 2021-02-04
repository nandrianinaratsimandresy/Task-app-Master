require 'rails_helper'
RSpec.describe 'Label function', type: :system do
  describe 'Create Labels' do
    context 'when you login' do
        it 'users can create new Labels' do
            user=User.create(name: 'sample2',
                             email: 'sample@me.com',
                             password: 'password',
                             password_confirmation: 'password')
           visit new_session_path
           fill_in 'email', with: 'sample@me.com'
           fill_in 'password', with: 'password'
           click_on 'Log-in'
           visit new_label_path
           fill_in 'Name', with: 'juuzu'
           fill_in 'Name', with: 'desi'
           click_button 'Create Label'
           expect(page).to have_content 'successfully created.'
         end
        end
      end
  describe 'Create Labels' do
    context 'when you login' do
        it 'users can create new tasks with Labels' do
            user=User.create(name: 'sample2',
                             email: 'sample@me.com',
                             password: 'password',
                             password_confirmation: 'password')
           visit new_session_path
           fill_in 'email', with: 'sample@me.com'
           fill_in 'password', with: 'password'
           click_on 'Log-in'
           visit new_label_path
           fill_in 'Name', with: 'juuzu'
           fill_in 'Name', with: 'desi'
           click_button 'Create Label'
           visit new_task_path
           fill_in 'Name', with: 'Task1'
           fill_in 'Detail', with: 'details'
           fill_in 'Deadline', with: '2019-9-28'
           select 'In-progress'
           page.has_field?('juuzu', checked: true)
           page.has_field?('desi', checked: true)
           click_button 'Create Task'
           visit tasks_path
           expect(page).to have_content 'details'
           expect(page).to have_content 'desi'
           end
          end
        end

        describe 'Create Labels' do
          context 'should search by labels' do
              it 'users can search tasks with Labels' do
                  user=User.create(name: 'sample2',
                                   email: 'sample@me.com',
                                   password: 'password',
                                   password_confirmation: 'password')
                 visit new_session_path
                 fill_in 'email', with: 'sample@me.com'
                 fill_in 'password', with: 'password'
                 click_on 'Log-in'
                 visit new_label_path
                 fill_in 'Name', with: 'juuzu'
                 fill_in 'Name', with: 'desi'
                 click_button 'Create Label'
                 visit new_task_path
                 fill_in 'Name', with: 'Task1'
                 fill_in 'Detail', with: 'details'
                 fill_in 'Deadline', with: '2019-9-28'
                 select 'In-progress'
                 page.has_field?('desi', checked: true)
                 page.has_field?('desi', checked: true)
                 click_button 'Create Task'
                 visit tasks_path
                 select 'desi'
                 click_on 'Search'
                 expect(page).to have_content 'desi'

                 end
                end
              end

  end
