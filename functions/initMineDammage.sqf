// By SilverWolf4
// Usage: this addEventHandler["handleDamage",{_this call fnc_handleDammage;}];
// NOTE: This code was written for usa for RHS vehicles only, other applications may lead to issues

fnc_handleDammage = {
        params [["_unit",objNull,[objNull]], ["_part","",[""]], ["_damage",0,[0]], ["_source",objNull,[objNull]], ["_projectile","",[""]], ["_hitPartIndex",0,[0]]];

        diag_log _this;
        if (isNull _source) then {
                diag_log "Source Null";
        };
        if (_projectile == "CUP_Mine_Ammo") then {
                if ((_unit isKindOf "Car") or (_unit isKindOf "Truck")) then {
                        {
                                _unit setHitPointDamage [_x, 1];
                        } forEach ["HitLFWheel","HitLBWheel","HitLMWheel","HitRFWheel","HitRBWheel","HitRMWheel","HitLF2Wheel","HitLB2Wheel","HitRF2Wheel","HitRB2Wheel", "hitEngine"];
                        _unit setHitPointDamage ["HitBody", 0.3];
                        _unit setHitPointDamage ["HitFuel", 0.7];
                };
               if (_unit isKindOf "Tank") then {
                        {
                                _unit setHitPointDamage [_x, 1];
                        } forEach ["HitLTrack","HitRTrack","hitEngine"];
                        _unit setHitPointDamage ["HitHull", 0.2];
                };

                false;
        };
};