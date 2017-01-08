callDelayed = require "../"
Bluebird = require "bluebird"
assert = require("chai").assert

describe "call-delayed", ->
  it "is a function", ->
    assert.typeOf callDelayed, "function"

  describe "first argument", ->
    it "cannot be lower than 0", ->
      try (callDelayed -1, ->) catch error then return
      throw new Error "No error was thrown."

    it "can be Number(0)", ->
      callDelayed new Number(0), ->

    it "can be `0`", ->
      callDelayed 0, ->

    it "can be `0.000`", ->
      callDelayed 0.000, ->

    it "cannot be `false`", ->
      try (callDelayed false, ->) catch error then return
      throw new Error "No error was thrown."

    it "cannot be string '0.000'", ->
      try (callDelayed "0.000", ->) catch error then return
      throw new Error "No error was thrown."

  describe "second argument", ->
    it "must be a function", ->
      try (callDelayed 10, "not a function") catch error then return
      throw new Error "No error was thrown."

  describe "when given good arguments", ->
    it "calls the supplied function", ->
      fnCalled = false
      fn = -> fnCalled = true
      callDelayed 1, fn
      Bluebird.resolve().delay(20).then -> assert fnCalled

  describe "when a timeout of 100 ms is set", ->
    callTime = Date.now()
    fnCalled = false
    elapsedTime = undefined
    fn = ->
      fnCalled = true
      elapsedTime = Date.now() - callTime
    callDelayed 100, fn

    it "calls the supplied function", ->
      Bluebird.resolve().delay(150).then -> assert fnCalled

    it "calls the supplied function not later than 120ms", ->
      Bluebird.resolve().delay(150).then -> assert.isBelow elapsedTime, 120

    it "calls the supplied function not sooner than 90ms", ->
      Bluebird.resolve().delay(150).then -> assert.isAbove elapsedTime, 90
