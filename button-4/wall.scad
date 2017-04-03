//units are in mm
$fn=20;

// Epsilon value
e = 0.01;

// Wall thickness
wall = .8;

// Outer border width
border = 8;

// Registration indent width
indent = 4;

box_width = 2*wall + 2*border + button_width * n + indent * (n-1);
box_length = 2*wall + 2*border + button_length;

difference() {
    // Bounding box
    cube([box_width, box_length, button_height]);

    // Hollow out box
    translate([wall, wall, 2 + wall + e])
        cube([box_width - 2*wall, box_length - 2*wall, button_height]);

    translate([wall + border, wall + border, 1]) {
        for(i=[0:n-1]) {
            translate([i * (button_width + indent), 0, 0])
                cube([button_width, button_length, button_height]);
        }
    }
}

difference() {
    translate([wall + (border - indent)/2, wall + (border - indent)/2, e])
        cube([indent, box_length - 2*wall - indent, 5]);
    translate([(border-indent)/2 + wall - e, box_length/2 - indent/2, 2+wall])
        cube([indent + 2*e, indent, button_height]);
}
translate([box_width - wall - (border+indent)/2, wall + (border - indent)/2, e])
    cube([indent, box_length - 2*wall - indent, 5]);
translate([wall + (border - indent)/2, wall + (border - indent)/2, e])
    cube([box_width - 2*wall - indent, indent, 5]);
translate([wall + (border - indent)/2, box_length - wall - (border + indent)/2, e])
    cube([box_width - 2*wall - indent, indent, 5]);
