import web

db_host = 'localhost'
db_name = 'ferreteriaKFC'
db_user = 'kfc'
db_pw = 'kfc.2019'

db = web.database(
    dbn='mysql',
    host=db_host,
    db=db_name,
    user=db_user,
    pw=db_pw
    )
