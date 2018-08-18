var x2, y2, button2 : int
var x, y, button : int
var x4, y4, button4 : int
var x3, y3, button3 : int
var x7, y7, button7 : int

%Variables for Printing Operation
var info_option : string
var info : int
var y_list : int := 520
var choice : string := " "
var get_name : string := ""
var name : array 1 .. 100 of string
var option : array 1 .. 100 of string
var intfont3 : int
var leave : int := 0
intfont3 := Font.New ("Arial:18")

var nick : array 1 .. 100 of string
var tel : array 1 .. 100 of real
var email : array 1 .. 100 of string
var address : array 1 .. 100 of string
% Maybe add this :var birthday : array 1 .. 100 of int
var group : array 1 .. 100 of string

var j : int := 1
var remove : int := 0
var t : int
setscreen ("graphics")
var font : int
font := Font.New ("serif:6")

procedure grid
    for x : 10 .. maxx by 10
	for y : 10 .. maxy by 10
	    drawdot (x, y, black)
	end for
    end for
    for x : 10 .. maxx by 20
	Draw.Text (intstr (x), x - 3, maxy - 6, font, black)
    end for
    for y : 20 .. maxy by 20
	Draw.Text (intstr (y), maxx - 12, y - 3, font, black)
    end for
end grid
%Background and Screen Size
setscreen ("graphics:400;600")
Draw.FillBox (0, maxy, maxx, 0, 30)

%Contacts App Icon
var picID : int
picID := Pic.FileNew ("contacts.jpg")
Pic.Draw (picID, 80, 185, picCopy)
Pic.Free (picID)

%Transition to Contacts
Mouse.ButtonChoose ("multibutton")
loop
    Mouse.Where (x, y, button)
    if button = 1 and x > 80 and x < 315 and y > 185 and y < 420 then
	cls
	exit
    end if
end loop
%Loop Begins
loop
    for i : j .. 100
	%Background
	Draw.FillBox (0, maxy, maxx, 0, 30)

	%Top "Contacts" Banner
	Draw.FillBox (0, maxy, maxx, 560, 8)
	var intfont : int
	intfont := Font.New ("Arial:25:bold")
	Font.Draw ("Contacts", 120, 570, intfont, black)

	%Plus Button
	Font.Draw ("+", 351, 570, intfont, black)
	Draw.Oval (360, 580, 12, 12, black)
	Draw.Oval (360, 580, 13, 13, black)
	Draw.Fill (355, 585, white, black)

	%Search Bar
	Draw.FillBox (43, 550, 363, 530, white)
	Draw.FillOval (43, 540, 10, 10, white)
	Draw.FillOval (363, 540, 10, 10, white)
	Draw.Oval (48, 541, 6, 6, black)
	Draw.Line (51, 536, 53, 532, black)
	%Search Bar Text
	var intfont2 : int
	intfont2 := Font.New ("Arial:17")
	Font.Draw ("Search in all contacts", 70, 532, intfont2, black)

	%Long Divider
	Draw.Line (0, 520, maxx, 520, black)

	%2nd Add Contact Prompt
	Font.Draw ("+    Add New Contact", 10, 497, intfont3, black)
	%Long Divider
	Draw.Line (0, 490, maxx, 490, black)
	%Long Divider
	Draw.Line (0, 480, maxx, 480, black)

	%2nd Add Contact Prompt
	intfont3 := Font.New ("Arial:18")
	Font.Draw ("      Display Contact", 10, 457, intfont3, black)
	%Long Divider
	Draw.Line (0, 450, maxx, 450, black)

	%Long Divider
	Draw.Line (0, 440, maxx, 440, black)

	%2nd Add Contact Prompt
	intfont3 := Font.New ("Arial:18")
	Font.Draw ("      Remove Contact", 10, 417, intfont3, black)
	%Long Divider
	Draw.Line (0, 410, maxx, 410, black)

	%Transition to New Contact
	Mouse.ButtonChoose ("multibutton")
	loop
	    Mouse.Where (x2, y2, button2)
	    if button2 = 1 and x2 > 350 and x2 < 370 and y2 > 570 and y2 < 590 or button2 = 1 and x2 > 0 and x2 < maxx and y2 > 480 and y2 < 520 then
		choice := "1"
		delay (350)
		cls
		Draw.FillBox (0, maxy, maxx, 0, 30)
		Draw.FillBox (0, maxy, maxx, 560, 8)
		Font.Draw ("New Contact", 100, 570, intfont, black)

		j := j + 1
		%Contacts Icon
		var picID2 : int
		picID2 := Pic.FileNew ("contact.bmp")
		Pic.Draw (picID2, 20, 400, picCopy)
		Pic.Free (picID2)
		%Font for Name,Phone Number, etc.
		var intfont4 : int
		intfont4 := Font.New ("Arial:20")

		%Name
		Font.Draw ("Name:", 170, 510, intfont4, black)
		locatexy (170, 490)
		get get_name : *
		name (i) := get_name
		%Nickname
		Font.Draw ("Nickname:", 170, 445, intfont4, black)
		locatexy (170, 425)
		get nick (i)
		%Mobile Number
		Font.Draw ("Mobile Number:", 20, 370, intfont4, black)
		locatexy (20, 350)
		get tel (i)
		%Email
		Font.Draw ("E-mail:", 20, 290, intfont4, black)
		locatexy (20, 270)
		get email (i)
		%Address
		Font.Draw ("Address:", 20, 210, intfont4, black)
		locatexy (20, 190)
		get address (i)
		%Add
		Font.Draw ("Add to Group:", 110, 120, intfont4, black)

		%Family-Group
		Draw.Box (10, 105, 100, 70, black)
		Font.Draw ("Family", 15, 80, intfont4, black)

		%Friends-Group
		Draw.Box (130, 105, 230, 70, black)
		Font.Draw ("Friends", 135, 80, intfont4, black)

		%Co-workers-Group
		Draw.Box (250, 105, 395, 70, black)
		Font.Draw ("Co-workers", 255, 80, intfont4, black)
		%Adding to Groups using Buttons
		Mouse.ButtonChoose ("multibutton")
		loop
		    Mouse.Where (x4, y4, button4)
		    if button4 = 1 and x4 > 10 and x4 < 100 and y4 > 70 and y4 < 105 then
			group (i) := "Family"
			exit
		    elsif button4 = 1 and x4 > 130 and x4 < 230 and y4 > 70 and y4 < 105 then
			group (i) := "Friends"
			exit
		    elsif button4 = 1 and x4 > 250 and x4 < 395 and y4 > 70 and y4 < 105 then
			group (i) := "Co-workers"
			exit
		    end if
		end loop
		%Save-Button to be made
		Draw.Box (317, 568, 375, 592, black)
		Draw.Fill (318, 572, white, black)
		Font.Draw ("Save", 320, 572, intfont3, black)
		%Transition to Contacts Main Page
		Mouse.ButtonChoose ("multibutton")
		loop
		    Mouse.Where (x3, y3, button3)
		    if button3 = 1 and x3 > 320 and x3 < 370 and y3 > 570 and y3 < 590 then
			delay (100)
			cls
			exit
		    end if
		end loop
		exit

	    elsif button2 = 1 and x2 > 0 and x2 < maxx and y2 > 450 and y2 < 480 then
		choice := "2"
		cls
		%Background
		Draw.FillBox (0, maxy, maxx, 0, 30)

		%Top "Contacts" Banner
		Draw.FillBox (0, maxy, maxx, 560, 8)
		intfont := Font.New ("Arial:25:bold")
		Font.Draw ("Contact List", 90, 570, intfont, black)
		for k : 1 .. j - 1
		    Font.Draw (intstr (k), 10, y_list, intfont3, black)
		    Font.Draw (name (k), 40, y_list, intfont3, black)
		    y_list := y_list - 40
		end for

		Font.Draw ("More Info about Contacts (y)", 55, y_list, intfont3, blue)
		Font.Draw ("Back To Contacts Page (n)", 61, y_list - 35, intfont3, red)
		%grid
		%Get y/n
		Draw.Box (190, y_list - 50, 210, y_list - 75, black)
		Draw.Fill (191, y_list - 52, white, black)
		locatexy (196, y_list - 57)
		get info_option

		if info_option = "y" then %For better viewing, the user can choose the contact they want to see
		    Font.Draw ("Choose a Contact (1,2,3, etc.)", 40, y_list - 105, intfont3, purple)
		    locatexy (195, y_list - 125)
		    get info
		    grid
		    Font.Draw ("Here's more info about ", 20, y_list - 150, intfont3, black)
		    Font.Draw (name (info), 270, y_list - 150, intfont3, black)
		    Font.Draw ("Name: ", 20, y_list - 180, intfont3, black)
		    Font.Draw (name (info), 130, y_list - 180, intfont3, black)
		    Font.Draw ("Phone Number: ", 20, y_list - 210, intfont3, black)
		    Font.Draw ("Email: ", 20, y_list - 240, intfont3, black)
		    Font.Draw (email (info), 130, y_list - 240, intfont3, black)
		    Font.Draw ("Address: ", 20, y_list - 270, intfont3, black)
		    Font.Draw (address (info), 130, y_list - 270, intfont3, black)
		    %Exit Button
		    %Save-Button to be made
		    Draw.Box (317, 568, 375, 592, black)
		    Draw.Fill (318, 572, white, black)
		    Font.Draw ("Exit", 325, 572, intfont3, black)
		    %Transition to Contacts Main Page
		    Mouse.ButtonChoose ("multibutton")
		    loop
			Mouse.Where (x7, y7, button7)
			if button7 = 1 and x7 > 320 and x7 < 370 and y7 > 570 and y7 < 590 then
			    leave := 0
			    delay (100)
			    cls
			    leave := 1

			    exit
			end if
		    end loop
		    if leave = 1 then
			exit
		    end if
		elsif info_option = "n" then
		    cls
		    exit

		end if

	    end if
	end loop

    end for

end loop




