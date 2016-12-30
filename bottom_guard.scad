//units are in mm
$fn=20;

// Epsilon value
e = 0.01;

// Wall thickness
wall = .8;

// Outer border width
border = 8;

// mm clearance alongside each button
clearance = 6;

// Button size constants
a_diameter = 19 + clearance;
b_diameter = 12.5 + clearance;
y_length = 17 + clearance;
y_width = 11 + clearance;
x_length = 17 + clearance;
x_width = 11 + clearance;
start_diameter = 8 + clearance;
button_height = 18;

// How many sets of buttons
sets = 4;

difference() {
    // Bounding box
    cube([2*border + a_diameter + b_diameter + x_width + y_width + 7*wall, 2*border + 4*a_diameter + 7*wall, 7]);

    // Bottom indents
    translate([2*wall + e, 2*wall + e, 2 + 2*wall + e])
        cube([2*border + a_diameter + b_diameter + 2*x_width + 3*wall, 2*border + 4*a_diameter + 3*wall, button_height]);

}
