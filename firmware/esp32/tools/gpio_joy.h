/****************************************************************************
http://retro.moe/unijoysticle

Copyright 2019 Ricardo Quesada

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

#ifndef GPIO_JOY_H
#define GPIO_JOY_H

#include <stdint.h>

// Valid for Amiga, Atari 8-bit, Atari St, C64 and others...
typedef struct {
    uint8_t up;             // line 1 - Y2 for quad mouse
    uint8_t down;           // line 2 - X1 for quad mouse
    uint8_t left;           // line 3 - Y1 for quad mouse
    uint8_t right;          // line 4 - X2 for quad mouse
    uint8_t pot_y;          // line 5 - Middle button for mouse
    uint8_t fire;           // line 6 - Left button for mouse
    uint8_t _power;         // line 7 - +5v. added as ref only
    uint8_t _ground;        // line 8 - addes as ref only
    uint8_t pot_x;          // line 9 - Right button for mouse
} joystick_t;

void gpio_joy_init(void);
void gpio_joy_update_port_a(joystick_t* joy);
void gpio_joy_update_port_b(joystick_t* joy);

#endif // GPIO_JOY_H