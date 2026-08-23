import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import re

# ==========================================================
# OVERWATCH THEME PALETTE
# ==========================================================
OW_ORANGE       = "#FA9C1E"
OW_ORANGE_DARK  = "#D87F08"
OW_ORANGE_LIGHT = "#FFF3E5"
OW_SLATE_DARK   = "#1E2328"
OW_SLATE_MID    = "#2D3440"
OW_BG           = "#F0F2F5"
OW_CARD_BG      = "#FFFFFF"
OW_BORDER       = "#D9DFE8"
OW_TEXT_DARK    = "#1A202C"
OW_TEXT_MUTED   = "#718096"
OW_WHITE        = "#FFFFFF"

# ==========================================================
# COMPLETE PRE-CONFIGURED SETTINGS DATA
# ==========================================================
DEFAULT_COMBAT_MODS = {
    "Damage Dealt": "500%",
    "Damage Received": "500%",
    "Healing Dealt": "500%",
    "Healing Received": "500%",
    "Health": "500%",
    "Jump Vertical Speed": "800%",
    "Movement Gravity": "400%",
    "Movement Speed": "300%",
    "No Ammunition Requirement": "On",
    "Ammunition Clip Size Scalar": "500%",
    "Passive Health Regeneration": "Disabled",
    "Primary Fire": "Disabled",
    "Projectile Speed": "500%",
    "Quick Melee": "Disabled",
    "Receive Headshots Only": "Enabled",
    "Role Passives": "Disabled",
    "Spawn With Ultimate Ready": "Enabled",
    "Infinite Ultimate Duration": "Enabled",
    "Ultimate Duration": "500%"
}

# Master Database with all specific hero abilities and modifiers
HEROES_DATABASE = {
    "Ana": {
        "Ammunition Clip Size Scalar": "500%", "Biotic Grenade": "Disabled", "Damage Dealt": "500%",
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled", "No Scope": "Enabled",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Sleep Dart": "Disabled", "Ultimate Ability Nano Boost": "Disabled"
    },
    "Anran": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Dancing Blaze": "Disabled", "Healing Received": "500%", "Health": "500%", "Inferno Rush": "Disabled",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Vermillion Ascent": "Disabled"
    },
    "Ashe": {
        "Ammunition Clip Size Scalar": "500%", "Coach Gun": "Disabled", "Coach Gun Knockback Scalar Enemy": "300%",
        "Coach Gun Knockback Scalar Self": "300%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Dynamite": "Disabled", "Dynamite Fuse Time Scalar": "500%", "Healing Received": "500%", "Health": "500%",
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled",
        "No Scope": "Enabled", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability B.O.B.": "Disabled", "Ultimate Duration": "500%"
    },
    "Baptiste": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Immortality Field": "Disabled",
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Regenerative Burst": "Disabled",
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Amplification Matrix": "Disabled", "Ultimate Duration": "500%"
    },
    "Bastion": {
        "A-36 Tactical Grenade": "Disabled", "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%",
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Reconfigure": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Configuration: Artillery": "Disabled",
        "Ultimate Duration": "500%"
    },
    "Brigitte": {
        "Barrier Shield": "Disabled", "Barrier Shield Recharge Rate": "500%", "Damage Dealt": "500%",
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Repair Pack": "Disabled", "Role Passives": "Disabled",
        "Shield Bash": "Disabled", "Shield Bash Knockback Scalar": "300%", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Rally": "Disabled", "Whip Shot": "Disabled", "Whip Shot Knockback Scalar": "300%"
    },
    "Cassidy": {
        "Ammunition Clip Size Scalar": "500%", "Combat Roll": "Disabled", "Damage Dealt": "500%",
        "Damage Received": "500%", "Flashbang": "Disabled", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Deadeye": "Disabled"
    },
    "D.Mon": {
        "[PH] Assemble Mech Knockback Scalar": "400%", "[PH] Propulsion Knockback Scalar": "400%",
        "[PH] Skewer Knockback Scalar": "300%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Fusion Repeater": "Disabled", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Power Barrier": "Disabled", "Primary Fire": "Disabled", "Propulsors": "Disabled",
        "Propulsors Maximum Time": "500%", "Propulsors Recharge Rate": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Spawn Without Mech": "Enabled", "Ultimate Ability Limit Break ": "Disabled"
    },
    "D.Va": {
        "Boosters": "Disabled", "Boosters Knockback Scalar": "400%", "Call Mech Knockback Scalar": "400%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Defense Matrix": "Disabled",
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Micro Missiles": "Disabled",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Self Destruct Knockback Scalar": "200%",
        "Spawn With Ultimate Ready": "Enabled", "Spawn Without Mech": "Enabled", "Ultimate Ability Self-Destruct": "Disabled"
    },
    "Domina": {
        "Ammunition Clip Size Scalar": "500%", "Barrier Array": "Disabled", "Crystal Charge": "Disabled",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Reconstruction Heal Scalar": "300%", "Role Passives": "Disabled", "Sonic Repulsors": "Disabled",
        "Sonic Repulsors Knockback Scalar": "300%", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Panopticon": "Disabled", "Ultimate Barrier Health Scalar Panopticon": "300%"
    },
    "Doomfist": {
        "Ammunition Clip Size Scalar": "500%", "Ammunition Regeneration Time Scalar": "500%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Meteor Strike Knockback Scalar": "300%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On",
        "Passive Health Regeneration": "Disabled", "Power Block": "Disabled", "Power Block Charge Rate": "500%",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Rocket Punch": "Disabled", "Rocket Punch Knockback Scalar": "300%",
        "Role Passives": "Disabled", "Seismic Slam": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Meteor Strike": "Disabled", "Ultimate Duration": "500%"
    },
    "Echo": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Flight": "Disabled", "Focusing Beam": "Disabled", "Glide": "Disabled", "Healing Received": "500%",
        "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Spawn With Ultimate Ready": "Enabled", "Sticky Bombs": "Disabled", "Ultimate Ability Duplicate": "Disabled"
    },
    "Emre": {
        "Ammunition Clip Size Scalar": "500%", "Cyber Frag": "Disabled", "Cyber Frag Knockback Scalar": "300%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "No Scope": "Enabled",
        "No Unscoped Fire": "Enabled", "Override Protocol Knockback Scalar": "300%", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Siphon Blaster": "Disabled",
        "Siphon Blaster Duration Scalar": "500%", "Siphon Blaster Heat Scalar": "500%",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Override Protocol": "Disabled", "Ultimate Duration": "500%"
    },
    "Freja": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",
        "Quick Dash": "Disabled", "Quick Dash Distance": "200%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Take Aim": "Disabled", "Take Aim Duration": "300%", "Ultimate Ability Bola Shot": "Disabled",
        "Updraft": "Disabled", "Updraft Height": "150%"
    },
    "Genji": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Deflect": "Disabled", "Healing Received": "500%",
        "Health": "500%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Swift Strike": "Disabled",
        "Ultimate Ability Dragonblade": "Disabled", "Ultimate Duration": "500%"
    },
    "Hanzo": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Lunge": "Disabled", "Lunge Cooldown Time": "500%", "Lunge Distance Scalar": "300%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Sonic Arrow": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Storm Arrows": "Disabled",
        "Storm Arrows Quantity": "12", "Ultimate Ability Dragonstrike": "Disabled"
    },
    "Hazard": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Jagged Wall": "Disabled", "Jagged Wall Health": "400%", "Jagged Wall Knockback": "400%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Spike Guard": "Disabled", "Spike Guard Movement Speed Penalty": "150%",
        "Spike Guard Resource Cost": "200%", "Spike Guard Resource Regeneration": "200%",
        "Ultimate Ability Downpour": "Disabled", "Violent Leap": "Disabled", "Violent Leap Distance": "200%"
    },
    "Illari": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Dealt": "500%", "Healing Pylon": "Disabled",
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "Outburst": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Captive Sun": "Disabled"
    },
    "Jetpack Cat": {
        "Biotic Pawjectile Range": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Frenetic Flight": "Disabled", "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%",
        "Jump Vertical Speed": "800%", "Lifeline": "Disabled", "Movement Gravity": "400%", "Movement Speed": "300%",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",
        "Purr": "Disabled", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Catnapper": "Disabled"
    },
    "Junker Queen": {
        "Ammunition Clip Size Scalar": "500%", "Carnage": "Disabled", "Commanding Shout": "Disabled",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Jagged Blade Gracie": "Disabled", "Jagged Blade Delay Before Automatic Recall": "400%",
        "Jagged Blade Knockback Scalar": "400%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Rampage": "Disabled"
    },
    "Junkrat": {
        "Ammunition Clip Size Scalar": "500%", "Concussion Mine": "Disabled", "Concussion Mine Knockback Scalar": "200%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Frag Launcher Knockback Scalar": "400%",
        "Healing Received": "500%", "Health": "500%", "Infinite Ultimate Duration": "Enabled",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Steel Trap": "Disabled", "Ultimate Ability RIP-Tire": "Disabled", "Ultimate Duration": "500%"
    },
    "Juno": {
        "Damage Dealt": "500%", "Damage Received": "500%", "Glide Boost": "Disabled",
        "Glide Boost Duration Scalar": "500%", "Healing Dealt": "500%", "Healing Received": "500%",
        "Health": "500%", "Hyper Ring": "Disabled", "Jump Vertical Speed": "800%", "Martian Overboots": "Disabled",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Projectile Speed": "500%", "Pulsar Torpedoes": "Disabled", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Orbital Ray": "Disabled"
    },
    "Kiriko": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On",
        "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled", "Projectile Speed": "500%",
        "Protection Suzu": "Disabled", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Swift Step": "Disabled", "Swift Step Distance Scalar": "300%", "Ultimate Ability Kitsune Rush": "Disabled"
    },
    "Lifeweaver": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",
        "Life Grip": "Disabled", "Life Grip and Healing Blossom Range": "200%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Petal Platform": "Disabled", "Petal Platform Health": "500%", "Primary Fire": "Disabled",
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Rejuvenating Dash": "Disabled", "Rejuvenating Dash Cooldown Time": "500%",
        "Rejuvenating Dash Healing": "500%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Tree of Life Health": "300%", "Ultimate Ability Tree of Life": "Disabled", "Weapons Enabled": "Healing Blossom Only"
    },
    "Lúcio": {
        "Ammunition Clip Size Scalar": "500%", "Amp It Up": "Disabled", "Crossfade": "Disabled",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Dealt": "500%", "Healing Received": "500%",
        "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Soundwave": "Disabled", "Soundwave Knockback Scalar": "300%",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Sound Barrier": "Disabled"
    },
    "Mauga": {
        "Ammunition Clip Size Scalar": "500%", "Cardiac Overdrive": "Disabled", "Cardiac Overdrive Healing": "400%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Incendiary Chaingun": "Disabled", "Incendiary Chaingun Ignite Damage": "500%", "Incendiary Chaingun Ignite Duration": "500%",
        "Incendiary Chaingun Ignite Rate": "800%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "No Ammunition Requirement": "On", "Overrun": "Disabled",
        "Overrun Knockback": "300%", "Passive Health Regeneration": "Disabled", "Projectile Speed": "500%",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Cage Fight": "Disabled", "Ultimate Duration": "500%",
        "Volatile Chaingun": "Disabled"
    },
    "Mei": {
        "Ammunition Clip Size Scalar": "500%", "Blizzard Freeze Minimum": "100%", "Blizzard Freeze Rate Scalar": "500%",
        "Cryo-Freeze": "Disabled", "Damage Dealt": "500%", "Damage Received": "500%", "Freeze Stacking": "Enabled",
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Ice Wall": "Disabled",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Blizzard": "Disabled", "Weapon Freeze Duration Scalar": "500%",
        "Weapon Freeze Minimum": "100%", "Weapon Freeze Rate Scalar": "500%"
    },
    "Mercy": {
        "Ammunition Clip Size Scalar": "500%", "Angelic Descent": "Disabled", "Damage Dealt": "500%",
        "Damage Received": "500%", "Flash Heal": "Disabled", "Guardian Angel": "Disabled", "Healing Dealt": "500%",
        "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%", "Movement Gravity": "400%",
        "Movement Speed": "300%", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Resurrect": "Disabled", "Role Passives": "Disabled",
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Sympathetic Recovery": "Disabled",
        "Ultimate Ability Valkyrie": "Disabled", "Weapons Enabled": "Caduceus Staff Only"
    },
    "Mizuki": {
        "Ammunition Clip Size Scalar": "500%", "Binding Chain": "Disabled", "Damage Dealt": "500%",
        "Damage Received": "500%", "Healing Dealt": "500%", "Healing Kasa": "Disabled", "Healing Received": "500%",
        "Health": "500%", "Jump Vertical Speed": "800%", "Katashiro Return": "Disabled",
        "Katashiro Return Duration Scalar": "500%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Kekkai Sanctuary": "Disabled"
    },
    "Moira": {
        "Biotic Energy Maximum": "500%", "Biotic Energy Recharge Rate": "500%", "Biotic Orb": "Disabled",
        "Biotic Orb Max Damage Scalar": "500%", "Biotic Orb Max Healing Scalar": "500%", "Damage Dealt": "500%",
        "Damage Received": "500%", "Fade": "Disabled", "Healing Dealt": "500%", "Healing Received": "500%",
        "Health": "500%", "Infinite Ultimate Duration": "Enabled", "Jump Vertical Speed": "800%",
        "Movement Gravity": "400%", "Movement Speed": "300%", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Coalescence": "Disabled", "Ultimate Duration": "500%"
    },
    "Orisa": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Energy Javelin": "Disabled", "Fortify": "Disabled", "Healing Received": "500%", "Health": "500%",
        "Javelin Spin": "Disabled", "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Receive Headshots Only": "Enabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Terra Surge": "Disabled"
    },
    "Pharah": {
        "Ammunition Clip Size Scalar": "500%", "Concussive Blast": "Disabled", "Concussive Blast Knockback Scalar": "300%",
        "Damage Dealt": "500%", "Damage Received": "500%", "Healing Received": "500%", "Health": "500%",
        "Hover Jets": "Disabled", "Hover Jets Extra Fuel Scalar": "200%", "Hover Jets Vertical Speed Scalar": "300%",
        "Jet Dash": "Disabled", "Jump Jet": "Disabled", "Jump Jet Acceleration Scalar": "300%", "Jump Jet Refuel Scalar": "400%",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Projectile Speed": "500%", "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled",
        "Rocket Launcher Knockback Scalar": "400%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Barrage": "Disabled"
    },
    "Ramattra": {
        "Ammunition Clip Size Scalar": "500%", "Block Nemesis Form": "Disabled", "Damage Dealt": "500%",
        "Damage Received": "500%", "Healing Received": "500%", "Health": "500%", "Infinite Ultimate Duration": "Enabled",
        "Jump Vertical Speed": "800%", "Movement Gravity": "400%", "Movement Speed": "300%",
        "Nemesis Form": "Disabled", "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled",
        "Primary Fire": "Disabled", "Projectile Gravity": "500%", "Projectile Speed": "500%", "Quick Melee": "Disabled",
        "Ravenous Vortex": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Annihilation": "Disabled", "Ultimate Duration": "500%",
        "Void Barrier Omnic Form": "Disabled"
    },
    "Reaper": {
        "Ammunition Clip Size Scalar": "500%", "Damage Dealt": "500%", "Damage Received": "500%",
        "Healing Dealt": "500%", "Healing Received": "500%", "Health": "500%", "Jump Vertical Speed": "800%",
        "No Ammunition Requirement": "On", "Passive Health Regeneration": "Disabled", "Primary Fire": "Disabled",
        "Quick Melee": "Disabled", "Receive Headshots Only": "Enabled", "Role Passives": "Disabled",
        "Shadow Step": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Death Blossom": "Disabled",
        "Wraith Form": "Disabled"
    },
    "Reinhardt": {
        "Barrier Field": "Disabled", "Charge": "Disabled", "Charge Knockback Scalar": "300%",
        "Fire Strike": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Rocket Hammer Knockback Scalar": "400%", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Earthshatter": "Disabled"
    },
    "Roadhog": {
        "Ammunition Clip Size Scalar": "500%", "Chain Hook": "Disabled", "No Ammunition Requirement": "On",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Take a Breather": "Disabled", "Take a Breather Maximum Time": "500%",
        "Take a Breather Recharge Rate": "500%", "Ultimate Ability Whole Hog": "Disabled", "Whole Hog Knockback Scalar": "300%"
    },
    "Shion": {
        "Evade": "Disabled", "Evade Distance Scalar": "300%", "Execution": "Disabled", "Infinite Ultimate Duration": "Enabled",
        "Joyride": "Disabled", "Joyride Duration Scalar": "500%", "Joyride Infinite Duration": "Enabled",
        "Joyride Knockback Scalar": "400%", "Joyride Speed Scalar": "300%", "Primary Fire": "Disabled",
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Satsuriku Spree": "Disabled", "Ultimate Duration": "500%"
    },
    "Sierra": {
        "Anchor Drone": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Tracking Shot": "Disabled",
        "Tremor Charge": "Disabled", "Tremor Charge Knockback Scalar": "400%", "Ultimate Ability Trailblazer": "Disabled"
    },
    "Sigma": {
        "Accretion": "Disabled", "Accretion Knockback Scalar": "300%", "Experimental Barrier": "Disabled",
        "Kinetic Grasp": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Role Passives": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Gravitic Flux": "Disabled"
    },
    "Sojourn": {
        "Ammunition Clip Size Scalar": "500%", "Charged Shot": "Disabled", "Charged Shot Energy Charge Rate": "500%",
        "Disruptor Shot": "Disabled", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",
        "Power Slide": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Overclock": "Disabled",
        "Ultimate Duration": "500%"
    },
    "Soldier: 76": {
        "Ammunition Clip Size Scalar": "500%", "Biotic Field": "Disabled", "Helix Rockets": "Disabled",
        "Helix Rockets Knockback Scalar": "400%", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Sprint": "Disabled", "Ultimate Ability Tactical Visor": "Disabled",
        "Ultimate Duration": "500%"
    },
    "Sombra": {
        "Ammunition Clip Size Scalar": "500%", "Hack": "Disabled", "No Ammunition Requirement": "On",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Translocator": "Disabled", "Ultimate Ability EMP": "Disabled", "Virus": "Disabled"
    },
    "Symmetra": {
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Primary Fire": "Disabled",
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Sentry Turret": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Teleporter": "Disabled",
        "Ultimate Ability Photon Barrier": "Disabled"
    },
    "Torbjörn": {
        "Ammunition Clip Size Scalar": "500%", "Deploy Turret": "Disabled", "Infinite Ultimate Duration": "Enabled",
        "No Ammunition Requirement": "On", "Overload": "Disabled", "Overload Duration Scalar": "500%",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Molten Core": "Disabled",
        "Ultimate Duration": "500%", "Weapons Enabled": "Rivet Gun Only"
    },
    "Tracer": {
        "Ammunition Clip Size Scalar": "500%", "Blink": "Disabled", "No Ammunition Requirement": "On",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Recall": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Pulse Bomb": "Disabled"
    },
    "Vendetta": {
        "Primary Fire": "Disabled", "Projected Edge": "Disabled", "Quick Melee": "Disabled",
        "Role Passives": "Disabled", "Soaring Slice": "Disabled", "Soaring Slice Distance": "300%",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Sundering Blade": "Disabled",
        "Warding Stance": "Disabled", "Warding Stance Regen Scalar": "500%", "Whirlwind Dash": "Disabled",
        "Whirlwind Dash Distance": "300%"
    },
    "Venture": {
        "Ammunition Clip Size Scalar": "500%", "Burrow": "Disabled", "Burrow Duration Scalar": "500%",
        "Drill Dash": "Disabled", "Infinite Ultimate Duration": "Enabled", "No Ammunition Requirement": "On",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Tectonic Shock": "Disabled", "Ultimate Duration": "500%"
    },
    "Widowmaker": {
        "Ammunition Clip Size Scalar": "500%", "Grappling Hook": "Disabled", "Infinite Ultimate Duration": "Enabled",
        "No Ammunition Requirement": "On", "No Automatic Fire": "Enabled", "No Scope": "Enabled",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Infra-Sight": "Disabled",
        "Ultimate Duration": "500%", "Venom Mine": "Disabled"
    },
    "Winston": {
        "Ammunition Clip Size Scalar": "500%", "Barrier Projector": "Disabled", "Infinite Ultimate Duration": "Enabled",
        "Jump Pack": "Disabled", "Jump Pack Acceleration Scalar": "300%", "Jump Pack Knockback Scalar": "400%",
        "No Ammunition Requirement": "On", "Primal Rage Melee Knockback Scalar": "300%", "Primary Fire": "Disabled",
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Primal Rage": "Disabled", "Ultimate Duration": "500%"
    },
    "Wrecking Ball": {
        "Adaptive Shield": "Disabled", "Ammunition Clip Size Scalar": "500%", "Grappling Claw": "Disabled",
        "Grappling Claw Knockback Scalar": "400%", "Infinite Ultimate Duration": "Enabled",
        "Minefield Knockback Scalar": "400%", "No Ammunition Requirement": "On", "Piledriver": "Disabled",
        "Primary Fire": "Disabled", "Quick Melee": "Disabled", "Role Passives": "Disabled",
        "Roll": "Disabled", "Roll Always Active": "Enabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Minefield": "Disabled", "Ultimate Duration": "500%"
    },
    "Wuyang": {
        "Ammunition Clip Size Scalar": "500%", "Guardian Wave": "Disabled", "Guardian Wave Knockback Scalar": "500%",
        "No Ammunition Requirement": "On", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Restorative Stream": "Disabled", "Restorative Stream Drain Rate": "500%", "Restorative Stream Recharge Rate": "500%",
        "Role Passives": "Disabled", "Rushing Torrent": "Disabled", "Rushing Torrent Duration Scalar": "500%",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Tidal Blast": "Disabled",
        "Water Staff Orb Maximum Control Time": "500%", "Water Staff Orb Turn Rate": "500%"
    },
    "Zarya": {
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Particle Barrier": "Disabled",
        "Particle Cannon Secondary Knockback Scalar": "400%", "Primary Fire": "Disabled", "Projected Barrier": "Disabled",
        "Quick Melee": "Disabled", "Role Passives": "Disabled", "Secondary Fire": "Disabled",
        "Spawn With Ultimate Ready": "Enabled", "Ultimate Ability Graviton Surge": "Disabled"
    },
    "Zenyatta": {
        "Ammunition Clip Size Scalar": "500%", "No Ammunition Requirement": "On", "Orb of Discord": "Disabled",
        "Orb of Harmony": "Disabled", "Primary Fire": "Disabled", "Quick Melee": "Disabled",
        "Role Passives": "Disabled", "Secondary Fire": "Disabled", "Spawn With Ultimate Ready": "Enabled",
        "Ultimate Ability Transcendence": "Disabled"
    }
}

# Pre-populate all individual heroes with unified combat modifiers
for hero_name, hero_dict in HEROES_DATABASE.items():
    for mod_key, mod_val in DEFAULT_COMBAT_MODS.items():
        if mod_key not in hero_dict:
            hero_dict[mod_key] = mod_val

# Lobby Settings
LOBBY_SETTINGS = {
    "Allow Players Who Are In Queue": "Yes",
    "Data Center Preference": "USA - Central",
    "Map Rotation": "After A Game",
    "Match Voice Chat": "Enabled",
    "Max FFA Players": "1",
    "Max Spectators": "12",
    "Max Team 1 Players": "5",
    "Max Team 2 Players": "0",
    "Minimum Latency milliseconds": "150000000",
    "Pause Game On Player Disconnect": "Yes",
    "Return To Lobby": "After A Game",
    "Team Balancing": "After A Mirror Match",
    "Use Experimental Update If Available": "Yes"
}

# Mode General
GENERAL_MODE_SETTINGS = {
    "Enemy Health Bars": "Disabled",
    "Game Mode Start": "Manual",
    "Hero Limit": "2 Per Game",
    "Kill Cam": "Disabled",
    "Kill Feed": "Disabled",
    "Limit Roles": "2 Of Each Role Per Team",
    "Respawn Time Scalar": "0%",
    "Skins": "Disabled",
    "Spawn Health Packs": "Disabled",
    "Team Overlay": "Enabled"
}

# Individual Game Modes
GAME_MODES = {
    "Assault": {
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",
        "Enable Perks": "Off", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled"
    },
    "Bounty Hunter": {
        "Allow Hero Switching": "Disabled", "Base Score for Killing a Bounty Target": "1000",
        "Bounty Increase per Kill as Bounty Target": "1000", "Enable Perks": "On", "Game Length In Minutes": "15",
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",
        "Respawn As Random Hero": "Enabled", "Score per Kill": "1000", "Score per Kill as Bounty Target": "1000",
        "Score To Win": "5000", "Self Initiated Respawn": "Off", "Tank Role Passive Health Bonus": "Disabled"
    },
    "Capture the Flag": {
        "Allow Hero Switching": "Disabled", "Blitz Flag Locations": "Yes", "Damage Interrupts Flag Interaction": "Enabled",
        "Enable Perks": "On", "Flag Carrier Abilities": "All", "Flag Dropped Lock Time": "10.0",
        "Flag Pickup Time": "5.0", "Flag Return Time": "5.0", "Flag Score Respawn Time": "20.0",
        "Game Length Minutes": "15", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Respawn Speed Buff Duration": "60.0",
        "Score To Win": "9", "Tank Role Passive Health Bonus": "Disabled", "Team Needs Flag At Base To Score": "Yes"
    },
    "Clash": {
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",
        "Enable Perks": "Off", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",
        "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Control": {
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",
        "Enable Perks": "Off", "Limit Valid Control Points": "Second", "Perk Elimination Catchup Level Amount": "100%",
        "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled",
        "Score To Win": "3", "Scoring Speed Modifier": "500%", "Tank Role Passive Health Bonus": "Disabled",
        "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Deathmatch": {
        "Allow Hero Switching": "Disabled", "Enable Perks": "On", "Game Length In Minutes": "15",
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",
        "Respawn As Random Hero": "Enabled", "Score To Win": "5000", "Self Initiated Respawn": "Off",
        "Tank Role Passive Health Bonus": "Disabled"
    },
    "Elimination": {
        "Allow Hero Switching": "Disabled", "Capture Objective Tiebreaker": "Disabled",
        "Draw After Match Time Elapsed With No Tiebreaker": "300", "Enable Perks": "On", "Hero Selection": "Random",
        "Hero Selection Time": "60", "Limited Choice Pool": "Team Size", "Perk Elimination Catchup Level Amount": "100%",
        "Perk Generation": "500%", "Respawn As Random Hero": "Enabled", "Restrict Previously Used Heroes": "After Round Won",
        "Reveal Heroes": "Enabled", "Reveal Heroes After Match Time Elapsed": "180", "Score To Win": "9",
        "Tiebreaker After Match Time Elapsed": "300", "Time To Capture": "7"
    },
    "Escort": {
        "Allow Hero Switching": "Disabled", "Competitive Rules": "On", "Enable Perks": "Off",
        "Payload Speed Modifier": "500%", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",
        "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Flashpoint": {
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",
        "Control Point A": "Disabled", "Control Point B": "Disabled", "Control Point C": "Disabled",
        "Control Point D": "Disabled", "Control Point E": "Disabled", "Enable Perks": "Off",
        "First Active Control Point": "E", "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%",
        "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled", "Score To Win": "10",
        "Scoring Speed Modifier": "500%", "Tank Role Passive Health Bonus": "Disabled",
        "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Hybrid": {
        "Allow Hero Switching": "Disabled", "Capture Speed Modifier": "500%", "Competitive Rules": "Enabled",
        "Enable Perks": "Off", "Payload Speed Modifier": "500%", "Perk Elimination Catchup Level Amount": "100%",
        "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1", "Respawn As Random Hero": "Enabled",
        "Tank Role Passive Health Bonus": "Disabled", "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Push": {
        "Allow Hero Switching": "Disabled", "Competitive Rules": "On", "Enable Perks": "Off",
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",
        "Respawn As Random Hero": "Enabled", "Tank Role Passive Health Bonus": "Disabled",
        "TS-1 Push Speed Modifier": "500%", "TS-1 Walk Speed Modifier": "500%", "Limit Roles": "1 Tank 2 Offense 2 Support"
    },
    "Team Deathmatch": {
        "Allow Hero Switching": "Disabled", "Enable Perks": "On", "Game Length In Minutes": "15",
        "Imbalanced Team Score To Win": "On", "Mercy Resurrect Counteracts Kills": "Off",
        "Perk Elimination Catchup Level Amount": "100%", "Perk Generation": "500%", "Random Hero Role Limit Per Team": "1",
        "Respawn As Random Hero": "Enabled", "Score To Win": "200", "Self Initiated Respawn": "Off",
        "Tank Role Passive Health Bonus": "Disabled", "Team 1 Score To Win": "200", "Team 2 Score To Win": "200"
    }
}

# Disabled Heroes by Team / FFA
TEAM_DISABLED_HEROES = {
    "Team 1": ["Ana"],
    "Team 2": ["Anran"],
    "Team FFA": ["Ashe"]
}

# ==========================================================
# WORKSHOP CODE WRITER / BUILDER
# ==========================================================
def build_workshop_text():
    out = []
    
    # 1. Main Settings Block
    out.append("settings")
    out.append("{")
    
    out.append("\tmain")
    out.append("\t{")
    out.append('\t\tMode Name: "all gamemode settings shown"')
    out.append("\t}")
    out.append("")

    # 2. Lobby
    out.append("\tlobby")
    out.append("\t{")
    for k, v in sorted(LOBBY_SETTINGS.items()):
        out.append(f"\t\t{k}: {v}")
    out.append("\t}")
    out.append("")

    # 3. Modes
    out.append("\tmodes")
    out.append("\t{")
    for mode_name, settings in sorted(GAME_MODES.items()):
        out.append(f"\t\t{mode_name}")
        out.append("\t\t{")
        for k, v in sorted(settings.items()):
            out.append(f"\t\t\t{k}: {v}")
        out.append("\t\t}")
        out.append("")

    out.append("\t\tGeneral")
    out.append("\t\t{")
    for k, v in sorted(GENERAL_MODE_SETTINGS.items()):
        out.append(f"\t\t\t{k}: {v}")
    out.append("\t\t}")
    out.append("\t}")
    out.append("")

    # 4. Heroes Block
    out.append("\theroes")
    out.append("\t{")

    # Team bans
    for team, disabled_list in TEAM_DISABLED_HEROES.items():
        out.append(f"\t\t{team}")
        out.append("\t\t{")
        out.append("\t\t\tdisabled heroes")
        out.append("\t\t\t{")
        for h in disabled_list:
            out.append(f"\t\t\t\t{h}")
        out.append("\t\t\t}")
        out.append("\t\t}")
        out.append("")

    # Heroes -> General
    out.append("\t\tGeneral")
    out.append("\t\t{")
    for k, v in sorted(DEFAULT_COMBAT_MODS.items()):
        out.append(f"\t\t\t{k}: {v}")
    out.append("")

    # Per Hero Modifiers
    for hero, settings in sorted(HEROES_DATABASE.items()):
        out.append(f"\t\t\t{hero}")
        out.append("\t\t\t{")
        for k, v in sorted(settings.items()):
            out.append(f"\t\t\t\t{k}: {v}")
        out.append("\t\t\t}")
        out.append("")

    out.append("\t\t}")
    out.append("\t}")
    out.append("}")

    return "\n".join(out)

# ==========================================================
# MODERN GUI APPLICATION
# ==========================================================
class OverwatchWorkshopGenerator(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Overwatch Workshop Master Generator & Editor")
        self.geometry("1280x820")
        self.minsize(1050, 700)
        self.configure(bg=OW_BG)

        self.active_category = None
        self._setup_styles()
        self._build_header()
        self._build_layout()
        self._populate_sidebar()

    def _setup_styles(self):
        self.style = ttk.Style(self)
        self.style.theme_use('clam')

        self.style.configure("Treeview",
            background=OW_WHITE, foreground=OW_TEXT_DARK, rowheight=28,
            fieldbackground=OW_WHITE, bordercolor=OW_BORDER, borderwidth=1,
            font=("Segoe UI", 10)
        )
        self.style.map("Treeview",
            background=[('selected', OW_ORANGE)],
            foreground=[('selected', OW_WHITE)]
        )
        self.style.configure("Treeview.Heading",
            background=OW_SLATE_MID, foreground=OW_WHITE,
            relief="flat", font=("Segoe UI", 10, "bold")
        )
        self.style.configure("TCombobox", padding=4)

    def _build_header(self):
        header = tk.Frame(self, bg=OW_SLATE_DARK, height=65)
        header.pack(fill="x", side="top")
        header.pack_propagate(False)

        brand = tk.Frame(header, bg=OW_SLATE_DARK)
        brand.pack(side="left", padx=20, pady=10)

        badge = tk.Label(brand, text="OW", bg=OW_ORANGE, fg=OW_WHITE, font=("Segoe UI", 12, "bold"), padx=6, pady=2)
        badge.pack(side="left", padx=(0, 10))

        title = tk.Label(brand, text="WORKSHOP MASTER GENERATOR", bg=OW_SLATE_DARK, fg=OW_WHITE, font=("Segoe UI Black", 14))
        title.pack(side="left")

        actions = tk.Frame(header, bg=OW_SLATE_DARK)
        actions.pack(side="right", padx=20)

        self._btn(actions, "⚡ Sync All to 500%", self._sync_all_500, bg=OW_SLATE_MID, fg=OW_WHITE).pack(side="left", padx=4)
        self._btn(actions, "📄 View Output Code", self._show_live_code, bg=OW_SLATE_MID, fg=OW_WHITE).pack(side="left", padx=4)
        self._btn(actions, "💾 Export settings.txt", self._export_file, bg=OW_ORANGE_DARK, fg=OW_WHITE).pack(side="left", padx=4)
        self._btn(actions, "📑 Copy to Clipboard", self._copy_code, bg=OW_ORANGE, fg=OW_WHITE).pack(side="left", padx=4)

    def _build_layout(self):
        main_pane = tk.PanedWindow(self, orient="horizontal", bg=OW_BORDER, bd=0, sashwidth=4)
        main_pane.pack(fill="both", expand=True, padx=15, pady=15)

        # LEFT SIDEBAR
        left_frame = tk.Frame(main_pane, bg=OW_WHITE, bd=1, relief="solid", highlightbackground=OW_BORDER)
        main_pane.add(left_frame, minsize=290, width=320)

        sb_header = tk.Frame(left_frame, bg=OW_BG, height=45)
        sb_header.pack(fill="x")
        sb_header.pack_propagate(False)
        tk.Label(sb_header, text="SETTINGS EXPLORER", bg=OW_BG, fg=OW_TEXT_MUTED, font=("Segoe UI", 9, "bold")).pack(side="left", padx=12, pady=12)

        # Search Bar
        search_box = tk.Frame(left_frame, bg=OW_WHITE)
        search_box.pack(fill="x", padx=10, pady=8)
        self.search_var = tk.StringVar()
        self.search_var.trace_add("write", lambda *a: self._filter_tree())
        search_ent = tk.Entry(search_box, textvariable=self.search_var, bg=OW_BG, fg=OW_TEXT_DARK, relief="flat", font=("Segoe UI", 10))
        search_ent.pack(fill="x", ipady=4, padx=2)
        search_ent.insert(0, "🔍 Filter heroes & modes...")
        search_ent.bind("<FocusIn>", lambda e: search_ent.delete(0, 'end') if "🔍" in search_ent.get() else None)

        tree_box = tk.Frame(left_frame, bg=OW_WHITE)
        tree_box.pack(fill="both", expand=True, padx=10, pady=(0, 10))

        self.tree = ttk.Treeview(tree_box, selectmode="browse", show="tree")
        tree_scroll = ttk.Scrollbar(tree_box, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=tree_scroll.set)
        self.tree.pack(side="left", fill="both", expand=True)
        tree_scroll.pack(side="right", fill="y")
        self.tree.bind("<<TreeviewSelect>>", self._on_select)

        # RIGHT MAIN EDITOR
        right_frame = tk.Frame(main_pane, bg=OW_WHITE, bd=1, relief="solid", highlightbackground=OW_BORDER)
        main_pane.add(right_frame, minsize=650)

        self.top_bar = tk.Frame(right_frame, bg=OW_BG, height=50)
        self.top_bar.pack(fill="x")
        self.top_bar.pack_propagate(False)

        self.title_lbl = tk.Label(self.top_bar, text="Hero / Mode Configurator", bg=OW_BG, fg=OW_TEXT_DARK, font=("Segoe UI", 12, "bold"))
        self.title_lbl.pack(side="left", padx=15)

        # Scrollable Canvas
        canvas_box = tk.Frame(right_frame, bg=OW_WHITE)
        canvas_box.pack(fill="both", expand=True)

        self.canvas = tk.Canvas(canvas_box, bg=OW_WHITE, bd=0, highlightthickness=0)
        self.canvas_scroll = ttk.Scrollbar(canvas_box, orient="vertical", command=self.canvas.yview)
        self.editor_content = tk.Frame(self.canvas, bg=OW_WHITE)

        self.canvas_window = self.canvas.create_window((0, 0), window=self.editor_content, anchor="nw")
        self.editor_content.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
        self.canvas.bind("<Configure>", lambda e: self.canvas.itemconfig(self.canvas_window, width=e.width))
        self.canvas.configure(yscrollcommand=self.canvas_scroll.set)

        self.canvas.pack(side="left", fill="both", expand=True, padx=10, pady=10)
        self.canvas_scroll.pack(side="right", fill="y")

        # Mousewheel
        self.bind_all("<MouseWheel>", self._on_scroll)
        self.bind_all("<Button-4>", self._on_scroll)
        self.bind_all("<Button-5>", self._on_scroll)

    def _on_scroll(self, event):
        if event.num == 4:
            self.canvas.yview_scroll(-1, "units")
        elif event.num == 5:
            self.canvas.yview_scroll(1, "units")
        elif event.delta:
            self.canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")

    def _btn(self, parent, text, cmd, bg=OW_ORANGE, fg=OW_WHITE, font=("Segoe UI", 9, "bold")):
        return tk.Button(parent, text=text, command=cmd, bg=bg, fg=fg, activebackground=OW_ORANGE_DARK,
                         activeforeground=OW_WHITE, font=font, relief="flat", padx=12, pady=5, cursor="hand2", bd=0)

    # ======================================================
    # SIDEBAR BUILDER
    # ======================================================
    def _populate_sidebar(self, filter_txt=""):
        self.tree.delete(*self.tree.get_children())
        self.tree_map = {}

        # 1. Global & Lobby
        cat_lobby = self.tree.insert("", "end", text=" ⚙️  Lobby & Match Settings", open=True)
        self.tree_map[cat_lobby] = ("lobby", LOBBY_SETTINGS, "Lobby Settings")

        cat_gen_modes = self.tree.insert("", "end", text=" 🎮  General Mode Settings", open=True)
        self.tree_map[cat_gen_modes] = ("gen_modes", GENERAL_MODE_SETTINGS, "General Mode Rules")

        cat_gen_combat = self.tree.insert("", "end", text=" ⚡  Global Hero Modifiers (500%)", open=True)
        self.tree_map[cat_gen_combat] = ("gen_combat", DEFAULT_COMBAT_MODS, "Global Hero Modifiers")

        # 2. Team Restrictions
        cat_teams = self.tree.insert("", "end", text=" 🚫  Team Hero Restrictions", open=True)
        for team, disabled_list in TEAM_DISABLED_HEROES.items():
            t_item = self.tree.insert(cat_teams, "end", text=f"   🛡️ {team}")
            self.tree_map[t_item] = ("team_bans", (team, disabled_list), f"{team} Disabled Heroes")

        # 3. Game Modes
        cat_modes = self.tree.insert("", "end", text=" 🎯  Individual Game Modes", open=True)
        for mode_name, settings in sorted(GAME_MODES.items()):
            if filter_txt and filter_txt.lower() not in mode_name.lower():
                continue
            m_item = self.tree.insert(cat_modes, "end", text=f"   🏁 {mode_name}")
            self.tree_map[m_item] = ("mode", settings, f"Mode: {mode_name}")

        # 4. Individual Heroes
        cat_heroes = self.tree.insert("", "end", text=f" 🦸  All Heroes ({len(HEROES_DATABASE)})", open=True)
        for hero_name, settings in sorted(HEROES_DATABASE.items()):
            if filter_txt and filter_txt.lower() not in hero_name.lower():
                continue
            h_item = self.tree.insert(cat_heroes, "end", text=f"   ⚡ {hero_name}")
            self.tree_map[h_item] = ("hero", settings, f"Hero: {hero_name}")

        # Select first item by default
        first = self.tree.get_children()
        if first:
            self.tree.selection_set(first[0])
            self._on_select()

    def _filter_tree(self):
        txt = self.search_var.get()
        if "🔍" in txt:
            return
        self._populate_sidebar(filter_txt=txt)

    def _on_select(self, event=None):
        selected = self.tree.selection()
        if not selected:
            return
        node_id = selected[0]
        data = self.tree_map.get(node_id)
        if not data:
            return

        cat_type, target_dict, title_name = data
        self.active_category = (cat_type, target_dict)
        self.title_lbl.config(text=title_name)
        self._render_editor(cat_type, target_dict)

    # ======================================================
    # RENDER CONTROLS
    # ======================================================
    def _render_editor(self, cat_type, target_data):
        for w in self.editor_content.winfo_children():
            w.destroy()

        if cat_type == "team_bans":
            self._render_team_bans(target_data)
            return

        # Render Key-Value setting cards
        for key, val in target_data.items():
            card = tk.Frame(self.editor_content, bg=OW_BG, bd=1, relief="flat", padx=12, pady=6)
            card.pack(fill="x", pady=2)

            lbl = tk.Label(card, text=key, bg=OW_BG, fg=OW_TEXT_DARK, font=("Segoe UI", 10, "bold"), width=34, anchor="w")
            lbl.pack(side="left", padx=5)

            val_str = str(val).strip()

            if val_str in ["Enabled", "Disabled"]:
                cb = ttk.Combobox(card, values=["Enabled", "Disabled"], state="readonly", width=14)
                cb.set(val_str)
                cb.pack(side="left", padx=5)
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))

            elif val_str in ["On", "Off"]:
                cb = ttk.Combobox(card, values=["On", "Off"], state="readonly", width=14)
                cb.set(val_str)
                cb.pack(side="left", padx=5)
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))

            elif val_str in ["Yes", "No"]:
                cb = ttk.Combobox(card, values=["Yes", "No"], state="readonly", width=14)
                cb.set(val_str)
                cb.pack(side="left", padx=5)
                cb.bind("<<ComboboxSelected>>", lambda e, d=target_data, k=key, c=cb: d.__setitem__(k, c.get()))

            elif "%" in val_str:
                s_box = tk.Frame(card, bg=OW_BG)
                s_box.pack(side="left", fill="x", expand=True)

                num = re.sub(r"[^\d.]", "", val_str)
                f_val = float(num) if num else 100.0

                ent = tk.Entry(s_box, width=8, font=("Segoe UI", 9, "bold"), bg=OW_WHITE, relief="solid", bd=1)
                ent.insert(0, val_str)
                ent.pack(side="right", padx=5)

                scale = ttk.Scale(s_box, from_=0, to=800, value=f_val, orient="horizontal")
                scale.pack(side="left", fill="x", expand=True, padx=5)

                def update_s(s_val, e=ent, d=target_data, k=key):
                    v = f"{int(float(s_val))}%"
                    e.delete(0, 'end')
                    e.insert(0, v)
                    d[k] = v

                def update_e(evt, s=scale, e=ent, d=target_data, k=key):
                    r = e.get()
                    n = re.sub(r"[^\d.]", "", r)
                    if n:
                        s.set(float(n))
                        d[k] = f"{n}%"

                scale.config(command=update_s)
                ent.bind("<Return>", update_e)
                ent.bind("<FocusOut>", update_e)

            else:
                ent = tk.Entry(card, font=("Segoe UI", 10), bg=OW_WHITE, relief="solid", bd=1)
                ent.insert(0, val_str)
                ent.pack(side="left", fill="x", expand=True, padx=5)
                ent.bind("<KeyRelease>", lambda e, d=target_data, k=key, ent_w=ent: d.__setitem__(k, ent_w.get()))

        self.editor_content.update_idletasks()
        self.canvas.yview_moveto(0)
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))

    def _render_team_bans(self, target_data):
        team_name, disabled_list = target_data
        
        info = tk.Label(self.editor_content, text=f"Currently Disabled Heroes for {team_name}:", bg=OW_WHITE, fg=OW_TEXT_DARK, font=("Segoe UI", 11, "bold"))
        info.pack(anchor="w", padx=10, pady=(10, 5))

        chips_frame = tk.Frame(self.editor_content, bg=OW_WHITE)
        chips_frame.pack(fill="x", padx=10, pady=5)

        for h in list(disabled_list):
            chip = tk.Frame(chips_frame, bg=OW_ORANGE_LIGHT, bd=1, relief="solid", padx=8, pady=4)
            chip.pack(side="left", padx=4, pady=4)
            tk.Label(chip, text=h, bg=OW_ORANGE_LIGHT, fg=OW_ORANGE_DARK, font=("Segoe UI", 9, "bold")).pack(side="left")

            def remove_h(name=h):
                disabled_list.remove(name)
                self._render_team_bans(target_data)

            tk.Button(chip, text="✕", bg=OW_ORANGE_LIGHT, fg=OW_ORANGE_DARK, relief="flat", bd=0, cursor="hand2", command=remove_h).pack(side="left", padx=(4,0))

        add_box = tk.Frame(self.editor_content, bg=OW_WHITE)
        add_box.pack(fill="x", padx=10, pady=15)
        
        hero_cb = ttk.Combobox(add_box, values=sorted(list(HEROES_DATABASE.keys())), state="readonly", width=20)
        hero_cb.set("Select Hero to Ban...")
        hero_cb.pack(side="left", padx=5)

        def add_hero():
            selected = hero_cb.get()
            if selected in HEROES_DATABASE and selected not in disabled_list:
                disabled_list.append(selected)
                self._render_team_bans(target_data)

        self._btn(add_box, "➕ Ban Hero", add_hero, bg=OW_ORANGE).pack(side="left")

    # ======================================================
    # ACTIONS & EXPORT
    # ======================================================
    def _sync_all_500(self):
        for h_dict in HEROES_DATABASE.values():
            for k, v in DEFAULT_COMBAT_MODS.items():
                h_dict[k] = v
        if self.active_category:
            self._render_editor(*self.active_category)
        messagebox.showinfo("Synced", "All heroes have been synchronized with standard 500% combat modifiers!")

    def _show_live_code(self):
        code = build_workshop_text()
        win = tk.Toplevel(self)
        win.title("Overwatch Workshop Code Preview")
        win.geometry("850x650")
        win.configure(bg=OW_SLATE_DARK)

        txt = tk.Text(win, bg=OW_SLATE_DARK, fg=OW_WHITE, insertbackground=OW_ORANGE, font=("Consolas", 10), wrap="none")
        s_y = ttk.Scrollbar(win, orient="vertical", command=txt.yview)
        s_x = ttk.Scrollbar(win, orient="horizontal", command=txt.xview)
        txt.configure(yscrollcommand=s_y.set, xscrollcommand=s_x.set)

        txt.insert("1.0", code)
        txt.pack(side="top", fill="both", expand=True)
        s_y.pack(side="right", fill="y")
        s_x.pack(side="bottom", fill="x")

    def _copy_code(self):
        code = build_workshop_text()
        self.clipboard_clear()
        self.clipboard_append(code)
        messagebox.showinfo("Copied to Clipboard", "Complete Overwatch Workshop settings code copied!\n\nPaste it directly inside Overwatch's custom game settings menu.")

    def _export_file(self):
        path = filedialog.asksaveasfilename(defaultextension=".txt", initialfile="settings.txt", filetypes=[("Text Files", "*.txt")])
        if path:
            code = build_workshop_text()
            with open(path, "w", encoding="utf-8") as f:
                f.write(code)
            messagebox.showinfo("Exported", f"Successfully saved settings to:\n{path}")

if __name__ == "__main__":
    app = OverwatchWorkshopGenerator()
    app.mainloop()