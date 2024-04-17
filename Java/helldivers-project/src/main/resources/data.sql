USE helldivers

-- Flags
INSERT INTO stratagem_flag (name) VALUES ("hellpod"),("backpack"),("aerial"),("explosive"),("turret"),("suuport weapon"),("orbital"),("vehicle")

-- Stratagems
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Supply Pack", "Supply boxes containing ammunition, with a backpack that allows the user to distribute boxes to fellow Helldivers.", "down, left, down, up, up, down", "HellpodDeployment", "Supply", -1, 5, 480)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Ballistic Shield Backpack", "A backpack which can be wielded as a one-handed ballistic shield, protecting against small arms fire.", "down, left, down, down, up, left", "HellpodDeployment", "Supply", -1, 5, 300)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Shield Generator Pack", "Encloses the wearer in a spherical shield which blocks high-speed projectiles. Has a limited lifetime once deployed.", "down, upp, left, right, left, right", "HellpodDeployment", "Supply", -1, 5, 480)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Jump Pack", "Enables the user to jump higher than 'gravity' and 'safety' would normally allow. Must be charged before use.", "down, up, up, down, up", "HellpodDeployment", "Supply", -1, 5, 480)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Guard Dog", "An autonomous drone equipped with a Liberator assault rifle, providing 360° cover. Returns to backpack to rearm.", "down, up, left, up, right, down", "HellpodDeployment", "Supply", -1, 5, 480)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Guard Dog Rover", "An autonomous drone equipped with a laser rifle, providing 360° cover. Returns to backpack to cool down.", "down, up, left, up, right, right", "HellpodDeployment", "Supply", -1, 5, 480)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Resupply", "A Hellpod containing four supply packs, to replenish personal ammunition and stims in the field.", "down, down, up, right", "HellpodDeployment", "Supply", -1, 7.5, 180)

INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Eagle Strafing Run", "A strafing run of the battlefield to clear small targets, delivered almost instantly. The F-89 EAGLE is a jet fighter capable of carrying large amounts of ordnance as well as both atmospheric and limited spaceflight. The F-89 comes equipped with a 23mm cannon that can be used for strafing runs against ground targets. <br>Once the Eagle is assigned to follow you into combat you can choose additional payloads for it to carry. The EAGLE is capable of delivering its ordnance with very low time intervals, but has limited carrying capacity and needs to be sent back to be rearmed should it run out. <br>The eagle is also susceptible to enemy anti-air weaponry and caution is advised when calling in strikes near enemy AA.", "up, right, right", "CloseAirSupport", "Offensive", 3, 0, 15)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Eagle 500kg Bomb", "A large bomb obliterating almost any target close to impact. Make sure to clear the area. The DMB-500 is a evolution on the classic bombs of human history. The approach of not having any guidance system in the bomb has allowed for packing it with unprecedented amounts of conventional explosives, making for a very large explosion and resulting crater. While the bomb is not specifically designed to take out armored targets, the explosion is massive enough that a close hit will kill almost anything, armored or not. The drawback is that the Eagle pilot has to take more care when delivering the payload to make sure that the target is hit, this increases the response time of the bomb in comparison to other Eagle payloads.", "up, right, down, down, down", "CloseAirSupport", "Offensive", 1, 0, 15)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Eagle 110mm Rocket Pods", "A barrage of rocket pods, which the Eagle pilot will release on the largest target near the stratagem beacon. A pod of 110mm DRAGON rockets used to strike at armored targets. Your Eagle pilot will try to pick the best target available based on proximity to your beacon and armor level. The rockets have no guidance and will not always hit the target but this is usually compensated by firing a substantial amount of rockets. The amount of rockets means there might be significant collateral damage in proximity to the target.", "up, right, up, left", "CloseAirSupport", "Offensive", 2, 0, 15)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Eagle Airstrike", "A barrage of bombs creating a non-targeted carpet of explosions. A rack of semi-guided 100-kg bombs, intended to be dropped on a area target in a high speed flyby. The bomb pattern produces a carpet of explosions killing most infantry, but has a harder time affecting armored targets unless they are directly hit by one of the bombs. A great option for creating pause in an enemy advance or taking out larger concentrations of infantry.", "up, right, up, right", "CloseAirSupport", "Offensive", 2, 0, 15)
INSERT INTO stratagem (name, description, code, category, type, uses, spawn_time, cooldown) VALUES ("Eagle Napalm Airstrike", "A barrage of napalm bombs, creating a wall of fire which will stop the enemy in their tracks. The Napalm airstrike drops a row of bombs containing an extremely flammable liquid with a fairly long burn time, effectively creating a wall of fire. Great for stopping the enemy in their tracks as a universal rule for all life in the galaxy seems to be to avoid fire. The fire doesn't burn hot enough to do any significant damage to heavily armored targets.", "up, right, down, up", "CloseAirSupport", "Offensive", 2, 0, 15)

-- Links
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Supply Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Supply Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Ballistic Shield Backpack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Ballistic Shield Backpack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Shield Generator Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Shield Generator Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Jump Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Jump Pack'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Guard Dog'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Guard Dog'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Guard Dog Rover'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Guard Dog Rover'), (SELECT flag_id FROM stratagem_flag WHERE name = 'backpack') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Resupply'), (SELECT flag_id FROM stratagem_flag WHERE name = 'hellpod') )

INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle Strafing Run'), (SELECT flag_id FROM stratagem_flag WHERE name = 'aerial') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle 500kg Bomb'), (SELECT flag_id FROM stratagem_flag WHERE name = 'aerial') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle 500kg Bomb'), (SELECT flag_id FROM stratagem_flag WHERE name = 'explosive') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle 110mm Rocket Pods'), (SELECT flag_id FROM stratagem_flag WHERE name = 'aerial') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle 110mm Rocket Pods'), (SELECT flag_id FROM stratagem_flag WHERE name = 'explosive') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle Airstrike'), (SELECT flag_id FROM stratagem_flag WHERE name = 'aerial') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle Airstrike'), (SELECT flag_id FROM stratagem_flag WHERE name = 'explosive') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle Napalm Airstrike'), (SELECT flag_id FROM stratagem_flag WHERE name = 'aerial') )
INSERT INTO stratagem_flag_links (stratagem_id, flag_id) VALUES ( (SELECT stratagem_id FROM stratagem WHERE name = 'Eagle Napalm Airstrike'), (SELECT flag_id FROM stratagem_flag WHERE name = 'explosive') )