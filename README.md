## Task model
| Column name | Data type |
|-------------|-----------|
|  name       | string    |
|  Details    | string    |
|  Completed  | boolean   |
|  Duedate    | date      |
|  user_id    | integer   |



## Label model
| Column name | Data type |
|-------------|-----------|
|task_id      |integer    |
|             |           |
|             |           |

## User model
| Column name | Data type |
|-------------|-----------|
| name        |string     |
| email       |string     |
| password    |string     |
| admin_user  |string     |
|             |           |

 
**Deploying on Heroku**
[Description](https://devcenter.heroku.com/articles/getting-started-with-rails5)

**Make sure you are in the right directory that contains your rails app. Create the app on heroku**

```Rails
$ heroku create
Creating app... done, secret-tor-42278
https://secret-tor-42278.herokuapp.com/ | https://git.heroku.com/secret-tor-42278.git
```
**You can verify that the remote was added to your rails app by running the code below**

```Rails
$ git config --list | grep heroku
remote.heroku.url=https://git.heroku.com/secret-tor-42278.git
remote.heroku.fetch=+refs/heads/*:refs/remotes/heroku/*
```
If you see `fatal: not in a git directory` then you are likely not in the correct directory. Otherwise you can deploy your code. After you deploy your code, you need to migrate your database, make sure it is properly scaled, and use logs to debug any issues that come up.

**Deploy your code**:
```Rails
$ git push heroku master
remote: Compressing source files... done.
```
**If you are using the database in your application, you need to manually migrate the database by running**:
```Rails
$ heroku run rake db:migrate
```



