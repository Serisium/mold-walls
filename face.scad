//units are in mm
$fn=20;

// Epsilon value
e = 0.01;

// Wall thickness
wall = .8;

// mm clearance alongside each button
clearance = 4;

// Button size constants
a_diameter = 19 + clearance;
b_diameter = 12.5 + clearance;
y_length = 17 + clearance;
y_width = 11 + clearance;
x_length = 17 + clearance;
x_width = 11 + clearance;
start_diameter = 8 + clearance;
button_height = 16;
height_clearance = 3;


// How many sets of buttons
sets = 4;

module a_button() {
    translate([wall, wall, wall + e])
        cube([a_diameter, a_diameter, button_height]);
}

module b_button() {
    translate([wall, wall, wall+e])
        cube([b_diameter, b_diameter, button_height]);
}

module x_button() {
    translate([wall, wall, wall+e])
        cube([x_width, x_length, button_height]);
}

module start_buttons() {
    translate([wall, wall, wall+e])
        cube([b_diameter, a_diameter + 2.2, button_height]);
}

//translate([wall, wall, 2 * wall + e])
    //cube([a_diameter, a_diameter * sets, button_height - 1])

difference() {
    // Bounding box
    cube([a_diameter + b_diameter + 2 * x_width + 5 * wall, a_diameter * 4 + wall * 5, button_height + 2]);

        // First collumn, A buttons
        for(i = [0:sets - 1]) {
            translate([0, i * (wall + a_diameter), 0])
                a_button();
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
        // Bottom indents
        translate([wall + e, wall + e, 2 + wall + e])
            cube([a_diameter + b_diameter + 2 * x_width + 3 * wall, a_diameter * 4 + wall * 3, button_height]);
}

// Text
/*
linear_extrude(height=4)
    translate([70, 90, 5])
        scale(.4)
            mirror()
                text("Shinewave");
*/
