$stdout.sync = true

students = []
eye_colors = []
ages = []
blood = []


File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
	blood.push(info[3].strip)
end

def amount_of_brown (eye_colors)
	brown_eyes = 0
	eye_colors.each do |color|
		if color == "Brown"
			brown_eyes = brown_eyes + 1
		end
	end
	return brown_eyes
end



def list_of_drivers (ages, students)
	drivers = []
	ages.each_with_index do |old, i|
		if old >= 16
			drivers.push(students[i])
		end
	end
	return drivers
end


def amount_of_green_girls (eye_colors, students)
	green_girls = []
	eye_colors.each_with_index do |color, i|
		if color == "Green" && i % 2 == 0
			green_girls.push(students[i])
		end
	end
	return green_girls
end

def vowels(ages, students)
	sophmores = []
	letters = []
	most_vowels = 0
	best_name = ""
	ages.each_with_index do |age, i|
		if age == 15
			sophmores.push(students[i])
		end
	end

	sophmores.each do |sophmore|
		if vowel_check(sophmore) > most_vowels
			most_vowels = vowel_check(sophmore)
			best_name = sophmore
		end
	end
	return best_name
end

def vowel_check(string)
	vowels = 0
	string.each_char do |letters|
		if letters == 'a' || letters == 'e' || letters == 'i' || letters == 'o' || letters == 'u'
			vowels += 1
		end
	end
	return vowels
end


def age_of_green (ages, eye_colors)
	average = []
	average_age = 0
	number = 0
	eye_colors.each_with_index do |color, i|
		if color == "Green"
			average.push(ages[i])
			number += 1
		end
	end
	average.each do |age|
		average_age = average_age + age
	end

	return average_age / number
end

def blood_donor (blood, students, student)
	donors = []
	number_of_donors = 0
	type = ""

	students.each_with_index do |kid, i|
		if kid == student
			type = blood[i]
		end
	end

	if type == "A"
		blood.each_with_index do |types, i|
			if types == "O" || types == "A"
				donors.push(students[i])
				number_of_donors += 1
			end
		end
	elsif type == "AB"
		blood.each_with_index do |types, i|
			if types == "O" || types == "A" || types == "AB" || types == "B"
				donors.push(students[i])
				number_of_donors += 1
			end
		end
	elsif type == "B"
		blood.each_with_index do |types, i|
			if types == "O" || types == "B"
				donors.push(students[i])
				number_of_donors += 1
			end
		end
	elsif type == "O"
		blood.each_with_index do |types, i|
			if types == "O"
				donors.push(students[i])
				number_of_donors += 1
			end
		end
	end
	return donors
end





print students, "\n"
print eye_colors, "\n"
print ages, "\n"
print "\n"

print amount_of_brown(eye_colors), "\n"

print list_of_drivers(ages, students), "\n"


print amount_of_green_girls(eye_colors, students), "\n"

print vowels(ages, students), "\n"

print age_of_green(ages, eye_colors), "\n"

puts "What student are you checking?"
student = gets.chomp
print "#{student} can be donated to by ",blood_donor(blood, students, student)
