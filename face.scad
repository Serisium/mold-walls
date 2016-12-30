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

module a_button() {
    translate([wall, wall, wall + e])
        cube([a_diameter, a_diameter, button_height]);
}

module b_button() {
    translate([wall, wall, wall + e])
        cube([b_diameter, b_diameter, button_height]);
}

module x_button() {
    translate([wall, wall, wall + e])
        cube([x_width, x_length, button_height]);
}

module start_buttons() {
    translate([wall, wall, wall + e])
        cube([b_diameter, a_diameter, button_height]);    // The 2nd term here is eye-balled
}

// Hexagonal mold keys
module key(r, h) {
    $fn=10;
    cylinder(h = 2.5, r = 2, center = false);
}

difference() {
    // Bounding box
    cube([2*border + a_diameter + b_diameter + x_width + y_width + 5*wall, 2*border + 4*a_diameter + 5*wall, button_height + 2]);

    // Bottom indents
    translate([wall + e, wall + e, 2 + wall + e])
        cube([2*border + a_diameter + b_diameter + 2*x_width + 3*wall, 2*border + 4*a_diameter + 3*wall, button_height]);

    translate([border, border, 0]) {

        // First collumn, A buttons
        translate([0, 0, 0]) {
            for(i = [0:sets - 1]) {
                translate([0, i * (wall + a_diameter), 0])
                    a_button();
            }
        }

        // Second collumn, B and start buttons
        translate([a_diameter + wall, 0, 0]) {
            for(i = [0:sets - 1]) {
                translate([0, i * (wall + b_diameter), 0])
                    b_button();
            }
            translate([0, 4 * (wall + b_diameter), 0])
                start_buttons();
        }

        // Third collumn, X buttons
        translate([a_diameter + b_diameter + 2 * wall, 0, 0]) {
            for(i = [0:sets - 1]) {
                translate([0, i * (wall + x_length), 0])
                    x_button();
            }
        }

        // Fourth collumn, Y buttons
        translate([a_diameter + b_diameter + x_width + 3 * wall, 0, 0]) {
            for(i = [0:sets - 1]) {
                translate([0, i * (wall + x_length), 0])
                    x_button();
            }
        }
    }
}

for(x=[0:4], y=[0:6]) {
    if(x==0 || x==4 || y==0 || y==6)
        translate([border/2 + x*22.20, border/2 + y*18.4, wall + 2])
            key();
}

// Text
/*
   linear_extrude(height=4)
   translate([70, 90, 5])
   scale(.4)
   mirror()
   text("Shinewave");
*/
