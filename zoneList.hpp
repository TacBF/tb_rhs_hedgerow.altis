#include "tb_defines.hpp"

zoneList[] =
{
//ID TEAM          SPAWNTYPE      LINK         SYNC   PROFILE   DEPEND     DEPQTY  ZONE_DESC
{ 0, 0           , 0         ,    {}         , {}    , 1      , {}        , 0      },

{ 1, TEAM_BLUE   , SPAWN_XRAY,    {}        , {}    , 1      , {}        , 0    , "%3" },

{ 2, TEAM_BLUE   , SPAWN_NEVER,   {1,3}    , {}    , 1      , {}        , 0    , "Guardtower" },
{ 3, TEAM_NEUTRAL  , SPAWN_NEVER,   {2,4}      , {}   , 1      , {}        , 0    , "Bravo" },
{ 4, TEAM_NEUTRAL  , SPAWN_NEVER,   {3,5}      , {}   , 1      , {}        , 0    , "Charlie" },
{ 5, TEAM_RED  , SPAWN_NEVER,   {4,6}      , {}   , 1      , {}        , 0    , "Delta" },

{ 6, TEAM_RED, SPAWN_XRAY,  {}       , {}    , 1      , {}        , 0    , "%3" },

{ 7, TEAM_RED, 		SPAWN_INSTANT,    {}		, {}    , 1    , {}        , 0    , "%4: 1" },

{ 8, TEAM_BLUE, 		SPAWN_INSTANT ,    {}      	, {}    , 1      , {}        , 0    , "%4: 1" }
};


