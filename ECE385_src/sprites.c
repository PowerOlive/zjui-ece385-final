#include "sprites.h"
#include "system.h"
#include "vga.h"
#include "main.h"

vga_sprite_info_t vga_planes_info[N_PLANES];
uint16_t* vga_planes_sprite_data[N_PLANES] = {
		(uint16_t*) VGA_SPRITE_0_BASE,
		(uint16_t*) VGA_SPRITE_1_BASE,
		(uint16_t*) VGA_SPRITE_2_BASE,
		(uint16_t*) VGA_SPRITE_3_BASE,
		(uint16_t*) VGA_SPRITE_4_BASE,
		(uint16_t*) VGA_SPRITE_5_BASE,
		(uint16_t*) VGA_SPRITE_6_BASE,
		(uint16_t*) VGA_SPRITE_7_BASE
};
vga_entity_manage_t vga_planes = {
		N_PLANES,
		vga_planes_sprite_data,
		(vga_entity_t*) VGA_SPRITE_PARAMS_BASE,
		vga_planes_info
};

vga_sprite_info_t vga_bullets_info[N_BULLETS];
vga_entity_manage_t vga_bullets = {
		N_BULLETS,
		(uint16_t**) NULL,
		((vga_entity_t*) VGA_SPRITE_PARAMS_BASE) + N_PLANES,
		vga_bullets_info
};

void sprites_init(vga_entity_manage_t* vga_entity_type) {
	for(int i = 0; i < vga_entity_type->max_size; i++) {
		vga_entity_type->info_arr[i].used = 0;
		vga_entity_type->info_arr[i].vx = 0;
		vga_entity_type->info_arr[i].vy = 0;
		vga_entity_type->info_arr[i].ax = 0;
		vga_entity_type->info_arr[i].ay = 0;
		vga_entity_type->info_arr[i].type = 0;
		vga_entity_type->info_arr[i].frame_created = 0;
		vga_entity_type->info_arr[i].physical = vga_entity_type->mmap_addr + i;
		vga_entity_type->info_arr[i].physical->x = 0;
		vga_entity_type->info_arr[i].physical->y = 0;
		vga_entity_type->info_arr[i].physical->width = 0;
		vga_entity_type->info_arr[i].physical->height = 0;
		if(vga_entity_type->mmap_sprite_data) {
			vga_entity_type->info_arr[i].sprite_data = vga_entity_type->mmap_sprite_data[i];
		} else {
			vga_entity_type->info_arr[i].sprite_data = NULL;
		}
	}
}

// Return 0 for success, 255 for fail
uint8_t sprites_allocate(vga_entity_manage_t* vga_entity_type) {
	for(int i = 0; i < vga_entity_type->max_size; i++) {
		if(!vga_entity_type->info_arr[i].used) {
			vga_entity_type->info_arr[i].used = 1;
			vga_entity_type->info_arr[i].vx = 0;
			vga_entity_type->info_arr[i].vy = 0;
			vga_entity_type->info_arr[i].ax = 0;
			vga_entity_type->info_arr[i].ay = 0;
			vga_entity_type->info_arr[i].frame_created = frame_count;
			vga_entity_type->info_arr[i].physical = vga_entity_type->mmap_addr + i;
			vga_entity_type->info_arr[i].physical->x = 0;
			vga_entity_type->info_arr[i].physical->y = 0;
			vga_entity_type->info_arr[i].physical->width = 0;
			vga_entity_type->info_arr[i].physical->height = 0;
			if(vga_entity_type->mmap_sprite_data) {
				vga_entity_type->info_arr[i].sprite_data = vga_entity_type->mmap_sprite_data[i];
			} else {
				vga_entity_type->info_arr[i].sprite_data = NULL;
			}
			return i;
		}
	}
	return 255;
}

// Return pointer to vga_sprite_info_t for success, NULL for fail
volatile vga_sprite_info_t* sprites_get(vga_entity_manage_t* vga_entity_type, uint8_t id) {
	if(id >= vga_entity_type->max_size) return NULL;
	if(!vga_entity_type->info_arr[id].used) return NULL;
	return vga_entity_type->info_arr + id;
}

// Return 0 for success, 255 for fail
uint8_t sprites_deallocate(vga_entity_manage_t* vga_entity_type, uint8_t id) {
	// Error checking
	if(id >= vga_entity_type->max_size) return 255;
	if(!vga_entity_type->info_arr[id].used) return 255;

	// Remove from screen
	vga_entity_type->info_arr[id].physical->x = 0;
	vga_entity_type->info_arr[id].physical->y = 0;
	vga_entity_type->info_arr[id].physical->width = 0;	// Alternatively, bullet_radius
	vga_entity_type->info_arr[id].physical->height = 0;	// Alternatively, bullet_color

	// Release entity
	vga_entity_type->info_arr[id].used = 0;
	return 0;
}

// Return 1 for visible, 0 for not
uint8_t sprites_visible(vga_entity_manage_t* vga_entity_type, uint8_t id) {
	// Error checking
	if(id >= vga_entity_type->max_size) return 0;
	if(!vga_entity_type->info_arr[id].used) return 0;

	if(vga_entity_type == VGA_SPRITE_PLANE) {
		// Plane x, y: left-top corner
		if(vga_entity_type->info_arr[id].physical->x >= VGA_SPRITE_WIDTH) return 0;
		if(vga_entity_type->info_arr[id].physical->y >= VGA_SPRITE_HEIGHT) return 0;

		if(vga_entity_type->info_arr[id].physical->x + (vga_entity_type->info_arr[id].physical->width << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			return 0;
		}
		if(vga_entity_type->info_arr[id].physical->y + (vga_entity_type->info_arr[id].physical->height << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			return 0;
		}

		return 1;
	} else if(vga_entity_type == VGA_SPRITE_BULLET) {
		// Bullet x, y: center of bullet
		if(vga_entity_type->info_arr[id].physical->x - (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				>= VGA_SPRITE_WIDTH) {
			return 0;
		}
		if(vga_entity_type->info_arr[id].physical->y - (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				>= VGA_SPRITE_HEIGHT) {
			return 0;
		}

		if(vga_entity_type->info_arr[id].physical->x + (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			return 0;
		}
		if(vga_entity_type->info_arr[id].physical->y + (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			return 0;
		}

		return 1;
	} else {
		return 0;
	}
}

uint8_t sprites_load_data(vga_entity_manage_t* vga_entity_type, uint8_t id, const uint16_t* src, int32_t pixel_count) {
	// Error checking
	if(id >= vga_entity_type->max_size) return 255;
	if(!vga_entity_type->info_arr[id].used) return 255;
	if(vga_entity_type->info_arr[id].sprite_data == NULL) return 255;

	volatile uint16_t* target = vga_entity_type->info_arr[id].sprite_data;
	// TODO: use faster methods, such as DMA?
	for(int i = 0; i < pixel_count; i++) {
		target[i] = src[i];
	}
	return 0;
}

uint8_t sprites_limit_speed(vga_entity_manage_t* vga_entity_type, uint8_t id) {
	// Error checking
	if(id >= vga_entity_type->max_size) return 255;
	if(!vga_entity_type->info_arr[id].used) return 255;

	if(vga_entity_type == VGA_SPRITE_PLANE) {
		// Plane x, y: left-top corner

		// Limit X
		if(vga_entity_type->info_arr[id].physical->x >= VGA_SPRITE_WIDTH) {
			vga_entity_type->info_arr[id].physical->x = VGA_SPRITE_WIDTH - 1;
		}
		if(vga_entity_type->info_arr[id].physical->x
				+ (vga_entity_type->info_arr[id].physical->width << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			vga_entity_type->info_arr[id].physical->x = -(vga_entity_type->info_arr[id].physical->width << VGA_SPRITE_HW_SHIFT_BITS);
		}

		// Limit Y
		if(vga_entity_type->info_arr[id].physical->y >= VGA_SPRITE_HEIGHT) {
			vga_entity_type->info_arr[id].physical->y = VGA_SPRITE_HEIGHT - 1;
		}
		if(vga_entity_type->info_arr[id].physical->y
				+ (vga_entity_type->info_arr[id].physical->height << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			vga_entity_type->info_arr[id].physical->y = -(vga_entity_type->info_arr[id].physical->height << VGA_SPRITE_HW_SHIFT_BITS);
		}
	} else if(vga_entity_type == VGA_SPRITE_BULLET) {
		// Bullet x, y: center of bullet

		// Limit X
		if(vga_entity_type->info_arr[id].physical->x
				- (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				>= VGA_SPRITE_WIDTH) {
			vga_entity_type->info_arr[id].physical->x = VGA_SPRITE_WIDTH
					+ (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS) - 1;
		}
		if(vga_entity_type->info_arr[id].physical->x
				+ (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			vga_entity_type->info_arr[id].physical->x = -(vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS);
		}

		// Limit Y
		if(vga_entity_type->info_arr[id].physical->y
				- (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				>= VGA_SPRITE_HEIGHT) {
			vga_entity_type->info_arr[id].physical->y = VGA_SPRITE_HEIGHT
					+ (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
					- 1;
		}
		if(vga_entity_type->info_arr[id].physical->y
				+ (vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS)
				< 0) {
			vga_entity_type->info_arr[id].physical->y = -(vga_entity_type->info_arr[id].physical->bullet_radius << VGA_SPRITE_HW_SHIFT_BITS);
		}
	}
	return 0;
}

// Return # of sprites processed
uint8_t sprites_tick(vga_entity_manage_t* vga_entity_type) {
	uint8_t processed = 0;
	for(int i = 0; i < vga_entity_type->max_size; i++) {
		if(!vga_entity_type->info_arr[i].used) continue;

		// If sprite fly off screen, deallocate immediately
		if(!sprites_visible(vga_entity_type, i)) {
			sprites_deallocate(vga_entity_type, i);
			continue;
		}

		vga_entity_type->info_arr[i].physical->x += vga_entity_type->info_arr[i].vx;
		vga_entity_type->info_arr[i].physical->y += vga_entity_type->info_arr[i].vy;

		vga_entity_type->info_arr[i].vx += vga_entity_type->info_arr[i].ax;
		vga_entity_type->info_arr[i].vy += vga_entity_type->info_arr[i].ay;
		processed++;
	}
	return processed;
}

// Return # of sprites removed
int32_t sprites_collision_detect() {
	vga_entity_manage_t* planes = VGA_SPRITE_PLANE;
	vga_entity_manage_t* bullets = VGA_SPRITE_BULLET;
	int32_t collided = 0;
	for(int i = 0; i < planes->max_size; i++) {
		volatile vga_sprite_info_t* plane_info = planes->info_arr + i;
		if(!plane_info->used) continue;
		if(plane_info->type >= 2) continue;
		for(int j = 0; j < bullets->max_size; j++) {
			volatile vga_sprite_info_t* bullet_info = bullets->info_arr + j;
			if(!bullet_info->used) continue;
			if(bullet_info->type >= 2) continue;

			// Avoid friendly fire
			if(bullet_info->type == plane_info->type) continue;

			if(bullet_info->physical->x >= plane_info->physical->x
					&& bullet_info->physical->x < plane_info->physical->x + (plane_info->physical->width << VGA_SPRITE_HW_SHIFT_BITS)
					&& bullet_info->physical->y >= plane_info->physical->y
					&& bullet_info->physical->y < plane_info->physical->y + (plane_info->physical->height << VGA_SPRITE_HW_SHIFT_BITS)
			) {
				// Collision happened
				// Remove the bullet
				sprites_deallocate(VGA_SPRITE_BULLET, j);
				// TODO: Set the plane on explosion
				// Remove the plane
				if((--plane_info->hp) == 0) {
					if(plane_info->type != 0) {
						sprites_deallocate(VGA_SPRITE_PLANE, i);
					} else {
						// Update player HP
						*io_led_red = 0;

						sprites_deallocate(VGA_SPRITE_PLANE, i);

						// TODO: end the game
						while(1);
					}
				}

				collided++;
			}
		}
	}
	return collided;
}