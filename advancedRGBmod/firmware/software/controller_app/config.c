/*********************************************************************************
 *
 * This file is part of the N64 RGB/YPbPr DAC project.
 *
 * Copyright (C) 2016-2018 by Peter Bartmann <borti4938@gmx.de>
 *
 * N64 RGB/YPbPr DAC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *********************************************************************************
 *
 * config.c
 *
 *  Created on: 11.01.2018
 *      Author: Peter Bartmann
 *
 ********************************************************************************/

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include "n64.h"
#include "config.h"
#include "flash.h"

#define FWCFG_MAIN  0 // 0 = test; 1 = master
#define FWCFG_SUB   0 // running number

typedef struct {
  alt_u8  vers_cfg_main;
  alt_u8  vers_cfg_sub;
  alt_u16 cfg_words[NUM_CFG_WORDS];
} cfg4flash_t;

void cfg_inc_value(config_t* cfg_data)
{
  if (cfg_data->cfg_type == FLAG) {
    cfg_toggle_flag(cfg_data);
    return;
  }

  alt_u16 cfg_word = cfg_data->cfg_word->cfg_word_val;
  alt_u16 cur_val = (cfg_word & cfg_data->value_details.getvalue_mask) >> cfg_data->cfg_word_offset;

  cur_val = cur_val == cfg_data->value_details.max_value ? 0 : cur_val + 1;
  cfg_word = (cfg_word & ~cfg_data->value_details.getvalue_mask) | (cur_val << cfg_data->cfg_word_offset);

  cfg_data->cfg_word->cfg_word_val = cfg_word;
};

void cfg_dec_value(config_t* cfg_data)
{
  if (cfg_data->cfg_type == FLAG) {
    cfg_toggle_flag(cfg_data);
    return;
  }

  alt_u16 cfg_word = cfg_data->cfg_word->cfg_word_val;
  alt_u16 cur_val = (cfg_word & cfg_data->value_details.getvalue_mask) >> cfg_data->cfg_word_offset;

  cur_val = cur_val == 0 ? cfg_data->value_details.max_value : cur_val - 1;
  cfg_word = (cfg_word & ~cfg_data->value_details.getvalue_mask) | (cur_val << cfg_data->cfg_word_offset);

  cfg_data->cfg_word->cfg_word_val = cfg_word;
};

alt_u16 cfg_get_value(config_t* cfg_data)
{
  if (cfg_data->cfg_type == FLAG) return ((cfg_data->cfg_word->cfg_word_val & cfg_data->flag_masks.setflag_mask)     >> cfg_data->cfg_word_offset);
  else                            return ((cfg_data->cfg_word->cfg_word_val & cfg_data->value_details.getvalue_mask) >> cfg_data->cfg_word_offset);
};

void cfg_set_value(config_t* cfg_data, alt_u16 value)
{
  if (cfg_data->cfg_type == FLAG) {
    if (value) cfg_set_flag(cfg_data);
    else       cfg_clear_flag(cfg_data);
  } else {
    alt_u16 cfg_word = cfg_data->cfg_word->cfg_word_val;
    alt_u16 cur_val = value > cfg_data->value_details.max_value ? 0 : value;

    cfg_word = (cfg_word & ~cfg_data->value_details.getvalue_mask) | (cur_val << cfg_data->cfg_word_offset);

    cfg_data->cfg_word->cfg_word_val = cfg_word;
  }
};

int cfg_save_to_flash(configuration_t* sysconfig)
{
  alt_u8 databuf[PAGESIZE];
  int idx;

  ((cfg4flash_t*) databuf)->vers_cfg_main = FWCFG_MAIN;
  ((cfg4flash_t*) databuf)->vers_cfg_sub = FWCFG_SUB;
  for (idx = 0; idx < NUM_CFG_WORDS; idx++)
    ((cfg4flash_t*) databuf)->cfg_words[idx] = sysconfig->cfg_word_def[idx]->cfg_word_val;

  return write_flash_page((alt_u8*) databuf, sizeof(cfg4flash_t), USERDATA_OFFSET/PAGESIZE);
};

int cfg_load_from_flash(configuration_t* sysconfig)
{
  alt_u8 databuf[PAGESIZE];
  int idx, retval;

  retval = read_flash(USERDATA_OFFSET, PAGESIZE, databuf);

  if (retval != 0) return retval;

  if ((((cfg4flash_t*) databuf)->vers_cfg_main != FWCFG_MAIN) ||
      (((cfg4flash_t*) databuf)->vers_cfg_sub  != FWCFG_SUB)   ) return -CFG_VERSION_INVALID;

  for (idx = 0; idx < NUM_CFG_WORDS; idx++)
    sysconfig->cfg_word_def[idx]->cfg_word_val = ((cfg4flash_t*) databuf)->cfg_words[idx];

  return 0;
};

int cfg_load_n64defaults(configuration_t* sysconfig)
{
  cfg_load_jumperset(sysconfig); // to get vmode
  sysconfig->cfg_word_def[GENERAL]->cfg_word_val &= N64_CLR_MASK;
  sysconfig->cfg_word_def[GENERAL]->cfg_word_val |= N64_DEFAULT_CONFIG;
  return 0;
}

int cfg_load_jumperset(configuration_t* sysconfig)
{
  sysconfig->cfg_word_def[GENERAL]->cfg_word_val &= JUMPER_CLR_MASK;
  sysconfig->cfg_word_def[GENERAL]->cfg_word_val |= (cfg_get_jumper() | (CFG_GETALL_MASK & CFG_GAMMA_DEFAULT_SETMASK));
  return 0;
}

int cfg_load_sysdefaults(configuration_t* sysconfig)
{
  sysconfig->cfg_word_def[INTERNAL]->cfg_word_val = CFGI_DEFAULT;
  return 0;
}
