# FiveM_Trains


To confirm that train is spawning at player location.
```
TrainCoords = GetEntityCoords(Train)
SetEntityCoords(GetPlayerPed(PlayerId()), TrainCoords.x,TrainCoords.y,TrainCoords.z+5,1,0,0,0)
```
After line 97 and see if it spawns you on the train
