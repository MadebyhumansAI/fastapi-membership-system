### This is a Fork of the wonderful Fastapi boilerplate for production by @hunnyjain711 :rocket:. Thanks for creating this 🙏. Adapted to work with Poetry and containerized for deployment on cloud ☁️.

### Technology Stack:
* Python version 3.7 or above
* FastAPI
* Uvicorn (server)
* Sqlalchemy
* MySql
* Alembic (database migrations)


### Directory Tree
```
fastapi-production-boilerplate
┣ project
┃ ┣ alembic
┃ ┃ ┣ versions
┃ ┃ ┣ env.py
┃ ┃ ┣ README
┃ ┃ ┗ script.py.mako
┃ ┣ common
┃ ┃ ┣ auth.py
┃ ┃ ┗ utility.py
┃ ┣ constant
┃ ┃ ┗ status_constant.py
┃ ┣ database
┃ ┃ ┗ database.py
┃ ┣ endpoints
┃ ┃ ┣ admin_app
┃ ┃ ┃ ┣ authentication.py
┃ ┃ ┃ ┗ __init__.py
┃ ┃ ┣ client_app
┃ ┃ ┃ ┣ client_authentication.py
┃ ┃ ┃ ┗ __init__.py
┃ ┃ ┗ __init__.py
┃ ┣ media
┃ ┃ ┣ excels
┃ ┃ ┃ ┗ user_excels
┃ ┃ ┗ images
┃ ┃   ┗ profile_pics
┃ ┣ models
┃ ┃ ┣ cli_client.py
┃ ┃ ┗ usr_user.py
┃ ┣ routes
┃ ┃ ┗ api.py
┃ ┣ schemas
┃ ┃ ┃ ┣ login.cpython-310.pyc
┃ ┃ ┃ ┗ register.cpython-310.pyc
┃ ┃ ┣ login.py
┃ ┃ ┗ register.py
┃ ┣ alembic.ini
┃ ┣ test.py
┃ ┗ __init__.py
┣ .env
┣ .env.example
┣ .gitignore
┣ application.py
┣ README.md
┗ requirements.txt
```

### How to start the project ?
```
git clone https://github.com/Hunnyjain7/fastapi-production-boilerplate.git
cd fastapi-production-boilerplate
python -m venv env                  #create a virtual environment
.\env\Scripts\activate              #activate your virtual environment
pip install -r requirements.txt
update your database connection string in .env
uvicorn application:app --reload    #start server use --host for host if required
visit Welcome screen at 127.0.0.1:8000 
visit Swagger UI docs screen at 127.0.0.1:8000/docs  # here all api routing and request can be triggered...

```

### Guide towards the Alembic Migrations for SqlAlchemy in FastAPI
```
* Install alembic
pip install alembic

step 1: cd project then alembic init alembic

step 2: mention your mysql connection string inside sqlalchemy.url

step 3: in env.py file inside alembic dir mention all models inside target_metadata this way
target_metadata = [usr_user.Base.metadata, cli_client.Base.metadata]

step 4: alembic revision --autogenerate -m "message to identify migration"

step 5: now below command will migrate all changes to the database
alembic upgrade head

step 6: whenever you make changes into the models then create the revision and upgrade it, even if you remove fields from the models upgrade command will be used
alembic revision --autogenerate -m "second migration message"
followed by alembic upgrade first three or four initials of your recent version created in my case command was
alembic upgrade 2a43 

to downgrade the recent migration simply alembic downgrade first three or four initials of your recent version created in my case command was
alembic downgrade 2a43
```
### Possible extensions

* Oauth with multiple providers like login with Google, Facebook Github etc.
