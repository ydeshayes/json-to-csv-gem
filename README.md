# Json to CSV

This gem will convert a json array to csv

## Install
- Clone the repo
- `gem build .\jsonToCsv.gemspec`
- `gem install .\jsonToCsv-0.0.0.gem`

## Use
```ruby
require 'jsonToCsv'

JsonToCsv.convert('[{"foo": "bar", "test": "value"}]')
```

Result:
```
foo,test
bar,value
```

## Test
`rake test`
