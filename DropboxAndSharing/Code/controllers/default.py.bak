# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

from __future__ import with_statement # This isn't required in Python 2.6     
__metaclass__ = type
import os
import sys
import time
try:
    from PIL import Image
except ImportError:
    raise HTTP(200,"Requires the Python Imaging Library installed")
from gluon.contrib import simplejson as json
import urllib
import datetime
now=datetime.datetime.now()
split_path = os.path.split
split_ext = os.path.splitext
path_exists = os.path.exists
normalize_path = os.path.normpath
absolute_path = os.path.abspath 
encode_urlpath = urllib.quote_plus
output=os.path.join(request.folder,'static','test.txt')

import logging
logger = logging.getLogger("web2py.app.FIleSharing")
logger.setLevel(logging.DEBUG)

@auth.requires_login()
def index():
    q = db(db.bookmark.userID==auth.user_id)._select(db.bookmark.fileID)
    fav = db(db.alluploads.id.belongs(q)).select(orderby=~db.alluploads.datemodified,limitby=(0, 10))
    #response.flash = T("Welcome to Internal File Sharing App")
    query = db.alluploads.uploadedBy == auth.user_id
    #query = db.alluploads.uploadedBy == db.sharedFiles.Sharedwith
    db.alluploads.id.readable = False
    constraints = {'alluploads': query}
    #orderby=['datemodified']
    '''
        grid = SQLFORM.smartgrid(db.alluploads,linked_tables=['sharedFiles'], paginate=5,details=False,exportclasses=dict(csv_with_hidden_cols=False,xml=False,tsv_with_hidden_cols=False,tsv=False,json=False),orderby=orderby)
'''
    orderby=~db.alluploads.datemodified
    grid = SQLFORM.grid(query, paginate=5 ,details=False,deletable=False ,exportclasses=dict(csv_with_hidden_cols=False,xml=False,tsv_with_hidden_cols=False,tsv=False,json=False),orderby=orderby,
 links=[ lambda row:A('Share',_href=(URL('shareFile',args=[row.id,row.filename,row.uploadedBy])),_class="btn"),
        lambda row:A('comment',_href=(URL('listComment',args=[row.id])),_class="btn"),
        lambda row:A('Bookmark',_href=(URL('bookmark',args=[row.id])),_class="btn"),
        lambda row:A('Delete',_href=(URL('deleteFile',args=[row.id])),_class="btn")])
    return dict(grid=grid,fav=fav)
    #return locals()


@auth.requires_login()
def listComment():
    file_ID = request.args(0)
    if (not checkIfUserIsOwner(file_ID)) & (not checkIfFileIsSharedWthUser(file_ID)):
        session.flash = T('Not Authorised')
        redirect(request.env.http_referer)
        return dict()
    rows = db(db.comments.fileID == file_ID).select(orderby=~db.comments.created_on,limitby=(0, 10))
    return locals()

@auth.requires_login()
def postComment():
    file_ID = request.args(0)
    if (not checkIfUserIsOwner(file_ID)) & (not checkIfFileIsSharedWthUser(file_ID)):
        session.flash = T('Not Authorised')
        redirect(request.env.http_referer)
        return dict()
    db.comments.fileID.default = file_ID
    form = SQLFORM(db.comments)
    if form.process().accepted:
        urls = 'listComment/' + file_ID
        redirect(URL(urls))
    return locals()

def checkIfUserIsOwner(fileID):
    count = db((db.alluploads.id == fileID) & (db.alluploads.uploadedBy == auth.user_id)).count()
    if count == 1:
        return True
    else:
        return False

def checkIfFileIsSharedWthUser(file_ID):
    count = db((db.sharedFiles.fileID == file_ID) & (db.sharedFiles.sharedWith == auth.user_id)).count()
    if count == 1:
        return True
    else:
        return False

@auth.requires_login()
def deleteFile():
    file_ID = request.args(0)
    if not checkIfUserIsOwner(file_ID):
        session.flash = T('Not Authorised')
        redirect(request.env.http_referer)
        return dict()
    logger.debug("OK, coming on ondelete")
    db(db.alluploads.id == file_ID).delete()
    db.commit()
    #q = db(db.bookmark.userID==auth.user_id)._select(db.bookmark.fileID)
    #fav = db(db.alluploads.id.belongs(q)).select(orderby=~db.alluploads.datemodified)
    redirect(URL('index'))
    #redirect(request.env.http_referer)
    #return dict(fav=fav)
    
    '''
    appname=request.application
    return dict(appname=appname)
    
    test = "OK For index page"
    #return dict(message=T('Hello World'))
    return locals()
    '''

    '''
@auth.requires_login()
def upload():
    form = SQLFORM(db.alluploads).process()
    if form.accepted:
        response.flash = 'File Uploaded'
    return dict(form=form)
    '''
    '''
def sendEmail(form):
    c = form.vars.a * form.vars.b
    mail.send('hemal.thakkar@students.iiit.ac.in','Message subject','Plain text body of the message')
    return
    '''
        
@auth.requires_login()
def shareFile():
    file_ID = request.args(0)
    filename = request.args(1)
    if not checkIfUserIsOwner(file_ID):
        session.flash = T('Not Authorised')
        redirect(request.env.http_referer)
        return dict()
    db.sharedFiles.fileID.default = file_ID
    form = SQLFORM(db.sharedFiles)
    if form.process().accepted:
        userID = request.vars.sharedWith
        email = db(db.auth_user.id==userID).select(db.auth_user.email)
        msg = 'File '+ filename + ' is Shared with you!!'
        mail.send(str(email.last().email),'Internal File Sharing App Alert',msg)
        redirect(URL('index'))
    return locals()

@auth.requires_login()
def shared():
    #userID = auth.user_id
    #test = "OK"
    '''
    curs = db.cursor()
    curs.execute("select top 10 * from tablename where fieldA > 100")
    results = curs.fetchall()
    if results:
      for r in results:
        print r
    '''
    #db.child.parent.writable = False
    #filesIDs = db(db.sharedFiles.sharedWith==auth.user_id).select(db.sharedFiles.fileID)
    '''
    q = db(db.sharedFiles.sharedWith==auth.user_id)._select(db.sharedFiles.fileID)
    query = db.alluploads.id.belongs(q)
    #q = db()._select(db.a.f1)
    constraints = {'alluploads': query}
    orderby=~db.alluploads.datemodified
    grid = SQLFORM.grid(db.alluploads,constraints=constraints, paginate=5,details=False,deletable=False,editable=False,exportclasses=dict(csv_with_hidden_cols=False,xml=False,tsv_with_hidden_cols=False,tsv=False,json=False),orderby=orderby)
    '''
    q = db(db.bookmark.userID==auth.user_id)._select(db.bookmark.fileID)
    fav = db(db.alluploads.id.belongs(q)).select(orderby=~db.alluploads.datemodified,limitby=(0, 10))
    
    db.alluploads.id.readable = False
    q = db(db.sharedFiles.sharedWith==auth.user_id)._select(db.sharedFiles.fileID)
    orderby=~db.alluploads.datemodified
    grid = SQLFORM.grid(db.alluploads.id.belongs(q),
paginate=5,create=False,details=False,deletable=False,editable=False,orderby=orderby,exportclasses=dict(csv_with_hidden_cols=False,xml=False,tsv_with_hidden_cols=False,tsv=False,json=False),links=[ lambda row:A('comment',_href=(URL('listComment',args=[row.id])),_class="btn"),lambda row:A('Bookmark',_href=(URL('bookmark',args=[row.id])),_class="btn")])
    #return dict(grid=grid)
    return locals()

@auth.requires_login()
def bookmark():
    file_ID = request.args(0)
    if (not checkIfUserIsOwner(file_ID)) & (not checkIfFileIsSharedWthUser(file_ID)):
        session.flash = T('Not Authorised')
        redirect(request.env.http_referer)
        return dict()
    db.bookmark.insert(fileID=file_ID)
    redirect(request.env.http_referer)
    #response.flash = 'product purchased!'
    
def user():
    """
    exposes:
    http://..../[app]/default/user/login
    http://..../[app]/default/user/logout
    http://..../[app]/default/user/register
    http://..../[app]/default/user/profile
    http://..../[app]/default/user/retrieve_password
    http://..../[app]/default/user/change_password
    http://..../[app]/default/user/manage_users (requires membership in
    use @auth.requires_login()
        @auth.requires_membership('group name')
        @auth.requires_permission('read','table name',record_id)
    to decorate functions that need access control
    """
    return dict(form=auth())

@auth.requires_login()
def download():
    return response.download(request,db)
