# PS-controlled Accelerator for FFT
---
---
---
### Lab3
- Lab2: Create FFT Accelerator
- Lab3: Link C and FPGA(Bit Stream and FFT Acc.)
    ![lab3](./img/lab3.png)
  - 이때, 두 모듈을 연결할때 AXI 프로토콜을 따른다.(AXI Xbar)
#### AMBA AXi
- Bit Stream과 FFT Acc.를 연결해주는 소자
- 기본적인 코드는 제공하되 이에 대한 효율성을 개선하는 것이 Lab4

##### Data Flow
- 입력: AXI Xbar -> AW, W, B
- 출력: AXI Xbar -> AR, R
    ![dataflow](./img/axi_dataflow.png)

- FFT Acc.가 원하는 타이밍에 input을 읽고 output을 내보내기 위해선 기본적인 FFT 회로 구조를 이해하는 작업도 필요하다.

##### Instruction
- Xil_Out32 -> AXI에서 데이터를 쓴다.
    ```c
    void Xil_Out32(char *address, void *inputbuf)
    ```
    - FFT module -> uP Register -> DDR
- Xil_In32 -> AXI에 데이터를 가져온다.
    ```c
    void Xil_In32(char *address)
    ```
    - DDR -> uP Register -> FFT module

##### Key
- Input을 넣었을때 언제부터 Output이 들어오는지 알아보자