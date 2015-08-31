var path = require('path');
var sassTrue = require('sass-true');

var sassFile = path.join(__dirname, 'scss', 'test.scss');
sassTrue.runSass({file: sassFile}, describe, it);
