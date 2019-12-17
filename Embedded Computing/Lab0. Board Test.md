# Lab0. Board Test
---
---
---
## Target platform/board
- Xilinx ZYNQ
  - HW: Vivado Design Suites - Verilog
  - SW: Eclipse IDE-based Software Development Kit(SDK) - C
    - Access Latency(CPU Cycle)
      - L1$: 1 cycle(32KB) - $ size: 8 byte
      - L2$: 25 cycles(512KB)
      - OCM: 20 cycles(256KB)
      - DDR: 67 cycles(512KB)
      - PL: 86 cycles
      - IOP: 122 cycles(570KB)
    - Address Range: Lab0i p.19

- Zybo Z7

## Lab0. Board Test
- UART를 사용해 컴퓨터와 컴퓨터를 연결하기

- Vivado(0w 6 ~ 26)
  1. Launch Vivado
  2. Create IP block(IP integrator)
  3. Configuration PS settings
  4. Add IP
  5. Add Top-L7evel HDL
  6. Add Constraints file
  7. Add Generate Bitstream
  8. Export hardware to SDK
- SDK(0w 27 ~ )
  1. Specify hardware built from Vivado
  2. Add software project & build
  3. Program bitstream

- Address Map & Section Map
  - 참고하도록 하자. -> $ 위주로 코딩