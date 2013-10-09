# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
App.delete_all
apps = App.create([{app_title: 'ios', description: 'From iOS app'}, 
                   {app_title: 'android', description: 'From Android app'}, 
                   {app_title: 'web', description: 'From default web app'}, 
                   {app_title: 'unknown', description: 'From an unknown source'}])