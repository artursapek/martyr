var page = require('webpage').create();

page.open('http://localhost:8888', function () {
  page.render('test.png');
  phantom.exit();
});

