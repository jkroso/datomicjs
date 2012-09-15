{ Datomic } = require '../coffee/datomic'
schema = require './schema'

describe 'Datomic DB', ->

  datomic = new Datomic 'localhost', 8888, 'db', 'test'

  it 'should create a DB', (done) ->
    
    datomic.createDatabase (err, created) ->
      datomic.db (err, db) ->
        db.should.include datomic.name
        done()

  it 'should make transactions', (done) ->

    datomic.transact schema.movies, (err, future) ->
      future.should.include ':db-after'
      done()
