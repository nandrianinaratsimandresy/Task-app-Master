require 'rails_helper'
 RSpec.describe 'Task management function', type: :system do

  describe 'User sign Up test' do
      context 'when you sign up' do
          it 'registers new users' do
        visit new_user_path
        fill_in "name", with: "John"
        fill_in "email", with: "try@me.com"
        fill_in "password", with: "try94"
        fill_in "password_confirmation", with: "try94"
        click_on "Register user"
        expect{ click_on "Logout"}
    end
  end
 end
 describe 'Login/Out functionality' do
     context 'when you sign up' do
         it 'User can Login' do
           user=User.create(name: 'sample2',
                            email: 'sample@me.com',
                            password: 'password',
                            password_confirmation: 'password')
          visit new_session_path
          fill_in 'email', with: 'sample@me.com'
          fill_in 'password', with: 'password'
          click_on 'Log-in'
          expect{ click_on "Logout", "Register New Task"}
          expect(page).to have_content("Tasks List")
      end
    end
   end
   describe 'Login/Out functionality' do
      it 'User can Logout' do
      user=User.create(name: 'sample2',
              email: 'sample@me.com',
              password: 'password',
              password_confirmation: 'password')
     visit new_session_path
     fill_in 'email', with: 'sample@me.com'
     fill_in 'password', with: 'password'
     click_on 'Log-in'
     visit tasks_path
     click_on 'Logout'
      expect{ click_on "Login", "Sign up"}
  end
 end

 describe 'Admin management fuctions' do
     context 'Admin users should access the management panel' do
          it 'admin_user can access management panel' do
        user=User.create(name: 'admin',
                           email: 'admin@me.com',
                           password: 'password',
                           password_confirmation: 'password',
                           admin:"true ")
         visit new_session_path
         fill_in 'email', with: 'admin@me.com'
         fill_in 'password', with: 'password'
         click_on 'Log-in'
         expect{ click_on "Management"}
         visit admin_users_path
         expect(page).to have_content("Management Panel")
       end
     end
  end
  describe 'Admin management fuctions' do
     context 'Admin users can' do
           it 'admin can create users' do
             user=User.create(name: 'jones',
                               email: 'jones@gmail.com',
                               password: 'try94',
                               password_confirmation: 'try94',
                               admin:"true"
                                )
             visit new_session_path
             fill_in 'email', with: 'jones@gmail.com'
             fill_in 'password', with: 'try94'
             click_on 'Log-in'
             expect{ click_on "Management"}
             visit admin_users_path
             click_on 'New User'
             fill_in "name",         with: "User94"
             fill_in "email",        with: "user94@gmail.com"
             fill_in "password",     with: "try94"
             fill_in "password_confirmation", with: "try94"
             expect{click_on "Register"}.to change(User, :count).by(1)
         end
        end
      end

describe 'Admin management fuctions' do
  context 'Ordinary users should not access the management panel' do
        it 'Ordinary user cannot access the management panel' do
          user=User.create(name: 'sample',
                           email: 'sample@gmail.com',
                           password: 'try95',
                           password_confirmation:'try95'
                                 )
          visit new_session_path
          fill_in 'email', with: 'sample@gmail.com'
          fill_in 'password', with: 'try95'
          click_on 'Log-in'
          visit admin_users_path
          expect(page).to have_content("Tasks")
          expect(page).not_to have_content("admin")
        end
      end
   end

   describe 'Edit users page function' do
     context 'When Admin creating a new user' do
     it 'Admin should edit created user ' do
     user=User.create(name: 'jones',
                         email: 'jones@gmail.com',
                         password: 'try94',
                         password_confirmation: 'try94',
                         admin:"true"
                          )
     visit new_session_path
     fill_in 'email', with: 'jones@gmail.com'
     fill_in 'password', with: 'try94'
     click_on 'Log-in'
     expect{ click_on "Management"}
     visit admin_users_path
     click_on "New User"
     fill_in "name",         with: "User94"
     fill_in "email",        with: "user94@gmail.com"
     fill_in "password",     with: "try94"
     fill_in "password_confirmation", with: "try94"
     visit admin_users_path
     click_on 'Edit'
     expect(page).to have_content 'Edit-User'

    end
  end
end

describe 'Delete users page function' do
  context 'When Admin creating a new user' do
  it 'Admin should Delete created user ' do
  user=User.create(name: 'jones',
                      email: 'jones@gmail.com',
                      password: 'try94',
                      password_confirmation: 'try94',
                      admin:"true"
                       )
    visit new_session_path
    fill_in 'email', with: 'jones@gmail.com'
    fill_in 'password', with: 'try94'
    click_on 'Log-in'
    expect{ click_on "Management"}
    visit admin_users_path
    click_on "New User"
    fill_in "name",         with: "User94"
    fill_in "email",        with: "user94@gmail.com"
    fill_in "password",     with: "try94"
    fill_in "password_confirmation", with: "try94"
    visit admin_users_path
    click_on 'Delete user'
    expect(User.count == -1)
   end
  end
 end
 describe 'profile users page function' do
   context 'admin should view users profile' do
   it 'Admin can view user profile ' do
   user=User.create(name: 'jones',
                       email: 'jones@gmail.com',
                       password: 'try94',
                       password_confirmation: 'try94',
                       admin:"true"
                        )
     visit new_session_path
     fill_in 'email', with: 'jones@gmail.com'
     fill_in 'password', with: 'try94'
     click_on 'Log-in'
     expect{ click_on "Management"}
     visit admin_users_path
     click_on "New User"
     fill_in "name",         with: "User94"
     fill_in "email",        with: "user94@gmail.com"
     fill_in "password",     with: "try94"
     fill_in "password_confirmation", with: "try94"
     visit admin_users_path
     click_on 'Show'
     expect(page).to have_content 'No. of tasks'
      expect(page).to have_content 'jones@gmail.com'
    end
   end
  end

  describe 'Create user task users function' do
   context 'When Admin creating a new user' do
    it 'user can create a task ' do
    user=User.create(name: 'jones',
                        email: 'jones@gmail.com',
                        password: 'try94',
                        password_confirmation: 'try94',
                        admin:"true"
                         )
      visit new_session_path
      fill_in 'email', with: 'jones@gmail.com'
      fill_in 'password', with: 'try94'
      click_on 'Log-in'
      click_on 'Register New Task'
      fill_in 'Name', with: 'Task3'
      fill_in 'Details', with: 'vanilla'
      fill_in 'Deadline', with: '2021-1-20'
      click_on 'Create Task'
      visit tasks_path
      expect(page).to have_content 'Task3'
     end
    end
   end


end
