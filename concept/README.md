# Moonshot Titan
## General
In Moonshot Titan, you are an astronaut on board a mining station on Titan, the largest moon of Saturn. The mining company you work for drilled too deep, and uncovered an alien species hidden beneath the ice. Ready your ship for launch and try to escape this planet before it is overrun.

The player has one method of defending themselves: the repulsor gun. The gun fires a projectile that knocks the aliens backwards. Use it to knock the enemies into hazards, out airlocks, or just buy yourself time to get to safety. Be careful though - for every action there is an equal and opposite reaction. In the low gravity of Titan, the repulsor gun can send you flying backwards!

## How to Play
* W A S D to move
* Right Mouse to aim and fire
* Left Click to interact with the environment

# Level Design
## Objectives
For this game, the player needs to overcome ten puzzles/obstacles in order to repair their ship and escape the planet.

## Puzzle Challenges
The player needs to overcome a gameplay challenge in each room. These will start easy and then escalate/build on the previous one.

1. Knockback an enemy into a hazard to eliminate them.
    * This could be sending them out an airlock, into a field of electricity, etc.
1. There are interactable things in the room. You might have to turn on an electricity field/open a door to some danger with an action before you can send the enemy into the hazard.
1. Some enemies are larger than others. They can't be knocked back. You have to lure them into danger.
1. There are squares with hand holds that you can hang onto (or squares with Grav Boot plating) where you aren't knocked back. This will allow you to knockback the enemy without sending yourself into a similar hazard.
1. Some hazards are too fast to run through. But if the player sends themselves flying with the recoil, it can send them across/through a hazard safely.

## Difficulty Sliders
Other ways to add difficulty to a level

1. "green" spiders move faster
2. "red" spiders aren't knocked back as far (normal spiders will get knocked back until they hit a wall or are destroyed)

## Room Puzzle Difficulty Chart

Room | Challenge | Difficulty
---- | --------- | ----------
Crew Quarters | Knocback Single Enemy | Easy
Oxygenator | 2 Normal Enemies + Interactable | Easy
Medical Bay | 1 Red Spider (less knockback) and 1 Green spider (fast) | Easy
Storage Room | 2 Normal Spiders + Self-knockback hazards| Medium
Mess Hall | 2 Big Spider + Interactable | Medium
Computer Core | 3 Normal Enemies + Interactible + Self-knockback hazards | Medium
Reactor Room | 3 Normal Enemies + Interactible + Self-knockback hazard + Recoil avoidance | Hard
Astronomy Lab | 2 Red + 2 Green + Interactible (challenging) + Self-knockback hazard | Hard
Fuel Bay | 4 Normal Enemies + Grav Plating + Interactible (turns on/off grav plating) | Hard 
Research Lab | 1 Normal, 1 Red, 1 Green, 1 Large + Recoil avoidance + Grav Plating | Hard

## Rooms

**Note**: All rooms are sealed once the player enters them. They have to complete the challenge to leave.

1. ### Crew Quarters 
    * Starting room? Safe room with no monsters if the player needs a breather.
    * Retrieve your personal effects?
    * Possibly a single use medkit here if the player hasn't unlocked the med bay yet?
    * > The player starts off here and is confronted by a single spider who is attacking a wall. It doesn't engage the player until they make their first move, at which point the spider will start moving towards the player.
    * > The player successfully defeats the spider when they shoot it into the airlock square, sending the spider out of the moon base.
1. ### Oxygenator Room
    * Prevent aliens from destroying oxygen supply.
    * This can add a time limit to the game at first, which is alleviated once the threat is neutralized.
    * *Discussion* - Should this be a recurring threat that the player might have to revisit a few times if they are taking too long?
    * >From the start of the game, the oxygen levels will start to drain. The player has 5 real-time minutes to defeat the spiders in this room before game over.
    * >Interactible 1: The player can either shoot or interact with an oxygen canister to cause it to explode, resulting in a fire square that will destroy the enemy.
    * >Interactible 2: After the spiders are destroyed, the player can interact with the computer console to shut down the oxygen timer and extinguish the fires.
1. ### Medical Bay
    * Gather medical supplies for the journey home
    * Possibly heal/recruit a required crew member for launching the ship (your pilot)
    * *Discussion* - If we implement a health system, clearing this room would also enable the player to heal any wounds they have suffered in other rooms.
    * >Gather supplies will check off an item on the pre-flight checklist
    * >Saving the crew member will have the friend pop up a dialogue saying they will do some repairs IF the player brings them a tool from the storage room. (New quest objective added to the quest tracker)
    * >2 Red spiders are the primary threat in this room. There are 2-4 stasis pods. The player has to knock the spiders back into a pod, which will incapacitate them. 
1. ### Storage Room
    * Gather tools required to repair the ship
    * > If the player has talked to the crew member in the med bay, then the Wrench tool will have an interaction to pick it up. If the player completes this room before the medical bay, there will be no reason to pick it up, and the player will have to come back.
    *> 2 Green spiders are the main threat. There are overhead pipes that have been destroyed which are sending down gusts of superheated steam. These are fatal to everyone (spiders and player). The player will have to be careful not to send themselves flying into one of the hazards while they are dealing with the spiders.
1. ### Mess Hall
    * Grab a pile of snacks to last you the journey back to Earth.
    * >Acquiring the picnic basket of food supplies will mark off a pre-flight checklist item.
    * >2 large spiders are the obstacle. They can't be knocked back (but the player will be). The player will have to kite/lure the spider into an interactible trap.
    * >The player has to run around the tables, but the big spiders can run over them. The player moves at the same speed as the spider, so the spiders will eventually catch the player if they don't use the recoil gun to move faster.
    * >There will be an interactible flame in the kitchen part. If the player interacts with it, they have a flaming torch they carry around with them. They can then interact with one of the tables (at which point the torch disappears) and this becomes the hazard they can kite the big spider onto.
    * >Upon level complete, the table will be destroyed and the flame will go out.
1. ### Computer Core
    * Unlock doors to sealed rooms
    * >Interactible computer will unlock all doors in the compound (except the top secret research lab). This won't check off an objective on the quest tracker - it will just enable the player to proceed.
        * *Discussion* - To prevent the player from skipping to the hard zones, should we have the computer be "Rebooting..." until they have completed Rooms 1-5 first?
    * >Several computer workstations (all except for the interactible one) has been destroyed by the spiders and are sparking. The squares adjacent to the consoles are hazards. The room is smaller, and recoiling into the computer spark range becomes a real hazard.
        * Bonus scope creep: The size of the sparks might vary in a pattern. 2 squares out twice, then 1 square out, then 0 squares out. Repeat.
1. ### Reactor Room (*)
    * Power up the ship!
    * >Interactible: Reaching the end of this level and triggering the console will power up the ship and check off an item on the pre-flight checklist.
    * >Power conduits have broken and are sending arcing electricity out into the "corridors" that are created by machinery which blocks the player's path. They will pulse, but the pattern is too quick for the player to run through on their own (if the player starts as soon as the timer expires, they will get hit by the 3rd tile). They need to recoil themselves through the barriers and time it correctly.
    * >Ideally, the spiders won't run into the hazards intentionally. They'll need to be shot into them. But the timing is tricky, because the spider might also get sent flying through the hazard safely.
        * >The spider should have some way of getting back to the player, that the player can't use. Maybe a narrow corridor that is too wide for the player, but not too wide for the spider?
1. ### Astronomy Lab (*)
    * Plot a course for home
    * >Interactible star map at the center of the room. If the player interacts with it, they will plot a course home and the objective will be completed on the quest-tracker.
    * >The player can interact with the star map early to spawn 2-3 black holes at random locations that will persist for X (30?) seconds before disappearing.
        * >There is a chance the player gets lucky and spawns a black hole on a spider, killing it instantly.
        * >The black holes can NOT spawn adjacent to the star map, so the player can't accidentally insta-kill themselves
    * >This room has many enemies, which definitely adds to the challenge of the room. 2 of them are fast spiders, 2 of them have knockback resistance.
1. ### Fuel Bay (*)
    * Pump fuel into the ship.
    * *Discussion* - Could this be a wave encounter? Where you have a continuous supply of enemies that need to be dealt with before the ship is fully powered up?   
    * >After the player enters the room, fuel tanks explode, spilling burning fuel EVERYWHERE. This is a huge hazard. Fortunately, there is a lot of grav plating in this room that will stop the player from hitting the hazards if they line themselves up properly. The flames get extinguished by an explosion of flame retardant that turns the whole screen white temporarily once the spiders are destroyed AND the fuel pump is finished pumping.
    * >Interactible 1: Grav plating is off by default. Using the interactible will turn the grav plating on.
    * >Interactible 2: Turning on the fuel pump will cause the spiders to start coming, and the player needs to defend themselves against the spiders until the fuel pumping is complete.
1. ### Research Lab (**)
    * CapraCorp requires you secure a VERY expensive robot from the research lab and load it onto the ship before it will release the launch clamps. 
    * *Discussion* Triggered event? When the player tries to launch the ship, they are instructed to do this? And then it is added to the Quest tracker text afterwards? 
    * >Just like the med bay, there are hazards for the spiders in the form of specimen containers.
        * Flavour note: Maybe 1 already has a spider in it, hinting to the player that someone may have known about this threat beforehand?
        * When the robot leaves, he should carry a specimen container with him, too.
    * >There should also be more of the overhead steam that the player can accidentally knock themselves into (and potentially lock themselves in a specimen jar), and grav plating that will be annoying because it makes it harder to avoid the large/fast spiders. 
1. ### Space Ship Launchpad
    * Perform the repairs on your ship (needs supplies from Storage Room)
    * Fuel the ship (requires access to Fuel Bay)

> (*) - These rooms are sealed behind the Computer Core and unlocking the doors

> (**) - These rooms require an in-game event to trigger






    