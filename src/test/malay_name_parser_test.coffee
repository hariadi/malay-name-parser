parser = require '../lib/malay-name-parser'
assert = require 'should'

describe "Malay Name Parser", ->

    describe "given the format 'title title first middle last'", ->

         it "should parse correctly with multiple title", ->
            name = parser.parse_malay_name 'Dato\' Ir. Dr. Hariadi Hinta'
            should_equal name, ['Dato\' Ir. Dr.', 'Hariadi', '', 'Hinta', '']

    describe "given the format 'title first middle(s) last suffix'", ->

        it "should parse correctly with a title 'En.'", ->
            name = parser.parse_malay_name 'En. Hariadi Hinta'
            should_equal name, ['En.', 'Hariadi', '', 'Hinta', '']

    describe "given the format 'title first middle(s) last'", ->

        it "should parse correctly with a title 'Tan Sri'", ->
            name = parser.parse_malay_name 'Tan Sri Hariadi Hinta'
            should_equal name, ['Tan Sri', 'Hariadi', '', 'Hinta', '']

        it "should parse correctly with a title 'Dato\'", ->
            name = parser.parse_malay_name 'Dato\' Hariadi Hinta'
            should_equal name, ['Dato\'', 'Hariadi', '', 'Hinta', '']

    describe "given the format 'first last'", ->

        it "should parse correctly with no title first last", ->
            name = parser.parse_malay_name 'Hariadi Bin Hinta'
            should_equal name, ['', 'Hariadi', '', 'Bin Hinta', '']

    describe "given the format 'first'", ->

        it "should parse correctly with only first name", ->
            name = parser.parse_malay_name 'Hariadi'
            should_equal name, ['', 'Hariadi', '', '', '']

should_equal = (parsed_name, names) ->
    assert.equal parsed_name.title(), names[0]
    assert.equal parsed_name.first, names[1]
    assert.equal parsed_name.middle(), names[2]
    assert.equal parsed_name.last(), names[3]
    assert.equal parsed_name.suffix(), names[4]

