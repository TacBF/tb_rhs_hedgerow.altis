class cfgVehicles
{
	
	#include "factions\BLU_F_ammoBox.hpp"
	#include "factions\OPF_F_ammoBox.hpp"
	
	class rhs_truck	{ canTowTrailer = 1; };
	class RHS_UAZ_Base: rhs_truck { towingOffset[] = {0, 2.5, 0.1}; };
	class rhsusf_m998_w_2dr: rhs_truck { towingOffset[] = {0, 1.9, 2}; };
	class rhs_tigr_base: rhs_truck { towingOffset[] = {0, 1.85, 2}; };
	class RHS_Ural_Base: rhs_truck { towingOffset[] = {0, 3.5, 0}; };
	class rhs_btr_base: rhs_truck { towingOffset[] = {0, 1, 0}; };
	class rhs_btr70_chdkz: rhs_truck { towingOffset[] = {0, 0.5, 0}; };
	class rhs_btr80_msv: rhs_truck { towingOffset[] = {0, 0.5, 1}; };
	class rhs_btr80a_msv: rhs_truck { towingOffset[] = {0, 0.5, 1}; };
	class rhs_btr70_msv: rhs_truck { towingOffset[] = {0, 0.5, 1}; };

	class RHS_Ural
	{
		cargoOffsetStart[] = {0, -3.15, 1};
		cargoOffsetEnd[] = {0, 0.7, 1};
		canHoldVisibleCargo = 1;
	};
	class RHS_Ural_MSV_01: RHS_Ural {};
	class RHS_Ural_Open_MSV_01: RHS_Ural {};

	class RHS_Ural_VDV_01: RHS_Ural {};
	class RHS_Ural_Open_VDV_01: RHS_Ural {};

	class RHS_Ural_VMF_01: RHS_Ural {};
	class RHS_Ural_Open_VMF_01: RHS_Ural {};

	class RHS_Ural_VV_01: RHS_Ural {};
	class RHS_Ural_Open_VV_01: RHS_Ural {};

	//Civilian
	class RHS_Ural_Open_Civ_03: RHS_Ural {};
	class RHS_Ural_Open_Civ_02: RHS_Ural {};
	class RHS_Ural_Open_Civ_01: RHS_Ural {};
	class RHS_Ural_Civ_03: RHS_Ural {};
	class RHS_Ural_Civ_02: RHS_Ural {};
	class RHS_Ural_Civ_01: RHS_Ural {};

	class RHS_GAZ6
	{
		cargoOffsetStart[] = {0, -4.4, 1.4};
		cargoOffsetEnd[] = {0, 1.2, 1.4};
		canHoldVisibleCargo = 1;
	};
	class rhs_gaz66_msv: RHS_GAZ6 {};
	class rhs_gaz66o_msv: RHS_GAZ6 {};

	class rhs_gaz66_vdv: RHS_GAZ6 {};
	class rhs_gaz66o_vdv: RHS_GAZ6 {};

	class rhs_gaz66_vmf: RHS_GAZ6 { canTowTrailer = 1; towingOffset[] = {0, 0, 0.92};};
	class rhs_gaz66o_vmf: RHS_GAZ6 {};

	class rhs_gaz66_vv: RHS_GAZ6 {};
	class rhs_gaz66o_vv: RHS_GAZ6 {};

	class RHS_CH_47F
	{
		cargoOffsetStart[] = {0, -4, -1.08};
		cargoOffsetEnd[] = {0, 2.5, -1.08};
		canHoldVisibleCargo = 1;
	};
	class RHS_CH_47F_light: RHS_CH_47F {};
	class RHS_Mi8AMT_vdv
	{
		cargoOffsetStart[] = {0, -1, -0.7};
		cargoOffsetEnd[] = {0, 3.85, -0.7};
		canHoldVisibleCargo = 1;
	};
	class RHS_Mi8mt_vdv: RHS_Mi8AMT_vdv {};
	class RHS_Mi8MTV3_vdv: RHS_Mi8AMT_vdv {};
	class RHS_Mi8mt_vvsc: RHS_Mi8AMT_vdv {};
	class RHS_Mi8AMT_vvsc: RHS_Mi8AMT_vdv {};
	class RHS_Mi8AMTSh_vvsc: RHS_Mi8AMT_vdv {};
	class RHS_Mi8MTV3_vvsc: RHS_Mi8AMT_vdv {};
	class RHS_Mi8AMT_vvs: RHS_Mi8AMT_vdv {};
	class RHS_Mi8AMTSh_vvs: RHS_Mi8AMT_vdv {};
	class RHS_Mi8mt_vvs: RHS_Mi8AMT_vdv {};
	class RHS_Mi8MTV3_vvs: RHS_Mi8AMT_vdv {};

	class RHS_NSV_TriPod_MSV // RHS Opfor Static
	{
		boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.45, -1, -2.2}};
		proxyObject = "RHS_NSV_TriPod_MSV";
	};

	class RHS_NSV_TriPod_VDV // RHS Opfor Static
	{
		boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.45, -1, -2.2}};
		proxyObject = "RHS_NSV_TriPod_VDV";
	};

	       class RHS_M2StaticMG_D // RHS Blufor AA MG Static
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.75, -1.1, -2.3}};
                proxyObject = "RHS_M2StaticMG_D";
        };

        class RHS_MK19_TriPod_D // RHS Blufor MK19
        {
                boundingOffset[] = {{-1.20, -2.1, -0.70}, {-1.25, -0.5, -1.8}};
                proxyObject = "RHS_MK19_TriPod_D";
        };

        class RHS_M2StaticMG_MiniTripod_D // RHS Blufor MG static
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.65, -1, -2.2}};
                proxyObject = "RHS_M2StaticMG_MiniTripod_D";
        };

        class RHS_M2StaticMG_WD // RHS Blufor AA MG Static
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.75, -1.1, -2.3}};
                proxyObject = "RHS_M2StaticMG_WD";
        };

        class RHS_MK19_TriPod_WD // RHS Blufor MK19
        {
                boundingOffset[] = {{-1.20, -2.1, -0.70}, {-1.25, -0.5, -1.8}};
                proxyObject = "RHS_MK19_TriPod_WD";
        };

        class RHS_M2StaticMG_MiniTripod_WD // RHS Blufor MG static
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.65, -1, -2.2}};
                proxyObject = "RHS_M2StaticMG_MiniTripod_WD";
        };

//RDS ====================================

        class RDS_ZU23_AAF // ZSU
        {
                boundingOffset[] = {{-1.05, -1.55, -0.35}, {-0.85, -2, -2}};
                proxyObject = "RDS_ZU23_AAF";
        };

        class RDS_ZU23_CSAT // ZSU
        {
                boundingOffset[] = {{-1.05, -1.55, -0.35}, {-0.85, -2, -2}};
                proxyObject = "RDS_ZU23_CSAT";
        };

        class RDS_ZU23_FIA // ZSU
        {
                boundingOffset[] = {{-1.05, -1.55, -0.35}, {-0.85, -2, -2}};
                proxyObject = "RDS_ZU23_FIA";
        };

        class RDS_TOW_TriPod_AAF // Are you tracking like a TOW?
        {
                boundingOffset[] = {{-0.5, -1.55, -0.55}, {-0.5, -0.8, -1.4}};
                proxyObject = "RDS_TOW_TriPod_AAF";
        };

        class RDS_TOW_TriPod_FIA // TOW
        {
                boundingOffset[] = {{-0.5, -1.55, -0.55}, {-0.5, -0.8, -1.4}};
                proxyObject = "RDS_TOW_TriPod_FIA";
        };

        class RDS_SPG9_AAF // SPG
        {
                boundingOffset[] = {{-0.75, -1.1, -0.35}, {-1.2, -1, -1.4}};
                proxyObject = "RDS_SPG9_AAF";
        };

        class RDS_SPG9_CSAT // SPG
        {
                boundingOffset[] = {{-0.75, -1.1, -0.35}, {-1.2, -1, -1.4}};
                proxyObject = "RDS_SPG9_CSAT";
        };

        class RDS_SPG9_FIA // SPG
        {
                boundingOffset[] = {{-0.75, -1.1, -0.35}, {-1.2, -1, -1.4}};
                proxyObject = "RDS_SPG9_FIA";
        };

        class RDS_2b14_82mm_CSAT // Moarter
        {
                boundingOffset[] = {{-0.5, -1.55, -0.55}, {-0.5, -0.8, -1.4}};
                proxyObject = "RDS_2b14_82mm_CSAT";
        };

        class RDS_2b14_82mm_FIA // Moarter
        {
                boundingOffset[] = {{-0.5, -1.55, -0.55}, {-0.5, -0.8, -1.4}};
                proxyObject = "RDS_2b14_82mm_FIA";
        };

        class RDS_2b14_82mm_AAF // Moarter
        {
                boundingOffset[] = {{-0.5, -1.55, -0.55}, {-0.5, -0.8, -1.4}};
                proxyObject = "RDS_2b14_82mm_AAF";
        };

        class RDS_MK19_TriPod_AAF // FUK19
        {
                boundingOffset[] = {{-1.3, -2.2, -0.68}, {-1.35, -0.7, -1.7}};
                proxyObject = "RDS_MK19_TriPod_AAF";
        };

        class RDS_MK19_TriPod_FIA // FUK19
        {
                boundingOffset[] = {{-1.3, -2.2, -0.68}, {-1.35, -0.7, -1.7}};
                proxyObject = "RDS_MK19_TriPod_FIA";
        };

        class RDS_Metis_AAF // AT
        {
                boundingOffset[] = {{-1.3, -2.3, -0.88}, {-1, -0.7, -2.2}};
                proxyObject = "RDS_Metis_AAF";
        };

        class RDS_Metis_CSAT // AT
        {
                boundingOffset[] = {{-1.3, -2.3, -0.88}, {-1, -0.7, -2.2}};
                proxyObject = "RDS_Metis_CSAT";
        };

        class RDS_Metis_FIA // AT
        {
                boundingOffset[] = {{-1.3, -2.3, -0.88}, {-1, -0.7, -2.2}};
                proxyObject = "RDS_Metis_FIA";
        };

        class RDS_M252_AAF // Moarter
        {
                boundingOffset[] = {{-0.5, -1.55, -1}, {-0.5, -0.8, -1.1}};
                proxyObject = "RDS_M252_AAF";
        };

        class RDS_M252_FIA // Moarter
        {
                boundingOffset[] = {{-0.5, -1.55, -1}, {-0.5, -0.8, -1.1}};
                proxyObject = "RDS_M252_FIA";
        };

        class RDS_KORD_CSAT // KORD low
        {
                boundingOffset[] = {{-1.1, -1.6, -0.35}, {-1.6, -1, -2.2}};
                proxyObject = "RDS_KORD_CSAT";
        };

        class RDS_KORD_FIA // KORD low
        {
                boundingOffset[] = {{-1.1, -1.6, -0.35}, {-1.6, -1, -2.2}};
                proxyObject = "RDS_KORD_FIA";
        };

        class RDS_KORD_AAF // KORD low
        {
                boundingOffset[] = {{-1.1, -1.6, -0.35}, {-1.6, -1, -2.2}};
                proxyObject = "RDS_KORD_AAF";
        };

        class RDS_KORD_high_FIA // KORD High
        {
                boundingOffset[] = {{-1.5, -1.8, -0.35}, {-1.8, -1, -2.2}};
                proxyObject = "RDS_KORD_high_FIA";
        };

        class RDS_KORD_high_CSAT // KORD High
        {
                boundingOffset[] = {{-1.5, -1.8, -0.35}, {-1.8, -1, -2.2}};
                proxyObject = "RDS_KORD_high_CSAT";
        };

        class RDS_KORD_high_AAF // KORD High
        {
                boundingOffset[] = {{-1.5, -1.8, -0.35}, {-1.8, -1, -2.2}};
                proxyObject = "RDS_KORD_high_AAF";
        };

        class RDS_DSHkM_Mini_TriPod // dshkm....going insaine
        {
                boundingOffset[] = {{-1, -1.8, -0.35}, {-1.45, -0.6, -2}};
                proxyObject = "RDS_DSHkM_Mini_TriPod";
        };

        class RDS_DSHkM_Mini_TriPod_CSAT // dshkm....going insaine
        {
                boundingOffset[] = {{-1, -1.8, -0.35}, {-1.45, -0.6, -2}};
                proxyObject = "RDS_DSHkM_Mini_TriPod_CSAT";
        };

        class RDS_DSHkM_Mini_TriPod_FIA // dshkm....going insaine
        {
                boundingOffset[] = {{-1, -1.8, -0.35}, {-1.45, -0.6, -2}};
                proxyObject = "RDS_DSHkM_Mini_TriPod_FIA";
        };

        class RDS_DSHKM_CSAT // Im back
        {
                boundingOffset[] = {{-1.05, -2, -0.45}, {-1.6, -0.8, -2.2}};
                proxyObject = "RDS_DSHKM_CSAT";
        };

        class RDS_DSHKM_AAF // Im back
        {
                boundingOffset[] = {{-1.05, -2, -0.45}, {-1.6, -0.8, -2.2}};
                proxyObject = "RDS_DSHKM_AAF";
        };

        class RDS_DSHKM_FIA // Im back
        {
                boundingOffset[] = {{-1.05, -2, -0.45}, {-1.6, -0.8, -2.2}};
                proxyObject = "RDS_DSHKM_FIA";
        };

        class RDS_M119_AAF // Arty
        {
                boundingOffset[] = {{-1.05, -1, -0.65}, {-1.1, -0.8, -2.2}};
                proxyObject = "RDS_M119_AAF";
        };

        class RDS_M119_FIA // Arty
        {
                boundingOffset[] = {{-1.05, -1, -0.65}, {-1.1, -0.8, -2.2}};
                proxyObject = "RDS_M119_FIA";
        };

        class RDS_D30_CSAT // Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_CSAT";
        };

        class RDS_D30_AAF // Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_AAF";
        };

        class RDS_D30_FIA // Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_FIA";
        };

        class RDS_D30_AT_AAF // AT Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_AT_AAF";
        };

        class RDS_D30_AT_CSAT // AT Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_AT_CSAT";
        };

        class RDS_D30_AT_FIA // AT Arty
        {
                boundingOffset[] = {{-1.0, -1, -0.65}, {[-1, -1.1, -1.6}};
                proxyObject = "RDS_D30_AT_FIA";
        };

        class RDS_M2StaticMG_AAF // m2
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.75, -1.1, -2.3}};
                proxyObject = "RDS_M2StaticMG_AAF";
        };

        class RDS_M2StaticMG_FIA // m2
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.75, -1.1, -2.3}};
                proxyObject = "RDS_M2StaticMG_FIA";
        };

        class RDS_M2StaticMG_MiniTripod_AAF // m2mini
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.65, -1, -2.2}};
                proxyObject = "RDS_M2StaticMG_MiniTripod_AAF";
        };

        class RDS_M2StaticMG_MiniTripod_FIA // m2mini
        {
                boundingOffset[] = {{-1.00, -1.55, -0.35}, {-1.65, -1, -2.2}};
                proxyObject = "RDS_M2StaticMG_MiniTripod_FIA";
        };

        class RDS_Igla_AA_pod_CSAT // AA
        {
                boundingOffset[] = {{-0.3, -0.3, -0.35}, {-0.85, -0.5, -2}};
                proxyObject = "RDS_Igla_AA_pod_CSAT";
        };

        class RDS_Igla_AA_pod_AAF // AA
        {
                boundingOffset[] = {{-0.3, -0.3, -0.35}, {-0.85, -0.5, -2}};
                proxyObject = "RDS_Igla_AA_pod_AAF";
        };

        class RDS_Igla_AA_pod_FIA // AA
        {
                boundingOffset[] = {{-0.3, -0.3, -0.35}, {-0.85, -0.5, -2}};
                proxyObject = "RDS_Igla_AA_pod_FIA";
        };

        class RDS_AGS_CSAT // ags
        {
                boundingOffset[] = {{-1.05, -2, -0.9}, {[-1.1, -1, -2.1}};
                proxyObject = "RDS_AGS_CSAT";
        };

        class RDS_AGS_AAF // ags
        {
                boundingOffset[] = {{-1.05, -2, -0.9}, {[-1.1, -1, -2.1}};
                proxyObject = "RDS_AGS_AAF";
        };

        class RDS_AGS_FIA // ags
        {
                boundingOffset[] = {{-1.05, -2, -0.9}, {[-1.1, -1, -2.1}};
                proxyObject = "RDS_AGS_FIA";
        };


//FO's

	class ICE_ForwardOutpost_container_EastMG
	{
         crateContents[] = {
            RDS_KORD_FIA,
            {RDS_KORD_high_FIA, 2},
            {ICE_emptySandbagsCrate_supply, 4}
         };
         crateMass = 1750;
		 proxyObject = "ICE_ForwardOutpost_container_EastMG";
	};

	class ICE_ForwardOutpost_container_WestMG
	{
     	crateContents[] = {
        	RDS_M2StaticMG_MiniTripod_AAF,
       	 	{RDS_M2StaticMG_AAF, 2},
       		{ICE_emptySandbagsCrate_supply, 4}
    	};
     	crateMass = 1750;
     	proxyObject = "ICE_ForwardOutpost_container_WestMG";
	};

	class ICE_ForwardOutpost_containerHuge_East
	{
         crateContents[] = {
         	RDS_Metis_AAF,
        	RDS_2b14_82mm_AAF,
            {RDS_KORD_FIA, 2},
       	 	{RDS_KORD_high_FIA, 4},
       	 	{ICE_Quadbike_supplyEast, 4},
       		{ICE_emptySandbagsCrate_supply, 10}
         };
         crateMass = 3000;
		 proxyObject = "ICE_ForwardOutpost_containerHuge_East";
	};

	class ICE_ForwardOutpost_containerHuge_West
	{
     	crateContents[] = {
     		RDS_M252_AAF,
        	RDS_TOW_TriPod_AAF,
        	{RDS_M2StaticMG_MiniTripod_AAF, 2},
       	 	{RDS_M2StaticMG_AAF, 4},
       	 	{ICE_Quadbike_supplyEast, 4},
       		{ICE_emptySandbagsCrate_supply, 10}
    	};
     	crateMass = 3000;
     	proxyObject = "ICE_ForwardOutpost_containerHuge_West";
	};


};