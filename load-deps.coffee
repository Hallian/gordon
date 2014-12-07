fs = require 'fs'

fs.readFile process.argv[2], (err, metadata) ->
    metadata = JSON.parse(metadata)
    deps = []
    deps.push dep for dep, version of metadata.dependencies
    if process.argv[3] == '-1'
        console.log dep for dep in deps
    else
        console.log deps.join ' '