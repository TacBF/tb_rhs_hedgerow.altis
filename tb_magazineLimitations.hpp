class cfgMagazines
{
	class magazineLimitations
	{
		/*---------------------------------------------------------------------------
			Sets the amount of magazines you can have out of the following array (So in total!)
			You can specify a special number for resistance as well
		---------------------------------------------------------------------------*/
		class 40mm_HE
		{
			magazineArray[] = {"rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203"};
			limit = 8;
			limtResistance = 8;
			categoryName = "40mm HE Grenades";
		};
		
		class 6x40mm_Grenades
		{
			magazineArray[] = {"rhsusf_mag_6Rnd_M441_HE","rhsusf_mag_6Rnd_M433_HEDP"};
			limit = 8;
			limtResistance = 8;
			categoryName = "6x40mm Grenades";
		};
		
		class Grenade
		{
			magazineArray[] = {"rhs_mag_rgd5", "rhs_mag_m67", "rhs_mag_rgn", "rhs_mag_rgo"};
			limit = 2;
			limtResistance = 2;
			categoryName = "HE Grenades";
		};
		
		class Stun_Grenade
		{
			magazineArray[] = {"rhs_mag_fakel", "rhs_mag_fakels", "rhs_mag_zarya2", "rhs_mag_plamyam", "rhs_mag_mk84", "rhs_mag_an_m14_th3", "rhs_mag_m7a3_cs", "rhs_mag_mk3a2"};
			limit = 2;
			limtResistance = 2;
			categoryName = "Stun Grenades";
		};
		
		class HE_Shotgun
		{
			magazineArray[] = {"rhsusf_8Rnd_FRAG", "rhsusf_5Rnd_FRAG", "rhsusf_8Rnd_HE", "rhsusf_5Rnd_HE"};
			limit = 3;
			limtResistance = 3;
			categoryName = "HE Shotgun";
		};
		
		class LAT_Rockets
		{
			magazineArray[] = {"CUP_M136_M", "CUP_RPG18_M"};
			limit = 1;
			limtResistance = 1;
			categoryName = "LAT Rockets";
		};
		
		class MAT_Rockets
		{
			magazineArray[] = {"rhs_rpg7_PG7VL_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M", "CUP_SMAW_HEAA_M_N", "CUP_SMAW_HEDP_M_N", "CUP_PG7V_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M", "RPG32_F", "RPG32_HE_F"};
			limit = 3;
			limtResistance = 3;
			categoryName = "MAT Rockets";
		};
		
		class HAT_Rockets
		{
			magazineArray[] = {"CUP_Dragon_EP1_M", "CUP_AT13_M", "CUP_NLAW_M", "CUP_Javelin_M", "rhs_fgm148_magazine_AT"};
			limit = 1;
			limtResistance = 1;
			categoryName = "HAT Rockets";
		};
	};
};