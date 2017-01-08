# call-delayed [![Build Status](https://travis-ci.org/braveg1rl/call-delayed.png?branch=master)](https://travis-ci.org/braveg1rl/call-delayed) [![Dependency Status](https://david-dm.org/braveg1rl/call-delayed.png)](https://david-dm.org/braveg1rl/call-delayed)

setTimeout, but with arguments reversed.

## Rationale

It gets tiring to write
```javascript
function delay(time,fn) {setTimeout(fn,time)}
```
You'll get some nice assertions as a bonus.

## Usage

```javascript
var delay = require("call-delayed")
delay(100, function{ console.log("Execution of this function has been delayed by 100ms.")})
```

## License

call-delayed is released under the [MIT License](http://opensource.org/licenses/MIT).
Copyright (c) 2017 Braveg1rl
