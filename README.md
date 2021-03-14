# Pokémon Red, Green, and Blue

This is based on Pret's [disassembly][pokered] of the US releases of Pokémon Red and Blue, with an added Green to stand in for JP Blue

It builds the following ROMs:

- Pokemon Red (TPP).gb `sha1: TBD`
- Pokemon Blue (TPP).gb `sha1: TBD`
- Pokemon Green (TPP).gb `sha1: TBD`
- BLUEMONS.GB (debug build) `sha1: TBD`

In addition to adding Pokémon Green, this build also makes the following changes:

- Poké DOLLS can no longer be used to defeat Ghost Marowak.
- East shore tiles will no longer generate encounters. (No [Old Man Glitch](https://bulbapedia.bulbagarden.net/wiki/Old_man_glitch))
- Forest tall-grass-with-flowers tiles will now correctly generate encounters.
- Soft Reset button combination is removed.
- The Safari Zone will now let you in if you don't have enough money, but with less than 30 SAFARI BALLs. (Same behavior as Pokémon Yellow)
- The Safari Zone will no longer let you leave without quitting the Safari Game. This prevents several glitches, the most major being [Glitch City](https://bulbapedia.bulbagarden.net/wiki/Glitch_City)
- The Safari Zone's initial step count is boosted from 500 to 750, allowing for more missteps while trying to find HM03 and the GOLD TEETH.
- Cycling Road's gate guards will no longer let you sneak by without a BICYCLE.

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
