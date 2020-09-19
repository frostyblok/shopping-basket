require_relative './lib/challenge_runner'

file_name = ARGV.first

Runner.new(file_name).run
