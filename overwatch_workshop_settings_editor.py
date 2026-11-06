import tkinter as tk  # Imports tkinter as tk for use in this script.
from tkinter import ttk, messagebox, filedialog  # Imports ttk, messagebox, filedialog from tkinter for use in this script.
import re  # Imports re for use in this script.

# ==========================================================
# OVERWATCH THEME PALETTE
# ==========================================================
OW_ORANGE       = "#FA9C1E"  # Computes ow orange from the current input.
OW_ORANGE_DARK  = "#D87F08"  # Computes ow orange dark from the current input.
OW_ORANGE_LIGHT = "#FFF3E5"  # Computes ow orange light from the current input.
OW_SLATE_DARK   = "#1E2328"  # Computes ow slate dark from the current input.
OW_SLATE_MID    = "#2D3440"  # Computes ow slate mid from the current input.
OW_BG           = "#F0F2F5"  # Computes ow bg from the current input.
OW_CARD_BG      = "#FFFFFF"  # Computes ow card bg from the current input.
OW_BORDER       = "#D9DFE8"  # Computes ow border from the current input.
OW_TEXT_DARK    = "#1A202C"  # Computes ow text dark from the current input.
OW_TEXT_MUTED   = "#718096"  # Computes ow text muted from the current input.
OW_WHITE        = "#FFFFFF"  # Computes ow white from the current input.

# ==========================================================
# COMPLETE PRE-CONFIGURED SETTINGS DATA
# ==========================================================
DEFAULT_COMBAT_MODS = {  # Defines the default combat modifiers applied to heroes.
    "Damage Dealt": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
    "Damage Received": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
    "Healing Dealt": "500%",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
    "Healing Received": "500%",  # Sets the 'Healing Received' value in this configuration or lookup table.
    "Health": "500%",  # Sets the 'Health' value in this configuration or lookup table.
    "Jump Vertical Speed": "800%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
    "Movement Gravity": "400%",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
    "Movement Speed": "300%",  # Sets the 'Movement Speed' value in this configuration or lookup table.
    "No Ammunition Requirement": "On",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
    "Ammunition Clip Size Scalar": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
    "Passive Health Regeneration": "Disabled",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
    "Primary Fire": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
    "Projectile Speed": "500%",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
    "Quick Melee": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
    "Receive Headshots Only": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
    "Role Passives": "Disabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
    "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    "Infinite Ultimate Duration": "Enabled",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
    "Ultimate Duration": "500%"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
}  # Closes the current mapping or grouped expression.

# Master Database with all specific hero abilities and modifiers
HEROES_DATABASE = {  # Stores the default workshop settings for each hero.
    "Ana": {  # Sets the 'Ana' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Biotic Grenade": "Disabled", "Damage Dealt": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled", "No Scope": "Enabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Sleep Dart": "Disabled", "Ultimate Ability Nano Boost": "Disabled"  # Sets the 'Sleep Dart' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Anran": {  # Sets the 'Anran' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Dancing Blaze": "Disabled", "Healing Received": "500%", "Health": "500%", "Inferno Rush": "Disabled",  # Sets the 'Dancing Blaze' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Vermillion Ascent": "Disabled"  # Sets the 'Ultimate Ability Vermillion Ascent' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Ashe": {  # Sets the 'Ashe' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Coach Gun": "Disabled", "Coach Gun Knockback Scalar Enemy": "300%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Coach Gun Knockback Scalar Self": "300%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Coach Gun Knockback Scalar Self' value in this configuration or lookup table.
        "Dynamite": "Disabled", "Dynamite Fuse Time Scalar": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Dynamite' value in this configuration or lookup table.
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "No Scope": "Enabled", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Scope' value in this configuration or lookup table.
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Projectile Gravity' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Ultimate Ability B.O.B.": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability B.O.B.' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Baptiste": {  # Sets the 'Baptiste' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Immortality Field": "Disabled",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Regenerative Burst": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Amplification Matrix": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability Amplification Matrix' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Bastion": {  # Sets the 'Bastion' value in this configuration or lookup table.
        "A-36 Tactical Grenade": "Disabled", "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%",  # Sets the 'A-36 Tactical Grenade' value in this configuration or lookup table.
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Reconfigure": "Disabled", "Role Passives": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Configuration: Artillery": "Disabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Ultimate Duration": "500%"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Brigitte": {  # Sets the 'Brigitte' value in this configuration or lookup table.
        "Barrier Shield": "Disabled", "Barrier Shield Recharge Rate": "500%", "Damage Dealt": "500%",  # Sets the 'Barrier Shield' value in this configuration or lookup table.
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Repair Pack": "Disabled", "Role Passives": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Shield Bash": "Disabled", "Shield Bash Knockback Scalar": "300%", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Shield Bash' value in this configuration or lookup table.
        "Ultimate Ability Rally": "Disabled", "Whip Shot": "Disabled", "Whip Shot Knockback Scalar": "300%"  # Sets the 'Ultimate Ability Rally' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Cassidy": {  # Sets the 'Cassidy' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Combat Roll": "Disabled", "Damage Dealt": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Flashbang": "Disabled", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Deadeye": "Disabled"  # Sets the 'Ultimate Ability Deadeye' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "D.Mon": {  # Sets the 'D.Mon' value in this configuration or lookup table.
        "[PH] Assemble Mech Knockback Scalar": "400%", "[PH] Propulsion Knockback Scalar": "400%",  # Sets the '[PH] Assemble Mech Knockback Scalar' value in this configuration or lookup table.
        "[PH] Skewer Knockback Scalar": "300%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the '[PH] Skewer Knockback Scalar' value in this configuration or lookup table.
        "Fusion Repeater": "Disabled", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",  # Sets the 'Fusion Repeater' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Power Barrier": "Disabled", "Primary Fire": "Disabled", "Propulsors": "Disabled",  # Sets the 'Power Barrier' value in this configuration or lookup table.
        "Propulsors Maximum Time": "500%", "Propulsors Recharge Rate": "500%", "Quick Melee": "Disabled",  # Sets the 'Propulsors Maximum Time' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Spawn Without Mech": "Enabled", "Ultimate Ability Limit Break ": "Disabled"  # Sets the 'Spawn Without Mech' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "D.Va": {  # Sets the 'D.Va' value in this configuration or lookup table.
        "Boosters": "Disabled", "Boosters Knockback Scalar": "400%", "Call Mech Knockback Scalar": "400%",  # Sets the 'Boosters' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Defense Matrix": "Disabled",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Micro Missiles": "Disabled",  # Sets the 'Healing Received' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Self Destruct Knockback Scalar": "200%",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Spawn Without Mech": "Enabled", "Ultimate Ability Self-Destruct": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Domina": {  # Sets the 'Domina' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Barrier Array": "Disabled", "Crystal Charge": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Reconstruction Heal Scalar": "300%", "Role Passives": "Disabled", "Sonic Repulsors": "Disabled",  # Sets the 'Reconstruction Heal Scalar' value in this configuration or lookup table.
        "Sonic Repulsors Knockback Scalar": "300%", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Sonic Repulsors Knockback Scalar' value in this configuration or lookup table.
        "Ultimate Ability Panopticon": "Disabled", "Ultimate Barrier Health Scalar Panopticon": "300%"  # Sets the 'Ultimate Ability Panopticon' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Doomfist": {  # Sets the 'Doomfist' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Ammunition Regeneration Time Scalar": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Meteor Strike Knockback Scalar": "300%",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Power Block": "Disabled", "Power Block Charge Rate": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Rocket Punch": "Disabled", "Rocket Punch Knockback Scalar": "300%",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Seismic Slam": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Meteor Strike": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability Meteor Strike' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Echo": {  # Sets the 'Echo' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Flight": "Disabled", "Focusing Beam": "Disabled", "Glide": "Disabled", "Healing Received": "500%",  # Sets the 'Flight' value in this configuration or lookup table.
        "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Health' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Sticky Bombs": "Disabled", "Ultimate Ability Duplicate": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Emre": {  # Sets the 'Emre' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Cyber Frag": "Disabled", "Cyber Frag Knockback Scalar": "300%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Infinite Ultimate Duration' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "No Scope": "Enabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "No Unscoped Fire": "Enabled", "Override Protocol Knockback Scalar": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'No Unscoped Fire' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Siphon Blaster": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Siphon Blaster Duration Scalar": "500%", "Siphon Blaster Heat Scalar": "500%",  # Sets the 'Siphon Blaster Duration Scalar' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Override Protocol": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Freja": {  # Sets the 'Freja' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Quick Dash": "Disabled", "Quick Dash Distance": "200%", "Quick Melee": "Disabled",  # Sets the 'Quick Dash' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Take Aim": "Disabled", "Take Aim Duration": "300%", "Ultimate Ability Bola Shot": "Disabled",  # Sets the 'Take Aim' value in this configuration or lookup table.
        "Updraft": "Disabled", "Updraft Height": "150%"  # Sets the 'Updraft' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Genji": {  # Sets the 'Genji' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Deflect": "Disabled", "Healing Received": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Health": "500%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",  # Sets the 'Health' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Swift Strike": "Disabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Dragonblade": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability Dragonblade' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Hanzo": {  # Sets the 'Hanzo' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Lunge": "Disabled", "Lunge Cooldown Time": "500%", "Lunge Distance Scalar": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Sonic Arrow": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Storm Arrows": "Disabled",  # Sets the 'Sonic Arrow' value in this configuration or lookup table.
        "Storm Arrows Quantity": "12", "Ultimate Ability Dragonstrike": "Disabled"  # Sets the 'Storm Arrows Quantity' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Hazard": {  # Sets the 'Hazard' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Jagged Wall": "Disabled", "Jagged Wall Health": "400%", "Jagged Wall Knockback": "400%",  # Sets the 'Jagged Wall' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Spike Guard": "Disabled", "Spike Guard Movement Speed Penalty": "150%",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Spike Guard Resource Cost": "200%", "Spike Guard Resource Regeneration": "200%",  # Sets the 'Spike Guard Resource Cost' value in this configuration or lookup table.
        "Ultimate Ability Downpour": "Disabled", "Violent Leap": "Disabled", "Violent Leap Distance": "200%"  # Sets the 'Ultimate Ability Downpour' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Illari": {  # Sets the 'Illari' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Dealt": "500%", "Healing Pylon": "Disabled",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Healing Received' value in this configuration or lookup table.
        "Movement Speed": "300%", "Outburst": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Captive Sun": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Jetpack Cat": {  # Sets the 'Jetpack Cat' value in this configuration or lookup table.
        "Biotic Pawjectile Range": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Biotic Pawjectile Range' value in this configuration or lookup table.
        "Frenetic Flight": "Disabled", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Frenetic Flight' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Lifeline": "Disabled", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Purr": "Disabled", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Purr' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Catnapper": "Disabled"  # Sets the 'Role Passives' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Junker Queen": {  # Sets the 'Junker Queen' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Carnage": "Disabled", "Commanding Shout": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Jagged Blade Gracie": "Disabled", "Jagged Blade Delay Before Automatic Recall": "400%",  # Sets the 'Jagged Blade Gracie' value in this configuration or lookup table.
        "Jagged Blade Knockback Scalar": "400%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Jagged Blade Knockback Scalar' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Rampage": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Junkrat": {  # Sets the 'Junkrat' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Concussion Mine": "Disabled", "Concussion Mine Knockback Scalar": "200%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Frag Launcher Knockback Scalar": "400%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Healing Received": "500%", "Health": "500%", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Healing Received' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Projectile Gravity' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Steel Trap": "Disabled", "Ultimate Ability RIP-Tire": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Steel Trap' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Juno": {  # Sets the 'Juno' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Glide Boost": "Disabled",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Glide Boost Duration Scalar": "500%", "Healing Dealt": "500%", "Healing Received": "500%",  # Sets the 'Glide Boost Duration Scalar' value in this configuration or lookup table.
        "Health": "500%", "Hyper Ring": "Disabled", "Jump Vertical Speed": "800%", "Martian Overboots": "Disabled",  # Sets the 'Health' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Pulsar Torpedoes": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Ultimate Ability Orbital Ray": "Disabled"  # Sets the 'Ultimate Ability Orbital Ray' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Kiriko": {  # Sets the 'Kiriko' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",  # Sets the 'Passive Health Regeneration' value in this configuration or lookup table.
        "Protection Suzu": "Disabled", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Protection Suzu' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Swift Step": "Disabled", "Swift Step Distance Scalar": "300%", "Ultimate Ability Kitsune Rush": "Disabled"  # Sets the 'Swift Step' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Lifeweaver": {  # Sets the 'Lifeweaver' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
        "Life Grip": "Disabled", "Life Grip and Healing Blossom Range": "200%", "Movement Gravity": "400%",  # Sets the 'Life Grip' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Petal Platform": "Disabled", "Petal Platform Health": "500%", "Primary Fire": "Disabled",  # Sets the 'Petal Platform' value in this configuration or lookup table.
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Projectile Gravity' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Rejuvenating Dash": "Disabled", "Rejuvenating Dash Cooldown Time": "500%",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Rejuvenating Dash Healing": "500%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Rejuvenating Dash Healing' value in this configuration or lookup table.
        "Tree of Life Health": "300%", "Ultimate Ability Tree of Life": "Disabled", "Weapons Enabled": "Healing Blossom Only"  # Sets the 'Tree of Life Health' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Lúcio": {  # Sets the 'Lúcio' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Amp It Up": "Disabled", "Crossfade": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Health' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Soundwave": "Disabled", "Soundwave Knockback Scalar": "300%",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Sound Barrier": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Mauga": {  # Sets the 'Mauga' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Cardiac Overdrive": "Disabled", "Cardiac Overdrive Healing": "400%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Incendiary Chaingun": "Disabled", "Incendiary Chaingun Ignite Damage": "500%", "Incendiary Chaingun Ignite Duration": "500%",  # Sets the 'Incendiary Chaingun' value in this configuration or lookup table.
        "Incendiary Chaingun Ignite Rate": "800%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",  # Sets the 'Incendiary Chaingun Ignite Rate' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On", "Overrun": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Overrun Knockback": "300%", "Passive Health Regeneration": "Disabled", "Projectile Speed": "500%",  # Sets the 'Overrun Knockback' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Cage Fight": "Disabled", "Ultimate Duration": "500%",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Volatile Chaingun": "Disabled"  # Sets the 'Volatile Chaingun' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Mei": {  # Sets the 'Mei' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Blizzard Freeze Minimum": "100%", "Blizzard Freeze Rate Scalar": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Cryo-Freeze": "Disabled", "Damage Dealt": "500%", "Damage Received": "500%", "Freeze Stacking": "Enabled",  # Sets the 'Cryo-Freeze' value in this configuration or lookup table.
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Ice Wall": "Disabled",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Projectile Gravity' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Blizzard": "Disabled", "Weapon Freeze Duration Scalar": "500%",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Weapon Freeze Minimum": "100%", "Weapon Freeze Rate Scalar": "500%"  # Sets the 'Weapon Freeze Minimum' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Mercy": {  # Sets the 'Mercy' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Angelic Descent": "Disabled", "Damage Dealt": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Flash Heal": "Disabled", "Guardian Angel": "Disabled", "Healing Dealt": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",  # Sets the 'Healing Received' value in this configuration or lookup table.
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Speed' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Resurrect": "Disabled", "Role Passives": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Sympathetic Recovery": "Disabled",  # Sets the 'Secondary Fire' value in this configuration or lookup table.
        "Ultimate Ability Valkyrie": "Disabled", "Weapons Enabled": "Caduceus Staff Only"  # Sets the 'Ultimate Ability Valkyrie' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Mizuki": {  # Sets the 'Mizuki' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Binding Chain": "Disabled", "Damage Dealt": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Kasa": "Disabled", "Healing Received": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Health": "500%", "Jump Vertical Speed": "800%", "Katashiro Return": "Disabled",  # Sets the 'Health' value in this configuration or lookup table.
        "Katashiro Return Duration Scalar": "500%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Katashiro Return Duration Scalar' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Kekkai Sanctuary": "Disabled"  # Sets the 'Role Passives' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Moira": {  # Sets the 'Moira' value in this configuration or lookup table.
        "Biotic Energy Maximum": "500%", "Biotic Energy Recharge Rate": "500%", "Biotic Orb": "Disabled",  # Sets the 'Biotic Energy Maximum' value in this configuration or lookup table.
        "Biotic Orb Max Damage Scalar": "500%", "Biotic Orb Max Healing Scalar": "500%", "Damage Dealt": "500%",  # Sets the 'Biotic Orb Max Damage Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Fade": "Disabled", "Healing Dealt": "500%", "Healing Received": "500%",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Health": "500%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",  # Sets the 'Health' value in this configuration or lookup table.
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",  # Sets the 'Movement Gravity' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Coalescence": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Orisa": {  # Sets the 'Orisa' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Energy Javelin": "Disabled", "Fortify": "Disabled", "Healing Received": "500%", "Health": "500%",  # Sets the 'Energy Javelin' value in this configuration or lookup table.
        "Javelin Spin": "Disabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Javelin Spin' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Projectile Gravity' value in this configuration or lookup table.
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Receive Headshots Only' value in this configuration or lookup table.
        "Ultimate Ability Terra Surge": "Disabled"  # Sets the 'Ultimate Ability Terra Surge' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Pharah": {  # Sets the 'Pharah' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Concussive Blast": "Disabled", "Concussive Blast Knockback Scalar": "300%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",  # Sets the 'Damage Dealt' value in this configuration or lookup table.
        "Hover Jets": "Disabled", "Hover Jets Extra Fuel Scalar": "200%", "Hover Jets Vertical Speed Scalar": "300%",  # Sets the 'Hover Jets' value in this configuration or lookup table.
        "Jet Dash": "Disabled", "Jump Jet": "Disabled", "Jump Jet Acceleration Scalar": "300%", "Jump Jet Refuel Scalar": "400%",  # Sets the 'Jet Dash' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",  # Sets the 'Projectile Speed' value in this configuration or lookup table.
        "Rocket Launcher Knockback Scalar": "400%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Rocket Launcher Knockback Scalar' value in this configuration or lookup table.
        "Ultimate Ability Barrage": "Disabled"  # Sets the 'Ultimate Ability Barrage' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Ramattra": {  # Sets the 'Ramattra' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Block Nemesis Form": "Disabled", "Damage Dealt": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Damage Received": "500%", "Healing Received": "500%", "Health": "500%", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Damage Received' value in this configuration or lookup table.
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",  # Sets the 'Jump Vertical Speed' value in this configuration or lookup table.
        "Nemesis Form": "Disabled", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",  # Sets the 'Nemesis Form' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Ravenous Vortex": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Ravenous Vortex' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Annihilation": "Disabled", "Ultimate Duration": "500%",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Void Barrier Omnic Form": "Disabled"  # Sets the 'Void Barrier Omnic Form' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Reaper": {  # Sets the 'Reaper' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",  # Sets the 'Healing Dealt' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Shadow Step": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Death Blossom": "Disabled",  # Sets the 'Shadow Step' value in this configuration or lookup table.
        "Wraith Form": "Disabled"  # Sets the 'Wraith Form' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Reinhardt": {  # Sets the 'Reinhardt' value in this configuration or lookup table.
        "Barrier Field": "Disabled", "Charge": "Disabled", "Charge Knockback Scalar": "300%",  # Sets the 'Barrier Field' value in this configuration or lookup table.
        "Fire Strike": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Fire Strike' value in this configuration or lookup table.
        "Rocket Hammer Knockback Scalar": "400%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Rocket Hammer Knockback Scalar' value in this configuration or lookup table.
        "Ultimate Ability Earthshatter": "Disabled"  # Sets the 'Ultimate Ability Earthshatter' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Roadhog": {  # Sets the 'Roadhog' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Chain Hook": "Disabled", "No Ammunition Requirement": "On",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Take a Breather": "Disabled", "Take a Breather Maximum Time": "500%",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Take a Breather Recharge Rate": "500%", "Ultimate Ability Whole Hog": "Disabled", "Whole Hog Knockback Scalar": "300%"  # Sets the 'Take a Breather Recharge Rate' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Shion": {  # Sets the 'Shion' value in this configuration or lookup table.
        "Evade": "Disabled", "Evade Distance Scalar": "300%", "Execution": "Disabled", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Evade' value in this configuration or lookup table.
        "Joyride": "Disabled", "Joyride Duration Scalar": "500%", "Joyride Infinite Duration": "Enabled",  # Sets the 'Joyride' value in this configuration or lookup table.
        "Joyride Knockback Scalar": "400%", "Joyride Speed Scalar": "300%", "Primary Fire": "Disabled",  # Sets the 'Joyride Knockback Scalar' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Ultimate Ability Satsuriku Spree": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability Satsuriku Spree' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Sierra": {  # Sets the 'Sierra' value in this configuration or lookup table.
        "Anchor Drone": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Anchor Drone' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Tracking Shot": "Disabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Tremor Charge": "Disabled", "Tremor Charge Knockback Scalar": "400%", "Ultimate Ability Trailblazer": "Disabled"  # Sets the 'Tremor Charge' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Sigma": {  # Sets the 'Sigma' value in this configuration or lookup table.
        "Accretion": "Disabled", "Accretion Knockback Scalar": "300%", "Experimental Barrier": "Disabled",  # Sets the 'Accretion' value in this configuration or lookup table.
        "Kinetic Grasp": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Kinetic Grasp' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Gravitic Flux": "Disabled"  # Sets the 'Role Passives' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Sojourn": {  # Sets the 'Sojourn' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Charged Shot": "Disabled", "Charged Shot Energy Charge Rate": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Disruptor Shot": "Disabled", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",  # Sets the 'Disruptor Shot' value in this configuration or lookup table.
        "Power Slide": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Power Slide' value in this configuration or lookup table.
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Overclock": "Disabled",  # Sets the 'Secondary Fire' value in this configuration or lookup table.
        "Ultimate Duration": "500%"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Soldier: 76": {  # Sets the 'Soldier: 76' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Biotic Field": "Disabled", "Helix Rockets": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Helix Rockets Knockback Scalar": "400%", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",  # Sets the 'Helix Rockets Knockback Scalar' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Sprint": "Disabled", "Ultimate Ability Tactical Visor": "Disabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Ultimate Duration": "500%"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Sombra": {  # Sets the 'Sombra' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Hack": "Disabled", "No Ammunition Requirement": "On",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Translocator": "Disabled", "Ultimate Ability EMP": "Disabled", "Virus": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Symmetra": {  # Sets the 'Symmetra' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Primary Fire": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Sentry Turret": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Teleporter": "Disabled",  # Sets the 'Sentry Turret' value in this configuration or lookup table.
        "Ultimate Ability Photon Barrier": "Disabled"  # Sets the 'Ultimate Ability Photon Barrier' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Torbjörn": {  # Sets the 'Torbjörn' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Deploy Turret": "Disabled", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Overload": "Disabled", "Overload Duration Scalar": "500%",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Molten Core": "Disabled",  # Sets the 'Secondary Fire' value in this configuration or lookup table.
        "Ultimate Duration": "500%", "Weapons Enabled": "Rivet Gun Only"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Tracer": {  # Sets the 'Tracer' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Blink": "Disabled", "No Ammunition Requirement": "On",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Recall": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Pulse Bomb": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Vendetta": {  # Sets the 'Vendetta' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Projected Edge": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Soaring Slice": "Disabled", "Soaring Slice Distance": "300%",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Sundering Blade": "Disabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Warding Stance": "Disabled", "Warding Stance Regen Scalar": "500%", "Whirlwind Dash": "Disabled",  # Sets the 'Warding Stance' value in this configuration or lookup table.
        "Whirlwind Dash Distance": "300%"  # Sets the 'Whirlwind Dash Distance' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Venture": {  # Sets the 'Venture' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Burrow": "Disabled", "Burrow Duration Scalar": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Drill Dash": "Disabled", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",  # Sets the 'Drill Dash' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Tectonic Shock": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Widowmaker": {  # Sets the 'Widowmaker' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Grappling Hook": "Disabled", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled", "No Scope": "Enabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Infra-Sight": "Disabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Ultimate Duration": "500%", "Venom Mine": "Disabled"  # Sets the 'Ultimate Duration' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Winston": {  # Sets the 'Winston' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Barrier Projector": "Disabled", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Jump Pack": "Disabled", "Jump Pack Acceleration Scalar": "300%", "Jump Pack Knockback Scalar": "400%",  # Sets the 'Jump Pack' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Primal Rage Melee Knockback Scalar": "300%", "Primary Fire": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Primal Rage": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Wrecking Ball": {  # Sets the 'Wrecking Ball' value in this configuration or lookup table.
        "Adaptive Shield": "Disabled", "Ammunition Clip Size Scalar": "500%", "Grappling Claw": "Disabled",  # Sets the 'Adaptive Shield' value in this configuration or lookup table.
        "Grappling Claw Knockback Scalar": "400%", "Infinite Ultimate Duration": "Enabled",  # Sets the 'Grappling Claw Knockback Scalar' value in this configuration or lookup table.
        "Minefield Knockback Scalar": "400%", "No Ammunition Requirement": "On", "Piledriver": "Disabled",  # Sets the 'Minefield Knockback Scalar' value in this configuration or lookup table.
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",  # Sets the 'Primary Fire' value in this configuration or lookup table.
        "Roll": "Disabled", "Roll Always Active": "Enabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Roll' value in this configuration or lookup table.
        "Ultimate Ability Minefield": "Disabled", "Ultimate Duration": "500%"  # Sets the 'Ultimate Ability Minefield' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Wuyang": {  # Sets the 'Wuyang' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "Guardian Wave": "Disabled", "Guardian Wave Knockback Scalar": "500%",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "No Ammunition Requirement": "On", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'No Ammunition Requirement' value in this configuration or lookup table.
        "Restorative Stream": "Disabled", "Restorative Stream Drain Rate": "500%", "Restorative Stream Recharge Rate": "500%",  # Sets the 'Restorative Stream' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Rushing Torrent": "Disabled", "Rushing Torrent Duration Scalar": "500%",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Tidal Blast": "Disabled",  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
        "Water Staff Orb Maximum Control Time": "500%", "Water Staff Orb Turn Rate": "500%"  # Sets the 'Water Staff Orb Maximum Control Time' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Zarya": {  # Sets the 'Zarya' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Particle Barrier": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Particle Cannon Secondary Knockback Scalar": "400%", "Primary Fire": "Disabled", "Projected Barrier": "Disabled",  # Sets the 'Particle Cannon Secondary Knockback Scalar' value in this configuration or lookup table.
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",  # Sets the 'Quick Melee' value in this configuration or lookup table.
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Graviton Surge": "Disabled"  # Sets the 'Spawn With Ultimate Ready' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Zenyatta": {  # Sets the 'Zenyatta' value in this configuration or lookup table.
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Orb of Discord": "Disabled",  # Sets the 'Ammunition Clip Size Scalar' value in this configuration or lookup table.
        "Orb of Harmony": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",  # Sets the 'Orb of Harmony' value in this configuration or lookup table.
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",  # Sets the 'Role Passives' value in this configuration or lookup table.
        "Ultimate Ability Transcendence": "Disabled"  # Sets the 'Ultimate Ability Transcendence' value in this configuration or lookup table.
    }  # Closes the current mapping or grouped expression.
}  # Closes the current mapping or grouped expression.

# Pre-populate all individual heroes with unified combat modifiers
for hero_name, hero_dict in HEROES_DATABASE.items():  # Processes each hero_name, hero_dict from HEROES_DATABASE.items().
    for mod_key, mod_val in DEFAULT_COMBAT_MODS.items():  # Processes each mod_key, mod_val from DEFAULT_COMBAT_MODS.items().
        if mod_key not in hero_dict:  # Checks whether mod_key not in hero_dict before entering this branch.
            hero_dict[mod_key] = mod_val  # Provides this value as an entry in the enclosing data structure.

# Lobby Settings
LOBBY_SETTINGS = {  # Sets lobby settings from the configured value or expression.
    "Allow Players Who Are In Queue": "Yes",  # Sets the 'Allow Players Who Are In Queue' value in this configuration or lookup table.
    "Data Center Preference": "USA - Central",  # Sets the 'Data Center Preference' value in this configuration or lookup table.
    "Map Rotation": "After A Game",  # Sets the 'Map Rotation' value in this configuration or lookup table.
    "Match Voice Chat": "Enabled",  # Sets the 'Match Voice Chat' value in this configuration or lookup table.
    "Max FFA Players": "1",  # Sets the 'Max FFA Players' value in this configuration or lookup table.
    "Max Spectators": "12",  # Sets the 'Max Spectators' value in this configuration or lookup table.
    "Max Team 1 Players": "5",  # Sets the 'Max Team 1 Players' value in this configuration or lookup table.
    "Max Team 2 Players": "0",  # Sets the 'Max Team 2 Players' value in this configuration or lookup table.
    "Minimum Latency milliseconds": "150000000",  # Sets the 'Minimum Latency milliseconds' value in this configuration or lookup table.
    "Pause Game On Player Disconnect": "Yes",  # Sets the 'Pause Game On Player Disconnect' value in this configuration or lookup table.
    "Return To Lobby": "After A Game",  # Sets the 'Return To Lobby' value in this configuration or lookup table.
    "Team Balancing": "After A Mirror Match",  # Sets the 'Team Balancing' value in this configuration or lookup table.
    "Use Experimental Update If Available": "Yes"  # Sets the 'Use Experimental Update If Available' value in this configuration or lookup table.
}  # Closes the current mapping or grouped expression.

# Mode General
GENERAL_MODE_SETTINGS = {  # Sets general mode settings from the configured value or expression.
    "Enemy Health Bars": "Disabled",  # Sets the 'Enemy Health Bars' value in this configuration or lookup table.
    "Game Mode Start": "Manual",  # Sets the 'Game Mode Start' value in this configuration or lookup table.
    "Hero Limit": "2 Per Game",  # Sets the 'Hero Limit' value in this configuration or lookup table.
    "Kill Cam": "Disabled",  # Sets the 'Kill Cam' value in this configuration or lookup table.
    "Kill Feed": "Disabled",  # Sets the 'Kill Feed' value in this configuration or lookup table.
    "Limit Roles": "2 Of Each Role Per Team",  # Sets the 'Limit Roles' value in this configuration or lookup table.
    "Respawn Time Scalar": "0%",  # Sets the 'Respawn Time Scalar' value in this configuration or lookup table.
    "Skins": "Disabled",  # Sets the 'Skins' value in this configuration or lookup table.
    "Spawn Health Packs": "Disabled",  # Sets the 'Spawn Health Packs' value in this configuration or lookup table.
    "Team Overlay": "Enabled"  # Sets the 'Team Overlay' value in this configuration or lookup table.
}  # Closes the current mapping or grouped expression.

# Individual Game Modes
GAME_MODES = {  # Sets game modes from the configured value or expression.
    "Assault": {  # Sets the 'Assault' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Enable Perks": "Off", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",  # Sets the 'Enable Perks' value in this configuration or lookup table.
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled"  # Sets the 'Random Hero Role Limit Per Team' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Bounty Hunter": {  # Sets the 'Bounty Hunter' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Base Score for Killing a Bounty Target": "1000",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Bounty Increase per Kill as Bounty Target": "1000", "Enable Perks": "On", "Game Length In Minutes": "15",  # Sets the 'Bounty Increase per Kill as Bounty Target' value in this configuration or lookup table.
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",  # Sets the 'Perk Elimination Catchup Level Amount' value in this configuration or lookup table.
        "Respawn As Random Hero": "Enabled", "Score per Kill": "1000", "Score per Kill as Bounty Target": "1000",  # Sets the 'Respawn As Random Hero' value in this configuration or lookup table.
        "Score To Win": "5000", "Self Initiated Respawn": "Off", "Tank Role Passive Health Bonus": "Disabled"  # Sets the 'Score To Win' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Capture the Flag": {  # Sets the 'Capture the Flag' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Blitz Flag Locations": "Yes", "Damage Interrupts Flag Interaction": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Enable Perks": "On", "Flag Carrier Abilities": "All", "Flag Dropped Lock Time": "10.0",  # Sets the 'Enable Perks' value in this configuration or lookup table.
        "Flag Pickup Time": "5.0", "Flag Return Time": "5.0", "Flag Score Respawn Time": "20.0",  # Sets the 'Flag Pickup Time' value in this configuration or lookup table.
        "Game Length Minutes": "15", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",  # Sets the 'Game Length Minutes' value in this configuration or lookup table.
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Respawn Speed Buff Duration": "60.0",  # Sets the 'Random Hero Role Limit Per Team' value in this configuration or lookup table.
        "Score To Win": "9", "Tank Role Passive Health Bonus": "Disabled", "Team Needs Flag At Base To Score": "Yes"  # Sets the 'Score To Win' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Clash": {  # Sets the 'Clash' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Enable Perks": "Off", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",  # Sets the 'Enable Perks' value in this configuration or lookup table.
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",  # Sets the 'Random Hero Role Limit Per Team' value in this configuration or lookup table.
        "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'Limit Roles' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Control": {  # Sets the 'Control' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Enable Perks": "Off", "Limit Valid Control Points": "Second", "Perk Elimination Catchup Level Amount": "100%",  # Sets the 'Enable Perks' value in this configuration or lookup table.
        "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled",  # Sets the 'Perk Generation' value in this configuration or lookup table.
        "Score To Win": "3", "Scoring Speed Modifier": "500%", "Tank Role Passive Health Bonus": "Disabled",  # Sets the 'Score To Win' value in this configuration or lookup table.
        "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'Limit Roles' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Deathmatch": {  # Sets the 'Deathmatch' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Enable Perks": "On", "Game Length In Minutes": "15",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",  # Sets the 'Perk Elimination Catchup Level Amount' value in this configuration or lookup table.
        "Respawn As Random Hero": "Enabled", "Score To Win": "5000", "Self Initiated Respawn": "Off",  # Sets the 'Respawn As Random Hero' value in this configuration or lookup table.
        "Tank Role Passive Health Bonus": "Disabled"  # Sets the 'Tank Role Passive Health Bonus' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Elimination": {  # Sets the 'Elimination' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Objective Tiebreaker": "Disabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Draw After Match Time Elapsed With No Tiebreaker": "300", "Enable Perks": "On", "Hero Selection": "Random",  # Sets the 'Draw After Match Time Elapsed With No Tiebreaker' value in this configuration or lookup table.
        "Hero Selection Time": "60", "Limited Choice Pool": "Team Size", "Perk Elimination Catchup Level Amount": "100%",  # Sets the 'Hero Selection Time' value in this configuration or lookup table.
        "Perk Generation": "500%", "Respawn As Random Hero": "Enabled", "Restrict Previously Used Heroes": "After Round Won",  # Sets the 'Perk Generation' value in this configuration or lookup table.
        "Reveal Heroes": "Enabled", "Reveal Heroes After Match Time Elapsed": "180", "Score To Win": "9",  # Sets the 'Reveal Heroes' value in this configuration or lookup table.
        "Tiebreaker After Match Time Elapsed": "300", "Time To Capture": "7"  # Sets the 'Tiebreaker After Match Time Elapsed' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Escort": {  # Sets the 'Escort' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Competitive Rules": "On", "Enable Perks": "Off",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Payload Speed Modifier": "500%", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",  # Sets the 'Payload Speed Modifier' value in this configuration or lookup table.
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",  # Sets the 'Random Hero Role Limit Per Team' value in this configuration or lookup table.
        "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'Limit Roles' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Flashpoint": {  # Sets the 'Flashpoint' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Control Point A": "Disabled", "Control Point B": "Disabled", "Control Point C": "Disabled",  # Sets the 'Control Point A' value in this configuration or lookup table.
        "Control Point D": "Disabled", "Control Point E": "Disabled", "Enable Perks": "Off",  # Sets the 'Control Point D' value in this configuration or lookup table.
        "First Active Control Point": "E", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",  # Sets the 'First Active Control Point' value in this configuration or lookup table.
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Score To Win": "10",  # Sets the 'Random Hero Role Limit Per Team' value in this configuration or lookup table.
        "Scoring Speed Modifier": "500%", "Tank Role Passive Health Bonus": "Disabled",  # Sets the 'Scoring Speed Modifier' value in this configuration or lookup table.
        "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'Limit Roles' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Hybrid": {  # Sets the 'Hybrid' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Enable Perks": "Off", "Payload Speed Modifier": "500%", "Perk Elimination Catchup Level Amount": "100%",  # Sets the 'Enable Perks' value in this configuration or lookup table.
        "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled",  # Sets the 'Perk Generation' value in this configuration or lookup table.
        "Tank Role Passive Health Bonus": "Disabled", "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'Tank Role Passive Health Bonus' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Push": {  # Sets the 'Push' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Competitive Rules": "On", "Enable Perks": "Off",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",  # Sets the 'Perk Elimination Catchup Level Amount' value in this configuration or lookup table.
        "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",  # Sets the 'Respawn As Random Hero' value in this configuration or lookup table.
        "TS-1 Push Speed Modifier": "500%", "TS-1 Walk Speed Modifier": "500%", "Limit Roles": "1 Tank 2 Offense 2 Support"  # Sets the 'TS-1 Push Speed Modifier' value in this configuration or lookup table.
    },  # Closes the current mapping or grouped expression.
    "Team Deathmatch": {  # Sets the 'Team Deathmatch' value in this configuration or lookup table.
        "Allow Hero Switching": "Disabled", "Enable Perks": "On", "Game Length In Minutes": "15",  # Sets the 'Allow Hero Switching' value in this configuration or lookup table.
        "Imbalanced Team Score To Win": "On", "Mercy Resurrect Counteracts Kills": "Off",  # Sets the 'Imbalanced Team Score To Win' value in this configuration or lookup table.
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",  # Sets the 'Perk Elimination Catchup Level Amount' value in this configuration or lookup table.
        "Respawn As Random Hero": "Enabled", "Score To Win": "200", "Self Initiated Respawn": "Off",  # Sets the 'Respawn As Random Hero' value in this configuration or lookup table.
        "Tank Role Passive Health Bonus": "Disabled", "Team 1 Score To Win": "200", "Team 2 Score To Win": "200"  # Sets the 'Tank Role Passive Health Bonus' value in this configuration or lookup table.
    }  # Closes the current mapping or grouped expression.
}  # Closes the current mapping or grouped expression.

# Disabled Heroes by Team / FFA
TEAM_DISABLED_HEROES = {  # Sets team disabled heroes from the configured value or expression.
    "Team 1": ["Ana"],  # Sets the 'Team 1' value in this configuration or lookup table.
    "Team 2": ["Anran"],  # Sets the 'Team 2' value in this configuration or lookup table.
    "Team FFA": ["Ashe"]  # Sets the 'Team FFA' value in this configuration or lookup table.
}  # Closes the current mapping or grouped expression.

# ==========================================================
# WORKSHOP CODE WRITER / BUILDER
# ==========================================================
def build_workshop_text():  # Defines the Build workshop text function.
    out = []  # Initializes out as an empty list for accumulating results.
    
    # 1. Main Settings Block
    out.append("settings")  # Adds the supplied value to out.
    out.append("{")  # Adds the supplied value to out.
    
    out.append("\tmain")  # Adds the supplied value to out.
    out.append("\t{")  # Adds the supplied value to out.
    out.append('\t\tMode Name: "all gamemode settings shown"')  # Adds the supplied value to out.
    out.append("\t}")  # Adds the supplied value to out.
    out.append("")  # Adds the supplied value to out.

    # 2. Lobby
    out.append("\tlobby")  # Adds the supplied value to out.
    out.append("\t{")  # Adds the supplied value to out.
    for k, v in sorted(LOBBY_SETTINGS.items()):  # Processes each k, v from sorted(LOBBY_SETTINGS.items()).
        out.append(f"\t\t{k}: {v}")  # Adds the supplied value to out.
    out.append("\t}")  # Adds the supplied value to out.
    out.append("")  # Adds the supplied value to out.

    # 3. Modes
    out.append("\tmodes")  # Adds the supplied value to out.
    out.append("\t{")  # Adds the supplied value to out.
    for mode_name, settings in sorted(GAME_MODES.items()):  # Processes each mode_name, settings from sorted(GAME_MODES.items()).
        out.append(f"\t\t{mode_name}")  # Adds the supplied value to out.
        out.append("\t\t{")  # Adds the supplied value to out.
        for k, v in sorted(settings.items()):  # Processes each k, v from sorted(settings.items()).
            out.append(f"\t\t\t{k}: {v}")  # Adds the supplied value to out.
        out.append("\t\t}")  # Adds the supplied value to out.
        out.append("")  # Adds the supplied value to out.

    out.append("\t\tGeneral")  # Adds the supplied value to out.
    out.append("\t\t{")  # Adds the supplied value to out.
    for k, v in sorted(GENERAL_MODE_SETTINGS.items()):  # Processes each k, v from sorted(GENERAL_MODE_SETTINGS.items()).
        out.append(f"\t\t\t{k}: {v}")  # Adds the supplied value to out.
    out.append("\t\t}")  # Adds the supplied value to out.
    out.append("\t}")  # Adds the supplied value to out.
    out.append("")  # Adds the supplied value to out.

    # 4. Heroes Block
    out.append("\theroes")  # Adds the supplied value to out.
    out.append("\t{")  # Adds the supplied value to out.

    # Team bans
    for team, disabled_list in TEAM_DISABLED_HEROES.items():  # Processes each team, disabled_list from TEAM_DISABLED_HEROES.items().
        out.append(f"\t\t{team}")  # Adds the supplied value to out.
        out.append("\t\t{")  # Adds the supplied value to out.
        out.append("\t\t\tdisabled heroes")  # Adds the supplied value to out.
        out.append("\t\t\t{")  # Adds the supplied value to out.
        for h in disabled_list:  # Processes each h from disabled_list.
            out.append(f"\t\t\t\t{h}")  # Adds the supplied value to out.
        out.append("\t\t\t}")  # Adds the supplied value to out.
        out.append("\t\t}")  # Adds the supplied value to out.
        out.append("")  # Adds the supplied value to out.

    # Heroes -> General
    out.append("\t\tGeneral")  # Adds the supplied value to out.
    out.append("\t\t{")  # Adds the supplied value to out.
    for k, v in sorted(DEFAULT_COMBAT_MODS.items()):  # Processes each k, v from sorted(DEFAULT_COMBAT_MODS.items()).
        out.append(f"\t\t\t{k}: {v}")  # Adds the supplied value to out.
    out.append("")  # Adds the supplied value to out.

    # Per Hero Modifiers
    for hero, settings in sorted(HEROES_DATABASE.items()):  # Processes each hero, settings from sorted(HEROES_DATABASE.items()).
        out.append(f"\t\t\t{hero}")  # Adds the supplied value to out.
        out.append("\t\t\t{")  # Adds the supplied value to out.
        for k, v in sorted(settings.items()):  # Processes each k, v from sorted(settings.items()).
            out.append(f"\t\t\t\t{k}: {v}")  # Adds the supplied value to out.
        out.append("\t\t\t}")  # Adds the supplied value to out.
        out.append("")  # Adds the supplied value to out.

    out.append("\t\t}")  # Adds the supplied value to out.
    out.append("\t}")  # Adds the supplied value to out.
    out.append("}")  # Adds the supplied value to out.

    return "\n".join(out)  # Returns "\n".join(out) to the caller.

# ==========================================================
# MODERN GUI APPLICATION
# ==========================================================
class OverwatchWorkshopGenerator(tk.Tk):  # Defines the OverwatchWorkshopGenerator class.
    def __init__(self):  # Defines the   init   function.
        super().__init__()  # Calls super to perform this step.

        self.title("Overwatch Workshop Master Generator & Editor")  # Sets the window title.
        self.geometry("1280x820")  # Sets the window size.
        self.minsize(1050, 700)  # Calls self.minsize to perform this step.
        self.configure(bg=OW_BG)  # Configures self for the desired interface behavior or appearance.

        self.active_category = None  # Sets active category from the configured value or expression.
        self._setup_styles()  # Calls self._setup_styles to perform this step.
        self._build_header()  # Calls self._build_header to perform this step.
        self._build_layout()  # Calls self._build_layout to perform this step.
        self._populate_sidebar()  # Calls self._populate_sidebar to perform this step.

    def _setup_styles(self):  # Defines the  setup styles function.
        self.style = ttk.Style(self)  # Creates a Style object for style.
        self.style.theme_use('clam')  # Configures self.style for the desired interface behavior or appearance.

        self.style.configure("Treeview",  # Configures self.style for the desired interface behavior or appearance.
            background=OW_WHITE, foreground=OW_TEXT_DARK, rowheight=28,  # Computes background from the current input.
            fieldbackground=OW_WHITE, bordercolor=OW_BORDER, borderwidth=1,  # Computes fieldbackground from the current input.
            font=("Segoe UI", 10)  # Computes font from the current input.
        )  # Closes the continued call or expression.
        self.style.map("Treeview",  # Configures self.style for the desired interface behavior or appearance.
            background=[('selected', OW_ORANGE)],  # Computes background from the current input.
            foreground=[('selected', OW_WHITE)]  # Computes foreground from the current input.
        )  # Closes the continued call or expression.
        self.style.configure("Treeview.Heading",  # Configures self.style for the desired interface behavior or appearance.
            background=OW_SLATE_MID, foreground=OW_WHITE,  # Computes background from the current input.
            relief="flat", font=("Segoe UI", 10, "bold")  # Computes relief from the current input.
        )  # Closes the continued call or expression.
        self.style.configure("TCombobox", padding=4)  # Configures self.style for the desired interface behavior or appearance.

    def _build_header(self):  # Defines the  build header function.
        header = tk.Frame(self, bg=OW_SLATE_DARK, height=65)  # Creates a Frame object for header.
        header.pack(fill="x", side="top")  # Places header in the interface layout.
        header.pack_propagate(False)  # Calls header.pack_propagate to perform this step.

        brand = tk.Frame(header, bg=OW_SLATE_DARK)  # Creates a Frame object for brand.
        brand.pack(side="left", padx=20, pady=10)  # Places brand in the interface layout.

        badge = tk.Label(brand, text="OW", bg=OW_ORANGE, fg=OW_WHITE, font=("Segoe UI", 12, "bold"), padx=6, pady=2)  # Creates a Label object for badge.
        badge.pack(side="left", padx=(0, 10))  # Places badge in the interface layout.

        title = tk.Label(brand, text="WORKSHOP MASTER GENERATOR", bg=OW_SLATE_DARK, fg=OW_WHITE, font=("Segoe UI Black", 14))  # Creates a Label object for title.
        title.pack(side="left")  # Places title in the interface layout.

        actions = tk.Frame(header, bg=OW_SLATE_DARK)  # Creates a Frame object for actions.
        actions.pack(side="right", padx=20)  # Places actions in the interface layout.

        self._btn(actions, "⚡ Sync All to 500%", self._sync_all_500, bg=OW_SLATE_MID, fg=OW_WHITE).pack(side="left", padx=4)  # Calls self._btn to perform this step.
        self._btn(actions, "📄 View Output Code", self._show_live_code, bg=OW_SLATE_MID, fg=OW_WHITE).pack(side="left", padx=4)  # Calls self._btn to perform this step.
        self._btn(actions, "💾 Export settings.txt", self._export_file, bg=OW_ORANGE_DARK, fg=OW_WHITE).pack(side="left", padx=4)  # Calls self._btn to perform this step.
        self._btn(actions, "📑 Copy to Clipboard", self._copy_code, bg=OW_ORANGE, fg=OW_WHITE).pack(side="left", padx=4)  # Calls self._btn to perform this step.

    def _build_layout(self):  # Defines the  build layout function.
        main_pane = tk.PanedWindow(self, orient="horizontal", bg=OW_BORDER, bd=0, sashwidth=4)  # Creates a PanedWindow object for main pane.
        main_pane.pack(fill="both", expand=True, padx=15, pady=15)  # Places main_pane in the interface layout.

        # LEFT SIDEBAR
        left_frame = tk.Frame(main_pane, bg=OW_WHITE, bd=1, relief="solid", highlightbackground=OW_BORDER)  # Creates a Frame object for left frame.
        main_pane.add(left_frame, minsize=290, width=320)  # Adds the supplied value to main_pane.

        sb_header = tk.Frame(left_frame, bg=OW_BG, height=45)  # Creates a Frame object for sb header.
        sb_header.pack(fill="x")  # Places sb_header in the interface layout.
        sb_header.pack_propagate(False)  # Calls sb_header.pack_propagate to perform this step.
        tk.Label(sb_header, text="SETTINGS EXPLORER", bg=OW_BG, fg=OW_TEXT_MUTED, font=("Segoe UI", 9, "bold")).pack(side="left", padx=12, pady=12)  # Calls tk.Label to perform this step.

        # Search Bar
        search_box = tk.Frame(left_frame, bg=OW_WHITE)  # Creates a Frame object for search box.
        search_box.pack(fill="x", padx=10, pady=8)  # Places search_box in the interface layout.
        self.search_var = tk.StringVar()  # Creates a StringVar object for search var.
        self.search_var.trace_add("write", lambda *a: self._filter_tree())  # Calls self.search_var.trace_add to perform this step.
        search_ent = tk.Entry(search_box, textvariable=self.search_var, bg=OW_BG, fg=OW_TEXT_DARK, relief="flat", font=("Segoe UI", 10))  # Creates a Entry object for search ent.
        search_ent.pack(fill="x", ipady=4, padx=2)  # Places search_ent in the interface layout.
        search_ent.insert(0, "🔍 Filter heroes & modes...")  # Adds the supplied value to search_ent.
        search_ent.bind("<FocusIn>", lambda e: search_ent.delete(0, 'end') if "🔍" in search_ent.get() else None)  # Connects an event on search_ent to its handler.

        tree_box = tk.Frame(left_frame, bg=OW_WHITE)  # Creates a Frame object for tree box.
        tree_box.pack(fill="both", expand=True, padx=10, pady=(0, 10))  # Places tree_box in the interface layout.

        self.tree = ttk.Treeview(tree_box, selectmode="browse", show="tree")  # Creates a Treeview object for tree.
        tree_scroll = ttk.Scrollbar(tree_box, orient="vertical", command=self.tree.yview)  # Creates a Scrollbar object for tree scroll.
        self.tree.configure(yscrollcommand=tree_scroll.set)  # Configures self.tree for the desired interface behavior or appearance.
        self.tree.pack(side="left", fill="both", expand=True)  # Places self.tree in the interface layout.
        tree_scroll.pack(side="right", fill="y")  # Places tree_scroll in the interface layout.
        self.tree.bind("<<TreeviewSelect>>", self._on_select)  # Connects an event on self.tree to its handler.

        # RIGHT MAIN EDITOR
        right_frame = tk.Frame(main_pane, bg=OW_WHITE, bd=1, relief="solid", highlightbackground=OW_BORDER)  # Creates a Frame object for right frame.
        main_pane.add(right_frame, minsize=650)  # Adds the supplied value to main_pane.

        self.top_bar = tk.Frame(right_frame, bg=OW_BG, height=50)  # Creates a Frame object for top bar.
        self.top_bar.pack(fill="x")  # Places self.top_bar in the interface layout.
        self.top_bar.pack_propagate(False)  # Calls self.top_bar.pack_propagate to perform this step.

        self.title_lbl = tk.Label(self.top_bar, text="Hero / Mode Configurator", bg=OW_BG, fg=OW_TEXT_DARK, font=("Segoe UI", 12, "bold"))  # Creates a Label object for title lbl.
        self.title_lbl.pack(side="left", padx=15)  # Places self.title_lbl in the interface layout.

        # Scrollable Canvas
        canvas_box = tk.Frame(right_frame, bg=OW_WHITE)  # Creates a Frame object for canvas box.
        canvas_box.pack(fill="both", expand=True)  # Places canvas_box in the interface layout.

        self.canvas = tk.Canvas(canvas_box, bg=OW_WHITE, bd=0, highlightthickness=0)  # Creates a Canvas object for canvas.
        self.canvas_scroll = ttk.Scrollbar(canvas_box, orient="vertical", command=self.canvas.yview)  # Creates a Scrollbar object for canvas scroll.
        self.editor_content = tk.Frame(self.canvas, bg=OW_WHITE)  # Creates a Frame object for editor content.

        self.canvas_window = self.canvas.create_window((0, 0), window=self.editor_content, anchor="nw")  # Computes canvas window from the current input.
        self.editor_content.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))  # Connects an event on self.editor_content to its handler.
        self.canvas.bind("<Configure>", lambda e: self.canvas.itemconfig(self.canvas_window, width=e.width))  # Connects an event on self.canvas to its handler.
        self.canvas.configure(yscrollcommand=self.canvas_scroll.set)  # Configures self.canvas for the desired interface behavior or appearance.

        self.canvas.pack(side="left", fill="both", expand=True, padx=10, pady=10)  # Places self.canvas in the interface layout.
        self.canvas_scroll.pack(side="right", fill="y")  # Places self.canvas_scroll in the interface layout.

        # Mousewheel
        self.bind_all("<MouseWheel>", self._on_scroll)  # Connects an event on self to its handler.
        self.bind_all("<Button-4>", self._on_scroll)  # Connects an event on self to its handler.
        self.bind_all("<Button-5>", self._on_scroll)  # Connects an event on self to its handler.

    def _on_scroll(self, event):  # Defines the  on scroll function.
        if event.num == 4:  # Checks whether event.num == 4 before entering this branch.
            self.canvas.yview_scroll(-1, "units")  # Calls self.canvas.yview_scroll to perform this step.
        elif event.num == 5:  # Checks the alternate condition event.num == 5.
            self.canvas.yview_scroll(1, "units")  # Calls self.canvas.yview_scroll to perform this step.
        elif event.delta:  # Checks the alternate condition event.delta.
            self.canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")  # Calls self.canvas.yview_scroll to perform this step.

    def _btn(self, parent, text, cmd, bg=OW_ORANGE, fg=OW_WHITE, font=("Segoe UI", 9, "bold")):  # Defines the  btn function.
        return tk.Button(parent, text=text, command=cmd, bg=bg, fg=fg, activebackground=OW_ORANGE_DARK,  # Returns tk.Button(parent, text=text, command=cmd, bg=bg, fg=fg, activebackground=OW_ORANGE_DARK, to the caller.
                         activeforeground=OW_WHITE, font=font, relief="flat", padx=12, pady=5, cursor="hand2", bd=0)  # Computes activeforeground from the current input.

    # ======================================================
    # SIDEBAR BUILDER
    # ======================================================
    def _populate_sidebar(self, filter_txt=""):  # Defines the  populate sidebar function.
        self.tree.delete(*self.tree.get_children())  # Removes or clears the selected data from self.tree.
        self.tree_map = {}  # Initializes tree map as an empty lookup table.

        # 1. Global & Lobby
        cat_lobby = self.tree.insert("", "end", text=" ⚙️  Lobby & Match Settings", open=True)  # Computes cat lobby from the current input.
        self.tree_map[cat_lobby] = ("lobby", LOBBY_SETTINGS, "Lobby Settings")  # Provides this value as an entry in the enclosing data structure.

        cat_gen_modes = self.tree.insert("", "end", text=" 🎮  General Mode Settings", open=True)  # Computes cat gen modes from the current input.
        self.tree_map[cat_gen_modes] = ("gen_modes", GENERAL_MODE_SETTINGS, "General Mode Rules")  # Provides this value as an entry in the enclosing data structure.

        cat_gen_combat = self.tree.insert("", "end", text=" ⚡  Global Hero Modifiers (500%)", open=True)  # Computes cat gen combat from the current input.
        self.tree_map[cat_gen_combat] = ("gen_combat", DEFAULT_COMBAT_MODS, "Global Hero Modifiers")  # Provides this value as an entry in the enclosing data structure.

        # 2. Team Restrictions
        cat_teams = self.tree.insert("", "end", text=" 🚫  Team Hero Restrictions", open=True)  # Computes cat teams from the current input.
        for team, disabled_list in TEAM_DISABLED_HEROES.items():  # Processes each team, disabled_list from TEAM_DISABLED_HEROES.items().
            t_item = self.tree.insert(cat_teams, "end", text=f"   🛡️ {team}")  # Computes t item from the current input.
            self.tree_map[t_item] = ("team_bans", (team, disabled_list), f"{team} Disabled Heroes")  # Provides this value as an entry in the enclosing data structure.

        # 3. Game Modes
        cat_modes = self.tree.insert("", "end", text=" 🎯  Individual Game Modes", open=True)  # Computes cat modes from the current input.
        for mode_name, settings in sorted(GAME_MODES.items()):  # Processes each mode_name, settings from sorted(GAME_MODES.items()).
            if filter_txt and filter_txt.lower() not in mode_name.lower():  # Checks whether filter_txt and filter_txt.lower() not in mode_name.lower() before entering this branch.
                continue  # Skips to the next iteration of the current loop.
            m_item = self.tree.insert(cat_modes, "end", text=f"   🏁 {mode_name}")  # Computes m item from the current input.
            self.tree_map[m_item] = ("mode", settings, f"Mode: {mode_name}")  # Provides this value as an entry in the enclosing data structure.

        # 4. Individual Heroes
        cat_heroes = self.tree.insert("", "end", text=f" 🦸  All Heroes ({len(HEROES_DATABASE)})", open=True)  # Counts the relevant entries and stores the total as cat heroes.
        for hero_name, settings in sorted(HEROES_DATABASE.items()):  # Processes each hero_name, settings from sorted(HEROES_DATABASE.items()).
            if filter_txt and filter_txt.lower() not in hero_name.lower():  # Checks whether filter_txt and filter_txt.lower() not in hero_name.lower() before entering this branch.
                continue  # Skips to the next iteration of the current loop.
            h_item = self.tree.insert(cat_heroes, "end", text=f"   ⚡ {hero_name}")  # Computes h item from the current input.
            self.tree_map[h_item] = ("hero", settings, f"Hero: {hero_name}")  # Provides this value as an entry in the enclosing data structure.

        # Select first item by default
        first = self.tree.get_children()  # Sets first from the configured value or expression.
        if first:  # Checks whether first before entering this branch.
            self.tree.selection_set(first[0])  # Calls self.tree.selection_set to perform this step.
            self._on_select()  # Calls self._on_select to perform this step.

    def _filter_tree(self):  # Defines the  filter tree function.
        txt = self.search_var.get()  # Retrieves the current value and stores it as txt.
        if "🔍" in txt:  # Checks whether "🔍" in txt before entering this branch.
            return  # Exits this function without returning a value.
        self._populate_sidebar(filter_txt=txt)  # Calls self._populate_sidebar to perform this step.

    def _on_select(self, event=None):  # Defines the  on select function.
        selected = self.tree.selection()  # Sets selected from the configured value or expression.
        if not selected:  # Checks whether not selected before entering this branch.
            return  # Exits this function without returning a value.
        node_id = selected[0]  # Sets node id from the configured value or expression.
        data = self.tree_map.get(node_id)  # Retrieves the current value and stores it as data.
        if not data:  # Checks whether not data before entering this branch.
            return  # Exits this function without returning a value.

        cat_type, target_dict, title_name = data  # Provides this value as an entry in the enclosing data structure.
        self.active_category = (cat_type, target_dict)  # Sets active category from the configured value or expression.
        self.title_lbl.config(text=title_name)  # Configures self.title_lbl for the desired interface behavior or appearance.
        self._render_editor(cat_type, target_dict)  # Calls self._render_editor to perform this step.

    # ======================================================
    # RENDER CONTROLS
    # ======================================================
    def _render_editor(self, cat_type, target_data):  # Defines the  render editor function.
        for w in self.editor_content.winfo_children():  # Processes each w from self.editor_content.winfo_children().
            w.destroy()  # Calls w.destroy to perform this step.

        if cat_type == "team_bans":  # Checks whether cat_type == "team_bans" before entering this branch.
            self._render_team_bans(target_data)  # Calls self._render_team_bans to perform this step.
            return  # Exits this function without returning a value.

        # Render Key-Value setting cards
        for key, val in target_data.items():  # Processes each key, val from target_data.items().
            card = tk.Frame(self.editor_content, bg=OW_BG, bd=1, relief="flat", padx=12, pady=6)  # Creates a Frame object for card.
            card.pack(fill="x", pady=2)  # Places card in the interface layout.

            lbl = tk.Label(card, text=key, bg=OW_BG, fg=OW_TEXT_DARK, font=("Segoe UI", 10, "bold"), width=34, anchor="w")  # Creates a Label object for lbl.
            lbl.pack(side="left", padx=5)  # Places lbl in the interface layout.

            val_str = str(val).strip()  # Removes surrounding whitespace and stores the cleaned value as val str.

            if val_str in ["Enabled", "Disabled"]:  # Checks whether val_str in ["Enabled", "Disabled"] before entering this branch.
                cb = ttk.Combobox(card, values=["Enabled", "Disabled"], state="readonly", width=14)  # Creates a Combobox object for cb.
                cb.set(val_str)  # Calls cb.set to perform this step.
                cb.pack(side="left", padx=5)  # Places cb in the interface layout.
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))  # Connects an event on cb to its handler.

            elif val_str in ["On", "Off"]:  # Checks the alternate condition val_str in ["On", "Off"].
                cb = ttk.Combobox(card, values=["On", "Off"], state="readonly", width=14)  # Creates a Combobox object for cb.
                cb.set(val_str)  # Calls cb.set to perform this step.
                cb.pack(side="left", padx=5)  # Places cb in the interface layout.
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))  # Connects an event on cb to its handler.

            elif val_str in ["Yes", "No"]:  # Checks the alternate condition val_str in ["Yes", "No"].
                cb = ttk.Combobox(card, values=["Yes", "No"], state="readonly", width=14)  # Creates a Combobox object for cb.
                cb.set(val_str)  # Calls cb.set to perform this step.
                cb.pack(side="left", padx=5)  # Places cb in the interface layout.
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))  # Connects an event on cb to its handler.

            elif "%" in val_str:  # Checks the alternate condition "%" in val_str.
                s_box = tk.Frame(card, bg=OW_BG)  # Creates a Frame object for s box.
                s_box.pack(side="left", fill="x", expand=True)  # Places s_box in the interface layout.

                num = re.sub(r"[^\d.]", "", val_str)  # Computes num from the current input.
                f_val = float(num) if num else 100.0  # Sets f val from the configured value or expression.

                ent = tk.Entry(s_box, width=8, font=("Segoe UI", 9, "bold"), bg=OW_WHITE, relief="solid", bd=1)  # Creates a Entry object for ent.
                ent.insert(0, val_str)  # Adds the supplied value to ent.
                ent.pack(side="right", padx=5)  # Places ent in the interface layout.

                scale = ttk.Scale(s_box, from_=0, to=800, value=f_val, orient="horizontal")  # Creates a Scale object for scale.
                scale.pack(side="left", fill="x", expand=True, padx=5)  # Places scale in the interface layout.

                def update_s(s_val, e=ent, d=target_data, k=key):  # Defines the Update s function.
                    v = f"{int(float(s_val))}%"  # Formats the v text with the current values.
                    e.delete(0, 'end')  # Removes or clears the selected data from e.
                    e.insert(0, v)  # Adds the supplied value to e.
                    d[k] = v  # Provides this value as an entry in the enclosing data structure.

                def update_e(evt, s=scale, e=ent, d=target_data, k=key):  # Defines the Update e function.
                    r = e.get()  # Retrieves the current value and stores it as r.
                    n = re.sub(r"[^\d.]", "", r)  # Computes n from the current input.
                    if n:  # Checks whether n before entering this branch.
                        s.set(float(n))  # Calls s.set to perform this step.
                        d[k] = f"{n}%"  # Provides this value as an entry in the enclosing data structure.

                scale.config(command=update_s)  # Configures scale for the desired interface behavior or appearance.
                ent.bind("<Return>", update_e)  # Connects an event on ent to its handler.
                ent.bind("<FocusOut>", update_e)  # Connects an event on ent to its handler.

            else:  # Handles the remaining case when prior conditions did not match.
                ent = tk.Entry(card, font=("Segoe UI", 10), bg=OW_WHITE, relief="solid", bd=1)  # Creates a Entry object for ent.
                ent.insert(0, val_str)  # Adds the supplied value to ent.
                ent.pack(side="left", fill="x", expand=True, padx=5)  # Places ent in the interface layout.
                ent.bind("<KeyRelease>", lambda e, d=target_data, k=key, ent_w=ent: d.__setitem__(k, ent_w.get()))  # Connects an event on ent to its handler.

        self.editor_content.update_idletasks()  # Calls self.editor_content.update_idletasks to perform this step.
        self.canvas.yview_moveto(0)  # Calls self.canvas.yview_moveto to perform this step.
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))  # Configures self.canvas for the desired interface behavior or appearance.

    def _render_team_bans(self, target_data):  # Defines the  render team bans function.
        team_name, disabled_list = target_data  # Provides this value as an entry in the enclosing data structure.
        
        info = tk.Label(self.editor_content, text=f"Currently Disabled Heroes for {team_name}:", bg=OW_WHITE, fg=OW_TEXT_DARK, font=("Segoe UI", 11, "bold"))  # Creates a Label object for info.
        info.pack(anchor="w", padx=10, pady=(10, 5))  # Places info in the interface layout.

        chips_frame = tk.Frame(self.editor_content, bg=OW_WHITE)  # Creates a Frame object for chips frame.
        chips_frame.pack(fill="x", padx=10, pady=5)  # Places chips_frame in the interface layout.

        for h in list(disabled_list):  # Processes each h from list(disabled_list).
            chip = tk.Frame(chips_frame, bg=OW_ORANGE_LIGHT, bd=1, relief="solid", padx=8, pady=4)  # Creates a Frame object for chip.
            chip.pack(side="left", padx=4, pady=4)  # Places chip in the interface layout.
            tk.Label(chip, text=h, bg=OW_ORANGE_LIGHT, fg=OW_ORANGE_DARK, font=("Segoe UI", 9, "bold")).pack(side="left")  # Calls tk.Label to perform this step.

            def remove_h(name=h):  # Defines the Remove h function.
                disabled_list.remove(name)  # Removes or clears the selected data from disabled_list.
                self._render_team_bans(target_data)  # Calls self._render_team_bans to perform this step.

            tk.Button(chip, text="✕", bg=OW_ORANGE_LIGHT, fg=OW_ORANGE_DARK, relief="flat", bd=0, cursor="hand2", command=remove_h).pack(side="left", padx=(4,0))  # Calls tk.Button to perform this step.

        add_box = tk.Frame(self.editor_content, bg=OW_WHITE)  # Creates a Frame object for add box.
        add_box.pack(fill="x", padx=10, pady=15)  # Places add_box in the interface layout.
        
        hero_cb = ttk.Combobox(add_box, values=sorted(list(HEROES_DATABASE.keys())), state="readonly", width=20)  # Creates a Combobox object for hero cb.
        hero_cb.set("Select Hero to Ban...")  # Calls hero_cb.set to perform this step.
        hero_cb.pack(side="left", padx=5)  # Places hero_cb in the interface layout.

        def add_hero():  # Defines the Add hero function.
            selected = hero_cb.get()  # Retrieves the current value and stores it as selected.
            if selected in HEROES_DATABASE and selected not in disabled_list:  # Checks whether selected in HEROES_DATABASE and selected not in disabled_list before entering this branch.
                disabled_list.append(selected)  # Adds the supplied value to disabled_list.
                self._render_team_bans(target_data)  # Calls self._render_team_bans to perform this step.

        self._btn(add_box, "➕ Ban Hero", add_hero, bg=OW_ORANGE).pack(side="left")  # Calls self._btn to perform this step.

    # ======================================================
    # ACTIONS & EXPORT
    # ======================================================
    def _sync_all_500(self):  # Defines the  sync all 500 function.
        for h_dict in HEROES_DATABASE.values():  # Processes each h_dict from HEROES_DATABASE.values().
            for k, v in DEFAULT_COMBAT_MODS.items():  # Processes each k, v from DEFAULT_COMBAT_MODS.items().
                h_dict[k] = v  # Provides this value as an entry in the enclosing data structure.
        if self.active_category:  # Checks whether self.active_category before entering this branch.
            self._render_editor(*self.active_category)  # Calls self._render_editor to perform this step.
        messagebox.showinfo("Synced", "All heroes have been synchronized with standard 500% combat modifiers!")  # Calls messagebox.showinfo to perform this step.

    def _show_live_code(self):  # Defines the  show live code function.
        code = build_workshop_text()  # Sets code from the configured value or expression.
        win = tk.Toplevel(self)  # Creates a Toplevel object for win.
        win.title("Overwatch Workshop Code Preview")  # Sets the window title.
        win.geometry("850x650")  # Sets the window size.
        win.configure(bg=OW_SLATE_DARK)  # Configures win for the desired interface behavior or appearance.

        txt = tk.Text(win, bg=OW_SLATE_DARK, fg=OW_WHITE, insertbackground=OW_ORANGE, font=("Consolas", 10), wrap="none")  # Creates a Text object for txt.
        s_y = ttk.Scrollbar(win, orient="vertical", command=txt.yview)  # Creates a Scrollbar object for s y.
        s_x = ttk.Scrollbar(win, orient="horizontal", command=txt.xview)  # Creates a Scrollbar object for s x.
        txt.configure(yscrollcommand=s_y.set, xscrollcommand=s_x.set)  # Configures txt for the desired interface behavior or appearance.

        txt.insert("1.0", code)  # Adds the supplied value to txt.
        txt.pack(side="top", fill="both", expand=True)  # Places txt in the interface layout.
        s_y.pack(side="right", fill="y")  # Places s_y in the interface layout.
        s_x.pack(side="bottom", fill="x")  # Places s_x in the interface layout.

    def _copy_code(self):  # Defines the  copy code function.
        code = build_workshop_text()  # Sets code from the configured value or expression.
        self.clipboard_clear()  # Clears the clipboard.
        self.clipboard_append(code)  # Copies the selected text to the clipboard.
        messagebox.showinfo("Copied to Clipboard", "Complete Overwatch Workshop settings code copied!\n\nPaste it directly inside Overwatch's custom game settings menu.")  # Calls messagebox.showinfo to perform this step.

    def _export_file(self):  # Defines the  export file function.
        path = filedialog.asksaveasfilename(defaultextension=".txt", initialfile="settings.txt", filetypes=[("Text Files", "*.txt")])  # Computes path from the current input.
        if path:  # Checks whether path before entering this branch.
            code = build_workshop_text()  # Sets code from the configured value or expression.
            with open(path, "w", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                f.write(code)  # Calls f.write to perform this step.
            messagebox.showinfo("Exported", f"Successfully saved settings to:\n{path}")  # Calls messagebox.showinfo to perform this step.

if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    app = OverwatchWorkshopGenerator()  # Sets app from the configured value or expression.
    app.mainloop()  # Starts the GUI event loop.