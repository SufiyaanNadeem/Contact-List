%Variables for Buttons
var x, y, button : int
var x2, y2, button2 : int
var x3, y3, button3 : int
var x4, y4, button4 : int
var x5, y5, button5 : int

%Variables for Fonts
var intfont : int := Font.New ("Arial:25:bold")
var intfont2 : int := Font.New ("Arial:17")
var intfont3 : int := Font.New ("Arial:18")
var intfont4 : int := Font.New ("Arial:20")

%Loop Counter
var j : int := 1
var w : int := 0
%Variables for Getting Contact Information (Can be left empty)
var get_nick : string := ""
var nick : array 1 .. 100 of string
var get_email : string := ""
var email : array 1 .. 100 of string
var get_address : string := ""
var address : array 1 .. 100 of string

%Variables for Getting Contact Information (Cannot be left empty)
var name : array 1 .. 100 of string
var tel : array 1 .. 100 of string
var group : array 1 .. 100 of string

%Choice Variables
var choice : string := ""
var more_info_option : string
var contact_info : int

%Variable for Printing
var y_list : int := 520

%Variables for Editing Operation
var to_edit : int
var par_edit : int

%Variables for Removing Operation
var remove : int := 0
var t : int

%Background and Screen Size
setscreen ("graphics:400;600")
Draw.FillBox (0, maxy, maxx, 0, 30)

%Contacts App Icon
var picID : int
picID := Pic.FileNew ("contacts1.jpg")
Pic.Draw (picID, 0, 0, picCopy)
Pic.Free (picID)

%Transition to Contacts Main Page
Mouse.ButtonChoose ("multibutton")
loop
    Mouse.Where (x, y, button)
    if button = 1 and x > 290 and x < 340 and y > 200 and y < 260 then
	cls
	exit
    end if
end loop

%Loop for Choice Begins
loop
    for i : j .. 100
	%Background
	Draw.FillBox (0, maxy, maxx, 0, 30)

	%Top "Contacts" Banner
	Draw.FillBox (0, maxy, maxx, 560, 8)
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
	Font.Draw ("Search in all contacts", 70, 532, intfont2, black)

	%Long Divider
	Draw.Line (0, 520, maxx, 520, black)
	%2nd Add Contact Prompt
	Font.Draw ("+    Add New Contact", 10, 497, intfont3, black)
	%Long Divider
	Draw.Line (0, 490, maxx, 490, black)
	if j > 1 then
	    %Long Divider
	    Draw.Line (0, 480, maxx, 480, black)
	    %Display Contact Prompt
	    Font.Draw ("      Display Contact", 10, 457, intfont3, black)
	    %Long Divider
	    Draw.Line (0, 450, maxx, 450, black)

	    %Long Divider
	    Draw.Line (0, 440, maxx, 440, black)
	    %Remove Contact Prompt
	    Font.Draw ("      Remove Contact", 10, 417, intfont3, black)
	    %Long Divider
	    Draw.Line (0, 410, maxx, 410, black)

	    %Long Divider
	    Draw.Line (0, 400, maxx, 400, black)
	    %Edit Contact Prompt
	    Font.Draw ("      Edit Contact", 10, 377, intfont3, black)
	    %Long Divider
	    Draw.Line (0, 370, maxx, 370, black)

	    %Long Divider
	    Draw.Line (0, 360, maxx, 360, black)
	    %View Groups Prompt
	    Font.Draw ("      View Groups", 10, 337, intfont3, black)
	    %Long Divider
	    Draw.Line (0, 330, maxx, 330, black)
	end if
	%iPhone Home Button/choice "6" to exit
	var picID4 : int
	picID4 := Pic.FileNew ("back.jpg")
	Pic.Draw (picID4, 130, 40, picCopy)
	Pic.Free (picID4)

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

		%Contacts Face Icon
		var picID2 : int
		picID2 := Pic.FileNew ("contact.bmp")
		Pic.Draw (picID2, 20, 400, picCopy)
		Pic.Free (picID2)

		%Name
		Font.Draw ("Name:", 170, 510, intfont4, black)
		locatexy (170, 490)
		get name (i)
		%Nickname
		Font.Draw ("Nickname:", 170, 445, intfont4, black)
		locatexy (170, 425)
		get get_nick : *
		nick (i) := get_nick
		%Mobile Number
		Font.Draw ("Mobile Number:", 20, 370, intfont4, black)
		locatexy (20, 350)
		get tel (i)
		%Email
		Font.Draw ("E-mail:", 20, 290, intfont4, black)
		locatexy (20, 270)
		get get_email : *
		email (i) := get_email
		%Address
		Font.Draw ("Address:", 20, 210, intfont4, black)
		locatexy (20, 190)
		get get_address : *
		address (i) := get_address
		%Add to Group
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

		%Save-Button
		Draw.Box (317, 568, 375, 592, black)
		Draw.Fill (318, 572, white, black)
		Font.Draw ("Save", 320, 572, intfont3, black)
		%Transition to Main Contacts Page
		Mouse.ButtonChoose ("multibutton")
		loop
		    Mouse.Where (x3, y3, button3)
		    if button3 = 1 and x3 > 320 and x3 < 370 and y3 > 570 and y3 < 590 then
			delay (100)
			j := j + 1
			delay (200)
			cls
			exit
		    end if
		end loop
		exit

		%Any choice other than "1" exits to keep j count correct
	    elsif button2 = 1 and x2 > 0 and x2 < maxx and y2 > 450 and y2 < 480 then
		choice := "2"
		cls
		exit
	    elsif button2 = 1 and x2 > 0 and x2 < maxx and y2 > 410 and y2 < 440 then
		choice := "3"
		cls
		exit
	    elsif button2 = 1 and x2 > 0 and x2 < maxx and y2 > 370 and y2 < 400 then
		choice := "4"
		cls
		exit
	    elsif button2 = 1 and x2 > 0 and x2 < maxx and y2 > 330 and y2 < 360 then
		choice := "5"
		cls
		exit
	    elsif button2 = 1 and x2 > 130 and x2 < 270 and y2 > 40 and y2 < 190 then
		choice := "6"
		cls
		exit
	    end if
	end loop
	exit
    end for

    %Displaying Contact List Procedure
    if choice = "2" then

	%Top "Contact List" Banner
	Draw.FillBox (0, maxy, maxx, 0, 30)
	Draw.FillBox (0, maxy, maxx, 560, 8)
	Font.Draw ("Contact List", 90, 570, intfont, black)

	%Display Contacts
	y_list := 520
	for k : 1 .. j - 1
	    Font.Draw (intstr (k), 10, y_list, intfont3, black)
	    Font.Draw (name (k), 40, y_list, intfont3, black)
	    y_list := y_list - 40
	end for

	%More Info/Exit
	Font.Draw ("More Info about Contacts (y)", 55, y_list, intfont3, blue)
	Font.Draw ("Back To Contacts Page (n)", 61, y_list - 35, intfont3, red)

	%Get y/n
	Draw.Box (190, y_list - 50, 210, y_list - 75, black)
	Draw.Fill (191, y_list - 52, white, black)
	locatexy (196, y_list - 57)
	get more_info_option

	%For More Info ("y")
	if more_info_option = "y" then
	    Font.Draw ("Choose a Contact (1/2/3 etc.)", 40, y_list - 105, intfont3, purple)
	    locatexy (195, y_list - 122)
	    get contact_info

	    Font.Draw ("Here's more info about ", 20, y_list - 150, intfont3, black)
	    Font.Draw (name (contact_info), 270, y_list - 150, intfont3, black)
	    Font.Draw ("Name: ", 20, y_list - 180, intfont3, black)
	    Font.Draw (name (contact_info), 100, y_list - 180, intfont3, black)
	    Font.Draw ("Nickname: ", 20, y_list - 210, intfont3, black)
	    Font.Draw (nick (contact_info), 140, y_list - 210, intfont3, black)
	    Font.Draw ("Email: ", 20, y_list - 240, intfont3, black)
	    Font.Draw (email (contact_info), 100, y_list - 240, intfont3, black)
	    Font.Draw ("Address: ", 20, y_list - 270, intfont3, black)
	    Font.Draw (address (contact_info), 130, y_list - 270, intfont3, black)
	    Font.Draw ("Phone Number: ", 20, y_list - 300, intfont3, black)
	    Font.Draw (tel (contact_info), 195, y_list - 300, intfont3, black)

	    %Exit Button
	    Draw.Box (317, 568, 375, 592, black)
	    Draw.Fill (318, 572, white, black)
	    Font.Draw ("Exit", 325, 572, intfont3, black)

	    %Transition to Main Contacts Page
	    Mouse.ButtonChoose ("multibutton")
	    loop
		Mouse.Where (x5, y5, button5)
		if button5 = 1 and x5 > 320 and x5 < 370 and y5 > 570 and y5 < 590 then
		    delay (100)
		    cls
		    exit
		end if
	    end loop

	    %If Display is enough "n"
	elsif more_info_option = "n" then
	    cls
	end if
    end if

    %Removing Contact Procedure
    if choice = "3" then

	%Top "Remove Contact" Banner
	Draw.FillBox (0, maxy, maxx, 0, 30)
	Draw.FillBox (0, maxy, maxx, 560, 8)
	Font.Draw ("Remove Contact", 30, 570, intfont, black)

	%Display Contacts then ask which one to remove
	y_list := 520
	for k : 1 .. j - 1
	    Font.Draw (intstr (k), 10, y_list, intfont3, black)
	    Font.Draw (name (k), 40, y_list, intfont3, black)
	    y_list := y_list - 40
	end for

	Font.Draw ("Choose the Contact to Remove", 10, y_list, intfont3, blue)
	locatexy (10, y_list - 20)
	get remove
	Font.Draw ("Contact Removed", 10, y_list - 60, intfont3, red)

	%Remove Contact from array
	for p : 1 .. j - 1
	    if remove not= j - 1 then
		t := remove
		name (t) := name (t + 1)
		tel (t) := tel (t + 1)
		email (t) := email (t + 1)
		address (t) := address (t + 1)
		nick (t) := nick (t + 1)
		exit when remove = j - 2
	    end if
	end for
	j := j - 1

	%Save-Button
	Draw.Box (317, 568, 375, 592, black)
	Draw.Fill (318, 572, white, black)
	Font.Draw ("Save", 320, 572, intfont3, black)

	%Transition to Contacts Main Page
	Mouse.ButtonChoose ("multibutton")
	loop
	    Mouse.Where (x3, y3, button3)
	    if button3 = 1 and x3 > 320 and x3 < 370 and y3 > 570 and y3 < 590 then
		delay (200)
		cls
		exit
	    end if
	end loop
	cls
    end if

    %Editing Contact Procedure
    if choice = "4" then

	%Top "Edit Contact" Banner
	Draw.FillBox (0, maxy, maxx, 0, 30)
	Draw.FillBox (0, maxy, maxx, 560, 8)
	Font.Draw ("Edit Contact", 20, 570, intfont, black)

	%Display Contacts then ask which one to edit
	y_list := 520
	for k : 1 .. j - 1
	    Font.Draw (intstr (k), 10, y_list, intfont3, black)
	    Font.Draw (name (k), 40, y_list, intfont3, black)
	    y_list := y_list - 40
	end for

	Font.Draw ("Choose the Contact to Edit", 10, y_list, intfont3, blue)
	locatexy (10, y_list - 20)
	get to_edit
	Font.Draw ("The Contact to Edit is:", 10, y_list - 60, intfont3, black)
	Font.Draw (name (to_edit), 260, y_list - 60, intfont3, green)

	%Display Parameters
	Font.Draw ("Choose the Parameter to Edit", 10, y_list - 90, intfont3, black)
	Font.Draw ("1. Name", 10, y_list - 120, intfont3, black)
	Font.Draw ("2. Nickname", 10, y_list - 150, intfont3, black)
	Font.Draw ("3. Phone Number", 10, y_list - 180, intfont3, black)
	Font.Draw ("4. Email", 10, y_list - 210, intfont3, black)
	Font.Draw ("5. Address", 10, y_list - 240, intfont3, black)

	%Get which parameter to edit
	locatexy (10, y_list - 260)
	get par_edit

	%Edit Parameter by asking for new input
	if par_edit = 1 then
	    Font.Draw ("Enter the New Name for", 10, y_list - 290, intfont3, black)
	    Font.Draw (name (to_edit), 280, y_list - 290, intfont3, green)
	    locatexy (10, y_list - 310)
	    get name (to_edit) : *
	elsif par_edit = 2 then
	    Font.Draw ("Enter the New Nickname for", 10, y_list - 290, intfont3, black)
	    Font.Draw (name (to_edit), 290, y_list - 290, intfont3, green)
	    locatexy (10, y_list - 310)
	    get nick (to_edit) : *
	elsif par_edit = 3 then
	    Font.Draw ("Enter the New Phone Number of", 10, y_list - 290, intfont3, black)
	    Font.Draw (name (to_edit), 290, y_list - 290, intfont3, green)
	    locatexy (10, y_list - 310)
	    get tel (to_edit)
	elsif par_edit = 4 then
	    Font.Draw ("Enter the New Email of", 10, y_list - 290, intfont3, black)
	    Font.Draw (name (to_edit), 290, y_list - 290, intfont3, green)
	    locatexy (10, y_list - 310)
	    get email (to_edit) : *
	elsif par_edit = 5 then
	    Font.Draw ("Enter the New Address of", 10, y_list - 290, intfont3, black)
	    Font.Draw (name (to_edit), 290, y_list - 290, intfont3, green)
	    locatexy (10, y_list - 310)
	    get address (to_edit) : *
	end if

	%Save-Button
	Draw.Box (317, 568, 375, 592, black)
	Draw.Fill (318, 572, white, black)
	Font.Draw ("Save", 320, 572, intfont3, black)

	%Transition to Contacts Main Page
	Mouse.ButtonChoose ("multibutton")
	loop
	    Mouse.Where (x3, y3, button3)
	    if button3 = 1 and x3 > 320 and x3 < 370 and y3 > 570 and y3 < 590 then
		delay (200)
		cls
		exit
	    end if
	end loop
	Font.Draw ("Contact Info has been Edited", 10, y_list - 320, intfont3, red)

    end if
    
    %Viewing Groups Attempt Procedure
    if choice = "5" then

	y_list := 520

	%Top "View Groups" Banner
	Draw.FillBox (0, maxy, maxx, 0, 30)
	Draw.FillBox (0, maxy, maxx, 560, 8)
	Font.Draw ("View Groups", 90, 570, intfont, black)

	for k : 1 .. j - 1
	    if k > 1 then
		if group (k - 1) not= group (k) then
		    y_list := y_list - 40
		    Font.Draw (intstr (k), 10, y_list, intfont3, black)
		    Font.Draw (group (k), 40, y_list, intfont3, black)
		    for o : 1 .. j - 1
			if group (o) = group (k) then
			    Font.Draw (name (o), 40, y_list - 30, intfont3, blue)
			    y_list := y_list - 30
			end if
		    end for
		end if
	    elsif k = 1 then
		Font.Draw (intstr (k), 10, y_list, intfont3, black)
		Font.Draw (group (k), 40, y_list, intfont3, black)
		for o : 1 .. j - 1
		    if group (o) = group (k) then
			Font.Draw (name (o), 40, y_list - 30, intfont3, blue)
			y_list := y_list - 30
		    end if
		end for

	    end if
	end for
	%Exit-Button
	Draw.Box (317, 568, 375, 592, black)
	Draw.Fill (318, 572, white, black)
	Font.Draw ("Exit", 325, 572, intfont3, black)

	%Transition to Contacts Main Page
	Mouse.ButtonChoose ("multibutton")
	loop
	    Mouse.Where (x3, y3, button3)
	    if button3 = 1 and x3 > 320 and x3 < 370 and y3 > 570 and y3 < 590 then
		delay (200)
		cls
		exit
	    end if
	end loop

    end if

    %Exiting Loop Procedure
    if choice = "6" then
	exit
    end if

end loop

%Back to Home Page
picID := Pic.FileNew ("contacts1.jpg")
Pic.Draw (picID, 0, 0, picCopy)
Pic.Free (picID)


