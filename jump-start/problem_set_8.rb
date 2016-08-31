
require 'byebug'
# ------------------------------------------------------------------------------
# Instructions
# ------------------------------------------------------------------------------
# This file is in the same format as your assessments.
#
# Make sure everything puts out as 'true' when you run the file.
#
# Give yourself an hour to complete this assessment.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
#
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  If you forget a particular ruby method, write it yourself.
#
# Test your code with a few cases in addition to the ones we give
# you.  When we grade you, we use different test cases to make sure your logic
# is sound.
#
# Look at the test cases below the problem before you approach it.
# Use the debugger when code doesn't run how you expect.
# ------------------------------------------------------------------------------

# Greatest Common Factor
# ------------------------------------------------------------------------------
# Return the greatest number which is a factor of both inputs.
#
# The greatest common factor of 6 and 10 is 2
# the greatest common factor of 10 and 15 is 5

def greatest_common_factor(first_number, second_number)

  greatest_number = first_number >= second_number ? first_number : second_number
  greatest_number.downto(1) do |factor|
    return factor if first_number%factor == 0 && second_number%factor == 0
  end
  1
end

puts "-------Greatest Common Factor-------"

puts greatest_common_factor(6, 10) == 2
puts greatest_common_factor(10, 15) == 5
puts greatest_common_factor(4, 7) == 1
puts greatest_common_factor(4, 8) == 4

# Panoramic Pairs
# ------------------------------------------------------------------------------
# You have a panoramic view in front of you, but you only can take a picture of
# two landmarks at a time (your camera is small).  You want to capture every
# pair of landmarks that are next to each other.
#
# Given an array of landmarks, return every adjacent pair from left to right.
# Assume the panorama wraps around.

def panoramic_pairs(landmarks)
  pairs = []

  landmarks.each_with_index do |landmark,idx|
    # byebug
    break if idx == landmarks.length-1
    pairs << [landmark,landmarks[idx+1]]
  end
  pairs << [landmarks[-1], landmarks[0]]
  pairs
end

puts "-------Panoramic Pairs-------"

landmarks_1 = ["House", "Horse"]
pairs_1 = [["House", "Horse"], ["Horse", "House"]]

puts panoramic_pairs(landmarks_1) == pairs_1

landmarks_2 = ["Tree", "Mountain", "Ocean", "Cottage"]
pairs_2 = [["Tree", "Mountain"], ["Mountain", "Ocean"], ["Ocean", "Cottage"], ["Cottage", "Tree"]]

puts panoramic_pairs(landmarks_2) == pairs_2


# Two Degrees of Separation
# ------------------------------------------------------------------------------
# You have a hash that represents all of Facebook (lookit you).  Each key is the
# name of a person on facebook, and each value is an array of all their friends.
# Assume everyone on Facebook has a different name.
#
# Given Facebook and the name of a person, return an array of all the friends
# of their friends. Do not include the original person or their immediate friends.


def two_degrees_away(facebook, name)
  friends_of_friend = []
  facebook.each do |person, friends|
    friends.each do |friend|
      friends_of_friend += facebook[friend]
    end
    friends_of_friend.delete(name)
    facebook[name].each do |friend|
      friends_of_friend.delete(friend)
    end

  end

  friends_of_friend.uniq
end


puts "-------Two Degrees of Separation-------"

facebook_1 = {
  "Harry Potter" => ["Ron Weasley"],
  "Ron Weasley" => ["Harry Potter", "Fred Weasley"],
  "Fred Weasley" => ["Ron Weasley"]
}

friends_1 = ["Fred Weasley"]

puts two_degrees_away(facebook_1, "Harry Potter") == friends_1


facebook_2 = {
  "Mark Zuckerberg" => ["Eduardo Saverin", "Dustin Moskovitz", "Sean Parker"],
  "Eduardo Saverin" => ["Mark Zuckerberg", "Tyler Winklevoss", "Cameron Winklevoss", "Dustin Moskovitz"],
  "Tyler Winklevoss" => ["Eduardo Saverin"],
  "Cameron Winklevoss" => ["Eduardo Saverin"],
  "Dustin Moskovitz" => ["Mark Zuckerberg", "Eduardo Saverin"],
  "Sean Parker" => ["Mark Zuckerberg"]
}

friends_2 = ["Tyler Winklevoss", "Cameron Winklevoss"]

puts two_degrees_away(facebook_2, "Mark Zuckerberg") == friends_2


# Assign Pods
# ------------------------------------------------------------------------------
# You are a JumpStart TA and you need to assign students to sit with other
# students who are at the same place in the curriculum.
#
# Given a list of students ordered by how far they are in the course and a
# list of pods, return their seat assignments.  Assume you can only seat four
# people per pod.  "Fill up" each pod as you go.  It's OK to have a pod with
# four people and the next pod with one person).  It's OK to have empty pods
# if there aren't enough students.

def assign_pods(students, pods)

  pods_students = Hash.new([])
  students.each do |student|
    pods.each do |pod|
      # byebug
      if pods_students[pod].length < 4
        pods_students[pod]+= [student]
        break
      end
    end
  end
  pods_students
  #
  # your code goes here
  #
end

puts "-------Assign Pods-------"

students_1 = [
  "Scott",
  "Asher",
  "Julie",
  "Rick",
  "Jeff",
  "Brooke",
  "Sandra",
  "Jim",
  "Pete",
  "Marta",
  "Tanna"
]

pods_1 = [
  "Fremont",
  "Berkeley",
  "San Ramon"
]


expected_pod_assignment_1 = {
  "Fremont" => ["Scott", "Asher", "Julie", "Rick"],
  "Berkeley" => ["Jeff", "Brooke", "Sandra", "Jim"],
  "San Ramon" => ["Pete", "Marta", "Tanna"]
}

students_2 = [
  "Scott",
  "Asher",
  "Julie",
  "Rick",
  "Jeff",
  "Brooke",
  "Sandra",
  "Jim",
  "Pete",
  "Marta",
  "Tanna",
  "Fred",
  "George"
]

pods_2 = [
  "Fremont",
  "Berkeley",
  "San Ramon",
  "Oakland"
]


expected_pod_assignment_2 = {
  "Fremont" => ["Scott", "Asher", "Julie", "Rick"],
  "Berkeley" => ["Jeff", "Brooke", "Sandra", "Jim"],
  "San Ramon" => ["Pete", "Marta", "Tanna", "Fred"],
  "Oakland" => ["George"]
}

puts assign_pods(students_1, pods_1) == expected_pod_assignment_1
puts assign_pods(students_2, pods_2) == expected_pod_assignment_2


# Remove Letter 'A'
# ------------------------------------------------------------------------------
# Given a list of words, remove all the occurrences of the letter 'a' in those
# words.

def remove_letter_a(words)

  words.map! do |word|
    word.gsub("a","")
  end
  words

end

puts "-------Remove Letter 'A'-------"

words_1 = ["blueberry", "apple", "banana", "peach"]
without_a_1 = ["blueberry", "pple", "bnn", "pech"]

words_2 = ["syllabus", "smirk", "salamander", "saaaaaaa"]
without_a_2 = ["syllbus", "smirk", "slmnder", "s"]

puts remove_letter_a(words_1) == without_a_1
puts remove_letter_a(words_2) == without_a_2


# Care Bear Summary
# ------------------------------------------------------------------------------
# You have a calendar of hugs that care bears made (given as a list of
# names by care bears).  Some of them have hugged multiple
# times in a row.
#
# Return a hash where the keys are the care bears and the values are an array
# of all of the start and end days of their hugging streaks.
#
# Days are the index of the calendar array.

def care_bear_summary(calendar_of_hugs)

  #ID a sequence
  #calendar.each_with_index |bear,day|
    #break if day == calendar.length-1
    #if bear == calendar[day]+1,  && !sequence I have a sequence
      #start_day = day
      #sequence = true
    #end

    #if bear != calendar[day]+1,  && sequence, I'm stopping a sequence
      #end_day = day
      #sequence = false
      #bear_hash[bear] = [start_day,end_day]
    #end

  bear_hash = Hash.new{|hash,key| hash[key] = []}
  sequence = false
  start_day=0
  calendar_of_hugs.each_with_index do |bear, day|
    break if day == calendar_of_hugs.length-1
    next_bear = calendar_of_hugs[day+1]
    if bear ==  next_bear && !sequence #I have a sequence
      start_day = day
      sequence = true
    end

    if bear != next_bear && sequence #I'm stopping a sequence
      # byebug
      end_day = day
      sequence = false
      bear_hash[bear] = bear_hash[bear].push([start_day,end_day])
    end
  end
  bear_hash.reject {|bear,arr| arr.length==0}
end

puts "-------Care Bear Summary-------"

hug_calendar_1 = [
  "Birthday Bear",
  "Bedtime Bear",
  "Birthday Bear",
  "Birthday Bear",
  "Bedtime Bear"
]

care_bear_counts_1 = {
  "Birthday Bear" => [[2, 3]]
}

hug_calendar_2 = [
  "Birthday Bear",
  "Birthday Bear",
  "Cheer Bear",
  "Bedtime Bear",
  "Bedtime Bear",
  "Birthday Bear",
  "Birthday Bear",
  "Birthday Bear",
  "Bedtime Bear",
  "Friend Bear"
]

care_bear_counts_2 = {
  "Birthday Bear" => [[0, 1], [5, 7]],
  "Bedtime Bear" => [[3, 4]]
}

puts care_bear_summary(hug_calendar_1) == care_bear_counts_1
puts care_bear_summary(hug_calendar_2) == care_bear_counts_2


# Number Counting Sequence
# ------------------------------------------------------------------------------
# The number counting sequence is a sequence of number strings that begins with:
# ["1", "11", "21", "1211", "111221", ...]
#
# "1" is counted as "one 1" or "11", followed by
# "11" which is counted as "two 1s" or "21", followed by
# "21" which is counted as "one 2 and one 1" or "1211", and so on.
#
# It helps to "say it out loud" to describe the item in the sequence.
#
# Given an integer n, generate the n-th element in the number counting sequence.

def number_counting_seq(n)
  #IN THIS ORDER:
    #if I find a 2, I write 12
    #if I find a 11, I write 21
    #if I find a 111, I write 31
    #if I find a 1, I write 11
    #Need to ID a sequence.
    #counter = 1
    #counter += 1 if n[idx] == n[idx+1]
    #n[idx] != n[idx+1], I write "counter.to_s + n.to_s"
    #

    sequence = n>0 ? "1" : ""
    counter = 1
    for num in 1...n
      # byebug
      counter+= 1 if sequence[num-1] == sequence[num]
      sequence += counter.to_s + num.to_s
    end

    p sequence

end



puts "-------Number Counting Sequence-------"
puts number_counting_seq(0) == ""
puts number_counting_seq(1) == "1"
puts number_counting_seq(2) == "11" # one 1 above
puts number_counting_seq(3) == "21" # two 1s above
# ...
# 4 111221
# 5 111221
# 6 312211
# 7 13112221
# 8 1113213211

puts number_counting_seq(5) == "111221" #the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == "1113213211"
puts number_counting_seq(10) == "13211311123113112211"

puts '-----'

def bla
  # var_a = 0
  arr = [1,2,3,4,5,6,7,8,9,10]
  for num in 0...arr.length
    var_a = arr[num]
  end
  puts var_a
end

bla
