// nodeproxy roles

// tomado del manual de SC
(
AbstractPlayControl.proxyControlClasses.put(\stream, PatternControl);
AbstractPlayControl.buildMethods.put(\stream,
    #{ arg pattern, proxy, channelOffset=0, index;
        Pbindf(
            pattern,
            \type, \bus,
            \id, Pfunc { proxy.group.nodeID },
            \array, Pkey(\value),
            \out, Pfunc { proxy.index }
        ).buildForProxy( proxy, channelOffset, index )
    });
)


// ejemplo:
// ~a = \stream -> Pbind(\value, Pseq([1, 2, 3], inf), \dur, 1.5).trace;
