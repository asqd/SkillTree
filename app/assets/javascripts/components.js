//= require_tree ./components

var React = window.React = global.React = require('react');
var ReactDOM = window.ReactDOM = global.ReactDOM = require('react-dom');

global.TestComponent = require( './components/test_component' ).default;
require('./components');