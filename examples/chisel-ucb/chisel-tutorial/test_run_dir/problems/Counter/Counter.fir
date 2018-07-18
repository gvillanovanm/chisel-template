;buildInfoPackage: chisel3, version: 3.1.1, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-06-21 18:49:36.391, builtAtMillis: 1529606976391
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inc : UInt<1>, flip amt : UInt<4>, tot : UInt<8>}
    
    reg _T_14 : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Counter.scala 19:20]
    node _T_16 = add(_T_14, UInt<1>("h01")) @[Counter.scala 20:23]
    node _T_17 = tail(_T_16, 1) @[Counter.scala 20:23]
    node _T_18 = gt(_T_17, UInt<8>("h0ff")) @[Counter.scala 15:11]
    node _T_20 = mux(_T_18, UInt<1>("h00"), _T_17) @[Counter.scala 15:8]
    _T_14 <= _T_20 @[Counter.scala 20:7]
    io.tot <= _T_14 @[Counter.scala 34:10]
    
