include("electrical_components.jl")

R = 1.0
C = 1.0
V = 1.0
@named resistor = Resistor(R=R)
@named capacitor = Capacitor(C=C)
@named source = ConstantVoltage(V=V)
@named ground = Ground()

rc_eqs = [
          connect_pins(source.p, resistor.p)
          connect_pins(resistor.n, capacitor.p)
          connect_pins(capacitor.n, source.n, ground.g)
         ]

@named rc_model = ODESystem(rc_eqs, t, systems=[resistor, capacitor, source, ground])
