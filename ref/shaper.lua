--- a dynamic scaling shaper
--
-- just some notes here. should be implemented in C for performance
--
-- 2 categories of shapers are provided
--      1. relative shapers (like RC curves)
--      2. absolute shapers (quantizers)
--
-- relative shapers should be simple lookup tables with interpolation.
-- these can be relatively small tables as they are not for audio so
-- distortion isn't much of a concern.
-- 
-- these will cover the basics:
--  linear (which is just pass through)
--  square
--  log / expo
--  sine / cosine / tan
--  sec / csc
--  1/x
--
-- of note here is that all of these relative shapers for drawing a
-- line between 2 points could be applied absolutely as well, shifting
-- the baseline of the output. consider that these could be different!
--
-- 
-- the absolute shapers are interesting though as a set of divisions
-- thinking primarily in terms of absolutely dividing up the output
-- space.
-- user provides:
--  zero point to base off (could be a 'key')
--  fold point (1V becomes 1 octave, but could be eg 1v2 for buchla)
--  either | divisions (divides fold-size into n equal steps)
--         | list (divides fold-size unequally according a list)
--
-- the natural use is to provide scales for quantizing. by using the
-- list approach, one can send arbitrary pitches, so this could be
-- tonal scales directly, rather than semitones of 'divisions'.
--
-- list can also take fractions to natively handle just intonation,
-- readily accepting a scale as a list of fractions.
--
-- a weighting mechanism could be added to give a wider window to
-- preferred values.
--
-- setting divisions to a large number, then manipulating fold will
-- essentially become a bit crusher with continuously variable bits
--

local shaper = { 'zero' = 0
               , 'fold' = 1  --volts
               , 'divs' = 12 --semitones
               , 'list' = {} --empty means nil
               }
--
--
-- consider 2d waves
-- how should these relate to the Asl. 1 master, 1 slave
-- or just run 2 in parallel with diff equations.
-- eg lissajous curves
--
--
