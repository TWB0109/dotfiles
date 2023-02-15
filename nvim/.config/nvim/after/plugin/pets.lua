require("pets").setup({
    row = 2, -- the row (height) to display the pet at (must be at least 1)
    col = 8, -- the column to display the pet at (set to high number to have it stay still on the right side)
    speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
    default_pet = "cat", -- the pet to use for the PetNew command
    default_style = "black", -- the style of the pet to use for the PetNew command
    random = false, -- wether to use a random pet for the PetNew command, ovverides default_pet and default_style
    death_animation = true, -- animate the pet's death, set to false to feel less guilt
})
