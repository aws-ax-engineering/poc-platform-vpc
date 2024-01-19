# frozen_string_literal: true
require 'awspec'
require 'json'

#tfvars = JSON.parse(File.read('environments/' + ENV['WORKSPACE'] + '.tfvars.json'))
tfvars = JSON.parse(File.read('environments/pocdev' +  + '.tfvars.json'))

vpc = tfvars["instance_name"] + "-vpc"

describe vpc(vpc) do
  it { should exist }
end