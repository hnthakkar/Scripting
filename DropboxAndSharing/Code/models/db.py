# -*- coding: utf-8 -*-

#########################################################################
## This scaffolding model makes your app work on Google App Engine too
## File is released under public domain and you can use without limitations
#########################################################################

## if SSL/HTTPS is properly configured and you want all HTTP requests to
## be redirected to HTTPS, uncomment the line below:
# request.requires_https()

if not request.env.web2py_runtime_gae:
    ## if NOT running on Google App Engine use SQLite or other DB
    db = DAL('sqlite://storage.sqlite',pool_size=1,check_reserved=['all'])
else:
    ## connect to Google BigTable (optional 'google:datastore://namespace')
    db = DAL('google:datastore+ndb')
    ## store sessions and tickets there
    session.connect(request, response, db=db)
    ## or store session in Memcache, Redis, etc.
    ## from gluon.contrib.memdb import MEMDB
    ## from google.appengine.api.memcache import Client
    ## session.connect(request, response, db = MEMDB(Client()))

## by default give a view/generic.extension to all actions from localhost
## none otherwise. a pattern can be 'controller/function.extension'
response.generic_patterns = ['*'] if request.is_local else []

## (optional) optimize handling of static files
# response.optimize_css = 'concat,minify,inline'
# response.optimize_js = 'concat,minify,inline'
## (optional) static assets folder versioning
# response.static_version = '0.0.0'
#########################################################################
## Here is sample code if you need for
## - email capabilities
## - authentication (registration, login, logout, ... )
## - authorization (role based authorization)
## - services (xml, csv, json, xmlrpc, jsonrpc, amf, rss)
## - old style crud actions
## (more options discussed in gluon/tools.py)
#########################################################################

from gluon.tools import Auth, Service, PluginManager, prettydate

auth = Auth(db)
service = Service()
plugins = PluginManager()

## create all tables needed by auth if not custom tables
auth.define_tables(username=False, signature=False)

## configure email
mail = auth.settings.mailer
mail.settings.server = 'smtp.gmail.com:587'
mail.settings.sender = 'internalfilesharingalert@gmail.com'
mail.settings.login = 'internalfilesharingalert:Ecpdemo1@'

## configure auth policy
auth.settings.registration_requires_verification = False
auth.settings.registration_requires_approval = False
auth.settings.reset_password_requires_verification = True

## if you need to use OpenID, Facebook, MySpace, Twitter, Linkedin, etc.
## register with janrain.com, write your domain:api_key in private/janrain.key
from gluon.contrib.login_methods.janrain_account import use_janrain
use_janrain(auth, filename='private/janrain.key')

from gluon.contrib.login_methods.rpx_account import RPXAccount
auth.settings.actions_disabled=['register','change_password','request_reset_password']
auth.settings.login_form = RPXAccount(request,
    api_key='ffc93342970a1dbaab20be7c58b9449faf12f352',
domain='internalfilesharing',
    url = "http://127.0.0.1:8000/%s/default/user/login" % request.application)

#url = "https://hemal.pythonanywhere.com/Dropbox1/default/user/login")
#url = "http://127.0.0.1:8000/%s/default/user/login" % request.application)

auth.settings.login_form.mappings.Yahoo = lambda profile:\
dict(registration_id = profile["identifier"],
email = profile["email"],
first_name = str(profile["name"]['formatted']),
last_name = "")

#from gluon.contrib.login_methods.gae_google_account import GaeGoogleAccount
'''
auth.settings.login_form=GaeGoogleAccount()
form = auth.login(next=URL(r=request, c='default', f='index'))
return dict(login_form=form)
'''

#########################################################################
## Define your tables below (or better in another model file) for example
##
## >>> db.define_table('mytable',Field('myfield','string'))
##
## Fields can be 'string','text','password','integer','double','boolean'
##       'date','time','datetime','blob','upload', 'reference TABLENAME'
## There is an implicit 'id integer autoincrement' field
## Consult manual for more options, validators, etc.
##
## More API examples for controllers:
##
## >>> db.mytable.insert(myfield='value')
## >>> rows=db(db.mytable.myfield=='value').select(db.mytable.ALL)
## >>> for row in rows: print row.id, row.myfield
#########################################################################

## after defining tables, uncomment below to enable auditing
# auth.enable_record_versioning(db)

import datetime
now=datetime.datetime.now()
if auth.is_logged_in():
   me=auth.user.id
else:
   me=None

db.define_table('alluploads',
    Field('filename',requires=IS_NOT_EMPTY()),
    Field('uploadfile','upload',requires=IS_NOT_EMPTY()),
    Field('description','text',requires=IS_NOT_EMPTY()),
    Field('datecreated','datetime',default=now, writable=False),
    Field('datemodified','datetime',default=now, writable=False),
    Field('uploadedBy',db.auth_user, default=auth.user_id, writable=False))

db.auth_user._format = '%(first_name)s %(last_name)s'

db.define_table('sharedFiles',
    Field('fileID','reference alluploads',readable=False, writable=False),
    Field('sharedWith','reference auth_user'))

db.define_table('bookmark',
    Field('fileID','reference alluploads',readable=False, writable=False),
    Field('userID',db.auth_user, default=auth.user_id, writable=False),
    Field('bookmarkdate','datetime',default=now, writable=False))

db.define_table('comments',
    Field('fileID', 'reference alluploads',readable=False, writable=False),
    Field('userID',db.auth_user, default=auth.user_id, writable=False),
    Field('body','text'),
    auth.signature)

def author(id):
    if id is None:
        return "Unknown"
    else:
        user = db.auth_user(id)
        return '%(first_name)s %(last_name)s' %user