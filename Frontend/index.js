var express = require('express')
var app = express()

const { Pool, Client } = require('pg')
const pool = new Pool({
    host: 'localhost',
    port: '5432',
    user: 'postgres',
    password: 'do9452435',
    database: 'krankenhaus',
})
 
app.set('views', __dirname + '/public')
app.set('view engine', 'pug')
app.use(express.static(__dirname + '/public'))

app.get('/',function(req,resHTTP){
  resHTTP.render('index',
    { tablename: "nothing. Select your view :)"
    })
})

app.get('/arzt_overview',function(req,resHTTP){
  var tablename = 'arzt_overview'
  var querytext = 'select * from ' + tablename
  queryrender(tablename,querytext, resHTTP)

})

app.get('/recent_operations',function(req,resHTTP){
  var tablename = 'recent_operations'
  var querytext = 'select * from ' + tablename
  queryrender(tablename,querytext, resHTTP)

})

app.get('/fachbereich_overview',function(req,resHTTP){
  var tablename = 'fachbereich_overview'
  var querytext = 'select * from ' + tablename
  queryrender(tablename,querytext, resHTTP)

})

app.get('/personal_overview',function(req,resHTTP){
  var tablename = 'personal_overview'
  var querytext = 'select * from ' + tablename
  queryrender(tablename,querytext, resHTTP)
})

function queryrender(tablename,querytext,resHTTP){
  pool.query(querytext, (err, query) => {
    if (err) {
      throw err
    }
    else 
      var tablecontent = query.rows
      
      resHTTP.render('tableview',
      { tablename : tablename,
        keys: Object.keys(tablecontent[0]),
        tablecontent: tablecontent
      })
          
    })
}
app.listen(3000, function () {
  console.log('listening on port 3000!');
});
