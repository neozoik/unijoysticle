/****************************************************************************
http://retro.moe/unijoysticle

Copyright 2017 Ricardo Quesada

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
****************************************************************************/

// Stub version

#include "gpio_joy.h"

#include <stdio.h>

static void print_joystick(joystick_t* joy) {
    printf("up=%d, down=%d, left=%d, right=%d, fire=%d\n",
        joy->up, joy->down, joy->left, joy->right, joy->fire);
}

void gpio_joy_init(void) {    
}

void gpio_joy_update_port_a(joystick_t* joy, int controller_type) {
    (void)controller_type;
    print_joystick(joy);
}

void gpio_joy_update_port_b(joystick_t* joy, int controller_type) {
    (void)controller_type;
    print_joystick(joy);
}
