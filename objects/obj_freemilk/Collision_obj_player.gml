if (global.noisejetpack && (playerid == -4))
{
    with (other)
    {
        hsp = 0
        vsp = 0
        landAnim = 0
        pizzapepperN = 0
        scr_soundeffect(sfx_cheesejump)
        sprite_index = spr_firemouthend
        image_index = 0
        image_speed = 0.35
        state = (146 << 0)
        other.sprite_index = spr_freemilksuprised
        other.image_index = 0
        other.playerid = id
    }
}
