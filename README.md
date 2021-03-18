# Pokémon Red, Green, and Blue

This is based on Pret's [disassembly][pokered] of the US releases of Pokémon Red and Blue, with an added Green to stand in for JP Blue

It builds the following games:

- Pokémon Red (English), based on the offical US Pokémon Red that's derived from Japanese Pokémon Red
- Pokémon Blue (English), based on the official US Pokémon Blue that's derived from Japanese Pokémon Green
- Pokémon Green (English), derived from Japanese Pokémon Blue
- Pokémon Blue (Debug version)

In addition to adding Pokémon Green, this build also makes the following changes:

- POKé DOLLS can no longer be used to defeat [Ghost Marowak](https://glitchcity.wiki/Go_past_the_Marowak_ghost_without_a_Silph_Scope).
- East shore tiles will no longer [generate encounters](https://glitchcity.wiki/Old_man_glitch). (Same behavior as Pokémon Yellow)
- Forest tall-grass-with-flowers tiles will now correctly generate encounters. (Side-effect of the above change.)
- The [Soft Reset](https://bulbapedia.bulbagarden.net/wiki/Soft_resetting) button combination is removed.
- The Safari Zone will now [let you in](https://bulbapedia.bulbagarden.net/wiki/Kanto_Safari_Zone#Trivia) if you don't have enough money, but with less than 30 SAFARI BALLs. (Same behavior as Pokémon Yellow)
- The Safari Zone's initial step count is boosted from 500 to 750, allowing for more missteps while trying to find HM03 and the GOLD TEETH.
- The Safari Zone will no longer let you leave [without quitting](https://glitchcity.wiki/Safari_Zone_exit_glitch) the Safari Game. Fainting will also end the Safari Game. (Same fainting behavior as Pokémon Yellow)
- Cycling Road's gate guards will no longer let you sneak by [without a BICYCLE](https://glitchcity.wiki/Go_on_Cycling_Road_without_a_Bicycle).
- [Escaping a trainer encounter](https://glitchcity.wiki/Trainer_escape_glitch) no longer leaves the game in a broken state, whether through use of moves/items or by blacking out to a wild encounter in sight of a trainer.
- Move swapping is no longer possible whle [transformed](https://glitchcity.wiki/Swapping_Transform_moves_glitch). (Same behavior as Pokémon Yellow)
- The Bike Shop salesman no longer leaves [Instant Text Speed](https://glitchcity.wiki/Bike_Shop_instant_text_glitch) turned on. (Same behavior as Pokémon Yellow)
- The NPC that takes you to Pewter Gym can no longer be bypassed. (Same behavior as Pokémon Yellow)
- The player can no longer [get stuck in the wall of Oak's Lab](https://glitchcity.wiki/Get_stuck_in_a_wall) if a Pallet Town NPC gets in their way.
- Item evolutions can no longer erroneously happen [during battles](https://glitchcity.wiki/Evolve_without_an_evolutionary_stone). (Same behavior as Pokémon Yellow)
- [Escaping](https://glitchcity.wiki/Cable_Club_escape_glitch) from the Cable Club is no longer possible. (Same behavior as Pokémon Yellow)
- Buying an item that already has a full stack at the end of the Bag or PC will no longer [overflow and write to arbitrary memory addresses](https://glitchcity.wiki/99_item_stack_glitch). (Same behavior as Pokémon Yellow)
- If a player's frozen Pokémon stays in battle for 25 consecutive turns, it will thaw. (Freeze normally never thaws out in Red, Green, Blue, or Yellow) This prevents a potential softlock in which the AI can end up indefinitely refusing to damage or defrost the player's Pokémon. Enemy Pokémon are not limited by PP in Red, Green, Blue, or Yellow, so such a situation would never resolve.
- STRUGGLE is now typeless. No type resists or is immune to STRUGGLE, so the softlock where a player runs out of moves against a never-attacking GHOST-type Pokémon is now impossible.

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## Pret disassembly projects:

- [**Pokémon Red**][pokered]
- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold/Silver**][pokegold]
- [**Pokémon Crystal**][pokecrystal]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon FireRed**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokered]: https://github.com/pret/pokered
[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokecrystal]: https://github.com/pret/pokecrystal
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[discord]: https://discord.gg/d5dubZ3
[irc]: https://kiwiirc.com/client/irc.freenode.net/?#pret
