students = []
eye_colors = []
ages = []
brown_eyes = 0

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
end

eye_colors.each do |color|
	if color == "Brown"
		brown_eyes = brown_eyes + 1
	end
end

print students, "\n"
print eye_colors, "\n"
print ages, "\n"
print "\n"
print brown_eyes
