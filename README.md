## FastAPI Boilerplate for Production Development with MySql and Alembic Migrations

* Work in Progress not Complete BoilerPlate yet...

## Technology Stack:
* Python version 3.7 or above
* FastAPI
* Uvicorn (server)
* Sqlalchemy
* MySql
* Alembic (database migrations)


## How to start the project ?
```
git clone https://github.com/Hunnyjain7/fastapi-production-boilerplate.git
cd fastapi-production-boilerplate
python -m venv env                  #create a virtual environment
.\env\Scripts\activate              #activate your virtual environment
pip install -r requirements.txt
cd project/database/database.py     #make sure you change the db connection string in DATABASE_URL variable
uvicorn application:app --reload    #start server
visit  127.0.0.1:8000/
```

## Guide towards the Alembic Migrations for SqlAlchemy in FastAPI
```
* Install alembic <br>
pip install alembic

step 1: cd project then alembic init alembic <br>

step 2: mention your mysql connection string inside sqlalchemy.url = <br>

step 3: in env.py file inside alembic dir mention all models inside target_metadata this way <br>
target_metadata = [usr_user.Base.metadata, cli_client.Base.metadata] <br>

step 4: alembic revision --autogenerate -m "message to identify migration" <br>

step 5: now below command will migrate all changes to the database <br>
alembic upgrade head

step 6: whenever you make changes into the models then create the revision and upgrade it, even if you remove fields from the models upgrade command will be used<br>
alembic revision --autogenerate -m "second migration message" <br>
followed by alembic upgrade first three or four initials of your recent version created in my case command was<br>
alembic upgrade 2a43 <br>

to downgrade the recent migration simply alembic downgrade first three or four initials of your recent version created in my case command was<br>
alembic downgrade 2a43 <br>
```
