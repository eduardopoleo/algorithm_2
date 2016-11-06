#!/usr/bin/env ruby
length = STDIN.gets.chomp
input = STDIN.gets.chomp
input = input.split().map(&:to_i).sort

STDOUT.write input[-2]*input[-1]
