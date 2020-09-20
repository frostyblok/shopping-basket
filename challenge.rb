require_relative './lib/challenge_runner'

file_name = ARGV.first

ChallengeRunner.new(file_name).run
