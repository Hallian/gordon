// Generated by CoffeeScript 1.8.0
(function() {
  var fs;

  fs = require('fs');

  fs.readFile(process.argv[2], function(err, metadata) {
    var dep, deps, version, _i, _len, _ref, _results;
    metadata = JSON.parse(metadata);
    deps = [];
    _ref = metadata.dependencies;
    for (dep in _ref) {
      version = _ref[dep];
      deps.push(dep);
    }
    if (process.argv[3] === '-1') {
      _results = [];
      for (_i = 0, _len = deps.length; _i < _len; _i++) {
        dep = deps[_i];
        _results.push(console.log(dep));
      }
      return _results;
    } else {
      return console.log(deps.join(' '));
    }
  });

}).call(this);
