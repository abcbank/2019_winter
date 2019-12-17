///
/******************************************************************************
Copyright (c) 2017 SoC Design Laboratory, Konkuk University, South Korea
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met: redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer;
redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution;
neither the name of the copyright holders nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Authors: Jooho Wang (joohowang@konkuk.ac.kr)

Revision History
2017.11.14: Started by Jooho Wang
2019.05.27: Extended by Sunwoo Kim (AlexNet)
2019.11.26: Extended by Jooho Wang (Layer3 Accelerator)
2019.12.11: Modified by Youngho Seo (Rev3)
*******************************************************************************/

//Idle Run for weight data uploading
#define IDLING
#define TEST

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "xaxidma.h"

#include "parameter.h"
#include "functions.h"
#include "benchmarking.h"
#include "imgnet_10.h"
#include "class_labels.h"

////////////        Modified by Rev3       ////////////
//////////// Edit code below if necessary  ////////////

#define L_NUM 5;

// for dma
XAxiDma arrDMA[12];
static int DMA_Index[12] = {
XPAR_AXI_DMA_0_DEVICE_ID, XPAR_AXI_DMA_1_DEVICE_ID, XPAR_AXI_DMA_2_DEVICE_ID, 
XPAR_AXI_DMA_3_DEVICE_ID, XPAR_AXI_DMA_4_DEVICE_ID, XPAR_AXI_DMA_5_DEVICE_ID,
XPAR_AXI_DMA_6_DEVICE_ID, XPAR_AXI_DMA_7_DEVICE_ID, XPAR_AXI_DMA_8_DEVICE_ID,
XPAR_AXI_DMA_9_DEVICE_ID, XPAR_AXI_DMA_10_DEVICE_ID, XPAR_AXI_DMA_11_DEVICE_ID
};

#define DMA0 arrDMA
#define DMA1 arrDMA + 1
#define DMA2 arrDMA + 2
#define DMA3 arrDMA + 3
#define DMA4 arrDMA + 4
#define DMA5 arrDMA + 5
#define DMA6 arrDMA + 6
#define DMA7 arrDMA + 7
#define DMA8 arrDMA + 8
#define DMA9 arrDMA + 9
#define DMA10 arrDMA + 10
#define DMA11 arrDMA + 11

XAxiDma (*ifMapDMA)[4];
XAxiDma (*ofMapDMA)[4];
XAxiDma (*fMapDMA)[4];

#define DMA_NUM 12

// 

#define PP_STAGE 0
#define L2_OFMAPOUT_BASE  0x1B500000
#define L2_IFMAP_BASE     0x1B700000
#define L2_FMAP_BASE      0x1B900000

#define L3_OFMAPOUT_BASE  0x1BB00000
#define L3_IFMAP_BASE     0x1BD00000
#define L3_FMAP_BASE      0x1BF00000

#define L4_OFMAPOUT_BASE  0x1A100000
#define L4_IFMAP_BASE     0x1A300000
#define L4_FMAP_BASE      0x1A500000

#define L5_OFMAPOUT_BASE  0x1A700000
#define L5_IFMAP_BASE     0x1A900000
#define L5_FMAP_BASE      0x1AB00000
#include "convolution_G_hw.h"
#include "convolution_B_hw.h"
//////////// Edit code above if necessary  ////////////
///////////////////////////////////////////////////////

#define TEST_CASE 2
#define TEST_ROUNDS 3
double SW_TIME = 0;
double HW_TIME = 0;

#define L1_C 3
#define L2_C 96
#define L3_C 256
#define L4_C 384
#define L5_C 384
#define L1_M 96
#define L2_M 256
#define L3_M 384
#define L4_M 384
#define L5_M 256
#define L1_E 55
#define L2_E 27
#define L3_E 13
#define L4_E 13
#define L5_E 13
#define L1_F 55
#define L2_F 27
#define L3_F 13
#define L4_F 13
#define L5_F 13
#define L1_R 11
#define L2_R 5
#define L3_R 3
#define L4_R 3
#define L5_R 3
#define L1_S 11
#define L2_S 5
#define L3_S 3
#define L4_S 3
#define L5_S 3
#define L1_H 227
#define L2_H 31
#define L3_H 15
#define L4_H 15
#define L5_H 15
#define L1_W 227
#define L2_W 31
#define L3_W 15
#define L4_W 15
#define L5_W 15
#define L2_G 2
#define L4_G 2
#define L5_G 2
#define L1_MT 8
#define L2_MT 8
#define L3_MT 8
#define L4_MT 8
#define L5_MT 8
#define L1_CT 2
#define L2_CT 2
#define L3_CT 2
#define L4_CT 2
#define L5_CT 2
#define L1_ET 0
#define L2_ET 27
#define L3_ET 13
#define L4_ET 13
#define L5_ET 13
#define L1_FT 0
#define L2_FT 27
#define L3_FT 13
#define L4_FT 13
#define L5_FT 13

int C_layer[5] = {3	, 96 , 256, 384, 384};
int M_layer[5] = {96, 256, 384, 384, 256};
int E_layer[5] = {55, 27, 13, 13, 13};
int F_layer[5] = {55, 27, 13, 13, 13};
int R_layer[5] = {11, 5, 3, 3, 3};
int S_layer[5] = {11, 5, 3, 3, 3};
int H_layer[5] = {227, 31, 15, 15, 15};
int W_layer[5] = {227, 31, 15, 15, 15};
int G_layer[5] = {0, 2, 0, 2, 2};

int tileM_layer[5] = {8, 8, 8, 8, 8};
int tileC_layer[5] = {2, 2, 2, 2, 2};
int tileE_layer[5] = {0, 27, 13, 13, 13};
int tileF_layer[5] = {0, 27, 13, 13, 13};


#define MEMPOS_WEIGHTS 0x0C900000
float (*output_maps)[5] = 0;
float (*input_maps)[5] = 0;
float (*filter_maps)[5] = 0;
float *ifmap1 = 0;
float *ofmap1 = 0, *ofmap1_forSave = 0, *ofmap1l = 0, *ofmap1p = 0, *ofmap1pp = 0;
float *ofmap2 = 0, *ofmap2_forSave = 0, *ofmap2l = 0, *ofmap2p = 0, *ofmap2pp = 0;
float *ofmap3 = 0, *ofmap3_forSave = 0, *ofmap3p = 0;
float *ofmap4 = 0, *ofmap4_forSave = 0, *ofmap4p = 0;
float *ofmap5 = 0, *ofmap5_forSave = 0, *ofmap5p = 0;
float *ofmap6 = 0;
float *ofmap7 = 0;
float *ofmap8 = 0;

float *fmap1_tmp;
float *fmap1, *bias1, *fmap2, *bias2, *fmap3, *bias3, *fmap4, *bias4, *fmap5, *bias5;
float *fmap6, *bias6, *fmap7, *bias7, *fmap8, *bias8;

void conv_ref(){
	// Layer #1
	convolution_S(ofmap1, ifmap1, fmap1, M_C1, C_C1, F_C1, E_C1, R_C1, S_C1, H_C1, W_C1, U_C1, P_C1);
	bias(ofmap1, bias1, M_C1, E_C1, F_C1);
	relu(ofmap1, M_C1, E_C1, F_C1);
	LRN(ofmap1l, ofmap1, 5, 0.0001, 0.75, 1.0, M_C1, E_C1, F_C1);
	pooling(ofmap1p, ofmap1l, E_C1, F_C1, M_C1, E_P1, F_P1, K_P1, S_P1); //Pool #1
	paddata(ofmap1pp, ofmap1p, M_C1, E_P1, F_P1, P_C2); //zero padding added for standard convolution

	// Layer #2
	convolution_G(ofmap2, ofmap1pp, fmap2, M_C2, C_C2, F_C2, E_C2, R_C2, S_C2, H_C2, W_C2, 0, G_C2);
	bias(ofmap2, bias2, M_C2, E_C2, F_C2);
	relu(ofmap2, M_C2, E_C2, F_C2);
	LRN(ofmap2l, ofmap2, 5, 0.0001, 0.75, 1.0, M_C2, E_C2, F_C2);
	pooling(ofmap2p, ofmap2l, E_C2, F_C2, M_C2, E_P2, F_P2, K_P2, S_P2); //Pool #2
	paddata(ofmap2pp, ofmap2p, M_C2, E_P2, F_P2, P_C3); //zero padding added for standard convolution

	// Layer #3
	convolution_B(ofmap3, ofmap2pp, fmap3, M_C3, C_C3, F_C3, E_C3, R_C3, S_C3, H_C3, W_C3, 0);
	bias(ofmap3, bias3, M_C3, E_C3, F_C3);
	relu(ofmap3, M_C3, E_C3, F_C3);
	paddata(ofmap3p, ofmap3, M_C3, E_P3, E_P3, P_C4); //zero padding added for standard convolution

	// Layer #4
	convolution_G(ofmap4, ofmap3p, fmap4, M_C4, C_C4, F_C4, E_C4, R_C4, S_C4, H_C4, W_C4, 0, G_C4);
	bias(ofmap4, bias4, M_C4, E_C4, F_C4);
	relu(ofmap4, M_C4, E_C4, F_C4);
	paddata(ofmap4p, ofmap4, M_C3, E_P3, E_P3, P_C4); //zero padding added for standard convolution

	// Layer #5
	convolution_G(ofmap5, ofmap4p, fmap5, M_C5, C_C5, F_C5, E_C5, R_C5, S_C5, H_C5, W_C5, 0, G_C5);
	bias(ofmap5, bias5, M_C5, E_C5, F_C5);
	relu(ofmap5, M_C5, E_C5, F_C5);
	pooling(ofmap5p, ofmap5, E_C5, F_C5, M_C5, H_C6, W_C6, K_P3, S_P3); //Pool #3
}


void conv_hw(){
	int c = 0, m = 0, f = 0, e = 0, g = 0;
	int i = 0, j = 0, k = 0;
	int init_it_if = 0,init_it_f = 0;
	int tmp = 0;
	int EndFlag = 0;
	int oftmp = 0;
	int G_counter[5] = {0,0,0,0,0};
	int C_counter[5] = {0,0,0,0,0};
	int M_counter[5] = {0,0,0,0,0};
	int E_counter[5] = {0,0,0,0,0};
	int F_counter[5] = {0,0,0,0,0};
	int R_counter[5] = {0,0,0,0,0};
	int S_counter[5] = {0,0,0,0,0};
	int H_counter[5] = {0,0,0,0,0};
	int W_counter[5] = {0,0,0,0,0};
	int it_if[5] = {0,0,0,0,0};
	int it_ofo[5] ={0,0,0,0,0};
	/////////////////////////////////////
	/////////// Edit code below!!////////
	// init data for layers

	init_it_if = 0;
	for (g = 0; g < L2_G; g++){
		for (e = 0; e < L2_E; e += L2_ET){
			for (f = 0; f < L2_F; f += L2_FT){
				for (c = 0; c < L2_C/L2_G; c += L2_CT){
					for (i = (c + g*L2_C/L2_G); i < L2_CT+(c + g*L2_C/L2_G); i++){
						for (j = e; j < L2_R  + L2_ET - 1 + e; j++){
							for (k = f; k < L2_S  + L2_FT - 1 + f; k++){
								tmp = (L2_R + L2_ET - 1)*(L2_S + L2_FT - 1)*i+(L2_S + L2_FT - 1)*j+k;
								Xil_Out32(L2_IFMAP_BASE+sizeof(int)*init_it_if++,(int)(ofmap1pp[tmp] / pow(2, 3)));
							}
						}
					}
				}
			}
		}
	}

	init_it_f = 0;
	for (g = 0; g<L2_G; g++){
		for (m = 0; m < L2_M/L2_G; m += L2_MT){
			for (c = 0; c < L2_C/L2_G; c += L2_CT){
				for (i = m; i < L2_MT + m; i++){
					for (j = c; j < L2_CT + c; j++){
						for (k = 0; k < L2_R*L2_S; k++){
							tmp = g*L2_C/L2_G*L2_M/L2_G*L2_R*L2_S + L2_C/L2_G*L2_R*L2_S*i + L2_R*L2_S*j + k;
							Xil_Out32(L2_FMAP_BASE+sizeof(int)*init_it_f++,(int)(fmap2[tmp] * pow(2, 9)));
						}
					}
				}
			}
		}
	}
	
	Xil_DCacheFlushRange(L2_IFMAP_BASE, sizeof(int)*L2_H*L2_W*L2_C);
  	Xil_DCacheFlushRange(L2_FMAP_BASE, sizeof(int)*L2_R*L2_S*L2_C*L2_M);

	init_it_if = 0;
	for (e = 0; e < L3_E; e += L3_ET){
		for (f = 0; f < L3_F; f += L3_FT){
			for (c = 0; c < L3_C; c += L3_CT){
				for (i = c; i < L3_CT+c; i++)
				{
					for (j = e; j < L3_R  + L3_ET - 1 + e; j++)
					{
						for (k = f; k < L3_S  + L3_FT - 1 + f; k++)
						{
							tmp = (L3_R + L3_ET - 1)*(L3_S + L3_FT - 1)*i+(L3_S + L3_FT - 1)*j+k;
							Xil_Out32(L3_IFMAP_BASE+sizeof(int)*init_it_if++,(int)(ofmap2pp[tmp] / pow(2, 3)));
						}
					}
				}
			}
		}
	}

	//fmap setting
	init_it_f = 0;
	for (m = 0; m < L3_M; m += L3_MT)
	{
		for (c = 0; c < L3_C; c += L3_CT)
		{
			for (i = m; i < L3_MT + m; i++)
			{
				for (j = c; j < L3_CT + c; j++)
				{
					for (k = 0; k < L3_R * L3_S ; k++)
					{
						tmp = (L3_C)*(L3_R * L3_S)*i+(L3_R * L3_S)*j+k;
						Xil_Out32(L3_FMAP_BASE+sizeof(int)*init_it_f++,(int)(fmap3[tmp]*pow(2, 9))) ;
					}
				}
			}
		}
	}

	///////////// D cacheFulsh //////////////

	Xil_DCacheFlushRange(L3_IFMAP_BASE, sizeof(int)*L3_H*L3_W*L3_C);
	Xil_DCacheFlushRange(L3_FMAP_BASE, sizeof(int)*L3_R*L3_S*L3_C*L3_M);


	
	init_it_if = 0;
	for (g = 0; g < L4_G; g++){
		for (e = 0; e < L4_E; e += L4_ET){
			for (f = 0; f < L4_F; f += L4_FT){
				for (c = 0; c < L4_C/L4_G; c += L4_CT){
					for (i = (c + g*L4_C/L4_G); i < L4_CT+(c + g*L4_C/L4_G); i++){
						for (j = e; j < L4_R  + L4_ET - 1 + e; j++){
							for (k = f; k < L4_S  + L4_FT - 1 + f; k++){
								tmp = (L4_R + L4_ET - 1)*(L4_S + L4_FT - 1)*i+(L4_S + L4_FT - 1)*j+k;
								Xil_Out32(L4_IFMAP_BASE+sizeof(int)*init_it_if++,(int)(ofmap3p[tmp] / pow(2, 3)));
							}
						}
					}
				}
			}
		}
	}

	init_it_f = 0;
	for (g = 0; g<L4_G; g++){
		for (m = 0; m < L4_M/L4_G; m += L4_MT){
			for (c = 0; c < L4_C/L4_G; c += L4_CT){
				for (i = m; i < L4_MT + m; i++){
					for (j = c; j < L4_CT + c; j++){
						for (k = 0; k < L4_R*L4_S; k++){
							tmp = g*L4_C/L4_G*L4_M/L4_G*L4_R*L4_S + L4_C/L4_G*L4_R*L4_S*i + L4_R*L4_S*j + k;
							Xil_Out32(L4_FMAP_BASE+sizeof(int)*init_it_f++,(int)(fmap4[tmp] * pow(2, 9)));
						}
					}
				}
			}
		}
	}
	
	Xil_DCacheFlushRange(IFMAP_BASE, sizeof(int)*L2_H*L2_W*L2_C);
  	Xil_DCacheFlushRange(FMAP_BASE, sizeof(int)*L2_R*L2_S*L2_C*L2_M);


	init_it_if = 0;
	for (g = 0; g < L5_G; g++){
		for (e = 0; e < L5_E; e += L5_ET){
			for (f = 0; f < L5_F; f += L5_FT){
				for (c = 0; c < L5_C/L5_G; c += L5_CT){
					for (i = (c + g*L5_C/L5_G); i < L5_CT+(c + g*L5_C/L5_G); i++){
						for (j = e; j < L5_R  + L5_ET - 1 + e; j++){
							for (k = f; k < L5_S  + L5_FT - 1 + f; k++){
								tmp = (L5_R + L5_ET - 1)*(L5_S + L5_FT - 1)*i+(L5_S + L5_FT - 1)*j+k;
								Xil_Out32(L5_IFMAP_BASE+sizeof(int)*init_it_if++,(int)(ofmap4p[tmp] / pow(2, 3)));
							}
						}
					}
				}
			}
		}
	}

	init_it_f = 0;
	for (g = 0; g<L5_G; g++){
		for (m = 0; m < L5_M/L5_G; m += L5_MT){
			for (c = 0; c < L5_C/L5_G; c += L5_CT){
				for (i = m; i < L5_MT + m; i++){
					for (j = c; j < L5_CT + c; j++){
						for (k = 0; k < L5_R*L5_S; k++){
							tmp = g*L5_C/L5_G*L5_M/L5_G*L5_R*L5_S + L5_C/L5_G*L5_R*L5_S*i + L5_R*L5_S*j + k;
							Xil_Out32(L5_FMAP_BASE+sizeof(int)*init_it_f++,(int)(fmap5[tmp] * pow(2, 9)));
						}
					}
				}
			}
		}
	}
	
	Xil_DCacheFlushRange(L5_IFMAP_BASE, sizeof(int)*L5_H*L5_W*L5_C);
  	Xil_DCacheFlushRange(L5_FMAP_BASE, sizeof(int)*L5_R*L5_S*L5_C*L5_M);

#ifndef TEST
			XAxiDma_Config *CfgPtr;
			int Status;
			// Initialize the XAxiDma device.
			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 1, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 1, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 1, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_2_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 2, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 2, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 2, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_3_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 3, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 3, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 3, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_4_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 4, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 4, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 4, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_5_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 5, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 5, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 5, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_6_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 6, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 6, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 6, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_7_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 7, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 7, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 7, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_8_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 8, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 8, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 8, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_9_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 9, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 9, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 9, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_10_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 10, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 10, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 10, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_11_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 11, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 11, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 11, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);
#endif

	// push data in DMA
	while(1){
		// todo: optimization order
		// pipe line architecture convolution_B in Layer 3
		if(!XAxiDma_Busy(DMA0, XAXIDMA_DMA_TO_DEVICE) && !XAxiDma_Busy(DMA1, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 1 != 1){
			if(G_counter[1] < L2_G){
				// if(E_counter[1] < L2_E){
				// 	if(F_counter[1] < L2_F){
				if(M_counter[1] < (G_counter[1] + 1)*L2_M/L2_G){
					if(C_counter[1] <(G_counter[1] + 1)* L2_C/ L2_G){

						DMA_TADDR_setup(DMA0, L2_IFMAP_BASE+(L2_ET+L2_R-1)*(L2_FT+L2_S-1)*L2_CT*sizeof(int)*it_if[1]);
						DMA_write(DMA0, (L2_ET+L2_R-1)*(L2_FT+L2_S-1)*L2_CT*sizeof(int));

						DMA_TADDR_setup(DMA1, L2_FMAP_BASE+(L2_MT*L2_CT*L2_R*L2_S*sizeof(int)*it_f[1]));
						DMA_write(DMA1, L2_MT*L2_CT*L2_R*L2_S*sizeof(int));

						it_if[1]++;
						it_f[1]++;
						C_counter[1] += L2_CT;
					}
					else{
						M_counter[1] += L2_MT;
						C_counter[1] = G_counter[1]* L2_C/ L2_G;
						it_if[1] = G_counter[1] ? 0 : (L2_C / L2_G)/L2_CT;
					}
				}
				else{
					G_counter[1]++;
					M_counter[1] = G_counter[1]*L2_M/L2_G;
				// 			F_counter[1] += L2_FT;
				// 		}
				// 	}
				// 	else{
				// 		F_counter[1] = 0;
				// 		E_counter[1] += L2_ET;
				// 	}
				// }
				// else{
				// 	E_counter[1] = 0;
				}
			}
			else{
				M_counter[1]= 0;
				EndFlag |= 1;
			}
		}


		if(!XAxiDma_Busy(DMA3, XAXIDMA_DMA_TO_DEVICE) && !XAxiDma_Busy(DMA4, XAXIDMA_DMA_TO_DEVICE && EndFlag & 2 != 1)){
			if(E_counter[2] < L3_E){
				if(F_counter[2] < L3_F){
					if(M_counter[2] < L3_M){
						if(C_counter[2] < L3_C){
								DMA_TADDR_setup(DMA3, L3_IFMAP_BASE+(L3_ET+L3_R-1)*(L3_FT+L3_S-1)*L3_CT*sizeof(int)*it_if[2]);
								DMA_write(DMA3, (L3_ET+L3_R-1)*(L3_FT+L3_S-1)*L3_CT*sizeof(int));
								DMA_TADDR_setup(DMA4, L3_FMAP_BASE+(L3_MT*L3_CT*L3_R*L3_S*sizeof(int)*it_f[2]));
								DMA_write(DMA4, L3_MT*L3_CT*L3_R*L3_S*sizeof(int));
									
								it_if[2]++;
								it_f[2]++;
								C_counter[2] += L3_CT;
								
						}
						else{
							M_counter[2] += L3_MT;
							C_counter[2] = 0;
							it_if[2] = 0;
						}
					}
					else{
						F_counter[2] += L3_FT;
						M_counter[2] = 0;
					}
				}
				else{
					E_counter[2] += L3_ET;
					F_counter[2] = 0;
				}
			}
			else{
				M_counter[2] = 0;
				EndFlag |= 2;
			}
		}

		if(!XAxiDma_Busy(DMA6, XAXIDMA_DMA_TO_DEVICE) && !XAxiDma_Busy(DMA7, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 4 != 1){
			if(G_counter[3] < L4_G){
				// if(E_counter[3] < L4_E){
				// 	if(F_counter[3] < L4_F){
				if(M_counter[3] < (G_counter[3] + 1) * L4_M/L4_G){
					if(C_counter[3] < (G_counter[3] + 1)*L4_C / L4_H){
						DMA_TADDR_setup(DMA6, L4_IFMAP_BASE+(L4_ET+L4_R-1)*(L4_FT+L4_S-1)*L4_C*sizeof(int)*it_if[3]);
						DMA_write(DMA6, (L4_ET+L4_R-1)*(L4_FT+L4_S-1)*L4_CT*sizeof(int));

						DMA_TADDR_setup(DMA7, L4_FMAP_BASE+(L4_MT*L4_CT*L4_R*L4_S*sizeof(int)*it_f[3]));
						DMA_write(DMA7, L4_MT*L4_CT*L4_R*L4_S*sizeof(int));

						it_if[3]++;
						it_f[3]++;
						C_counter[3] += L4_CT;
					}
					else{
						M_counter[3] += L4_MT;
						C_counter[3] = G_counter[3] * L4_C /L4_G;
						it_if[3] = G_counter[3] ? 0 : (L4_C / L4_G)/L4_CT;
					}
				}
				else{
					G_counter[3]++;
					M_counter[3] = G_counter[3] * L4_M /L4_G;
				// 			F_counter[3] += L4_FT;
				// 		}
				// 	}
				// 	else{
				// 		F_counter[3] = 0;
				// 		E_counter[3]+=L4_ET;
				// 	}
				// }
				// else{
				// 	E_counter[3] = 0;
				}
			}
			else{
				EndFlag |= 4;
				M_counter[3] = 0;
			}
		}

		if(!XAxiDma_Busy(DMA9, XAXIDMA_DMA_TO_DEVICE) && !XAxiDma_Busy(DMA10, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 8 != 1){
			if(G_counter[4] < L5_G){
				// if(E_counter[4] < L5_E){
				// 	if(F_counter[4] < L5_F){
				if(M_counter[4] < (G_counter[4] + 1)*L5_M / L5_G){
					if(C_counter[4] < (G_counter[4] + 1)*L5_C / L5_G){
						DMA_TADDR_setup(DMA9, L5_IFMAP_BASE+(L5_ET+L5_R-1)*(L5_FT+L5_S-1)*L5_CT*sizeof(int)*it_if[4]);
						DMA_write(DMA9, (L5_ET+L5_R-1)*(L5_FT+L5_S-1)*L5_CT*sizeof(int));

						DMA_TADDR_setup(DMA10, L5_FMAP_BASE+(L5_MT*L5_CT*L5_R*L5_S*sizeof(int)*it_f[4]));
						DMA_write(DMA10, L5_MT*L5_CT*L5_R*L5_S*sizeof(int));

						it_if[4]++;
						it_f[4]++;
						C_counter[4] += L5_CT;
					}
					else{
						C_counter[4] = G_counter[4] * L5_C / L5_G;
						M_counter[4] += L5_MT;							
						it_if[4] = G_counter[4] ? 0 : (L5_C / L5_G)/L5_CT;
					}
				}
				else{
					G_counter[4]++;
					M_counter[4] = G_counter[4] * L5_M / L5_G;
				// 			F_counter[4] += L5_FT;
				// 		}
				// 	}
				// 	else{
				// 		F_counter[4] = 0;
				// 		E_counter[4]+=L5_ET;
				// 	}
				// }
				// else{
				// 	E_counter[4] = 0;
				}
			}
			else{
				EndFlag |= 8;
				M_counter[4] = 0;
			}
		}

		if(EndFlag == 0b1111){
			break;
		}
	}

	// calculate layer 1
	convolution_S(ofmap1, ifmap1, fmap1, M_C1, C_C1, F_C1, E_C1, R_C1, S_C1, H_C1, W_C1, U_C1, P_C1);
	bias(ofmap1, bias1, M_C1, E_C1, F_C1);
	relu(ofmap1, M_C1, E_C1, F_C1);
	LRN(ofmap1l, ofmap1, 5, 0.0001, 0.75, 1.0, M_C1, E_C1, F_C1);
	pooling(ofmap1p, ofmap1l, E_C1, F_C1, M_C1, E_P1, F_P1, K_P1, S_P1); //Pool #1
	paddata(ofmap1pp, ofmap1p, M_C1, E_P1, F_P1, P_C2); //zero padding added for standard convolution

	EndFlag = 0;

	while(1){
		if(!XAxiDma_Busy(DMA2, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 1 != 1){
			if(M_counter[1] < L2_M){

				DMA_RADDR_setup(DMA2, L2_OFMAPOUT_BASE+(L2_ET*L2_FT)*L2_MT*sizeof(int)*it_ofo2);
				DMA_read(DMA2, L2_ET*L2_FT*L2_MT * sizeof(int));

				M_counter[1] += L2_MT;
				it_ofo[1]++;
			}
			else{
				EndFlag |= 1;
			}
		}

		if(!XAxiDma_Busy(DMA5, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 2 != 1){
			if(M_counter[2] < L3_M){

				DMA_RADDR_setup(DMA2, L3_OFMAPOUT_BASE+(L3_ET*L3_FT)*L3_MT*sizeof(int)*it_ofo[2]);
				DMA_read(DMA2, L3_ET*L3_FT*L3_MT * sizeof(int));

				M_counter[2] += L3_MT;
				it_ofo[2]++;
			}
			else{
				EndFlag |= 1;
			}
		}

		if(!XAxiDma_Busy(DMA8, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 4 != 1){
			if(M_counter[3] < L4_M){

				DMA_RADDR_setup(DMA8, L4_OFMAPOUT_BASE+(L4_ET*L4_FT)*L4_MT*sizeof(int)*it_ofo2[3]);
				DMA_read(DMA2, L4_ET*L4_FT*L4_MT * sizeof(int));

				M_counter[3] += L4_MT;
				it_ofo[3]++;
			}
			else{
				EndFlag |= 4;
			}
		}

		if(!XAxiDma_Busy(DMA11, XAXIDMA_DMA_TO_DEVICE) && EndFlag & 8 != 1){
			if(M_counter[4] < L5_M){

				DMA_RADDR_setup(DMA11, L5_OFMAPOUT_BASE+(L5_ET*L5_FT)*L5_MT*sizeof(int)*it_ofo2[4]);
				DMA_read(DMA11, L5_ET*L5_FT*L5_MT * sizeof(int));

				M_counter[4] += L5_MT;
				it_ofo[4]++;
			}
			else{
				EndFlag |= 8;
			}
		}

		if(EndFlag == 0b1111)
			break;
	}

	Xil_DCacheInvalidateRange(L2_OFMAPOUT_BASE, (L2_ET*L2_FT*L2_M)*sizeof(int));

	it_ofo=0;

	for (g = 0; g<L2_G; g++)
	{
		// for (e = 0; e < L2_E; e += L2_ET)
		// {
		// 	for (f = 0; f < L2_F; f += L2_FT)
		// 	{
				for (m = 0; m < L2_M/L2_G; m += L2_M)
				{
					for (i = (L2_M+g*L2_M/L2_G); i < L2_MT+(m+g*L2_M/L2_G); i++)
					{
						for (j = e; j < L2_ET+e; j++)
						{
							for (k = f; k < L2_FT+f; k++)
							{
								tmp_ofmap = Xil_In16(L2_OFMAPOUT_BASE+sizeof(int)*(it_ofo));
								ofmap2[i*L2_E *L2_F + j*L1_F  + k] = (float)(tmp_ofmap / pow(2, 6));
								it_ofo++;
							}
						}
					}
			// 	}
			// }
		}
	}

		// Layer #2
	bias(ofmap2, bias2, M_C2, E_C2, F_C2);
	relu(ofmap2, M_C2, E_C2, F_C2);
	LRN(ofmap2l, ofmap2, 5, 0.0001, 0.75, 1.0, M_C2, E_C2, F_C2);
	pooling(ofmap2p, ofmap2l, E_C2, F_C2, M_C2, E_P2, F_P2, K_P2, S_P2); //Pool #2
	paddata(ofmap2pp, ofmap2p, M_C2, E_P2, F_P2, P_C3); //zero padding added for standard convolution

	Xil_DCacheInvalidateRange(L2_OFMAPOUT_BASE, (L2_ET*L2_FT*L2_M)*sizeof(int));

	it_ofo=0;

	for (e = 0; e < L3_E; e += L3_ET)
	{
		for (f = 0; f < L3_F; f += L3_FT)
		{
			for (m = 0; m < L3_M; m += L3_MT)
			{
				for (i = m; i < L3_MT+m; i++)
				{
					for (j = e; j < L3_ET+e; j++)
					{
						for (k = f; k < L3_FT+f; k++)
						{
							oftmp = Xil_In16(L3_OFMAPOUT_BASE+sizeof(int)*(it_ofo));
							ofmap3[i*L3_E *L3_F  + j*L3_F  + k] = (float) (oftmp / pow(2,6));
							it_ofo++;
						}
					}
				}
			}
		}
	}	

	

	// Layer #3
	bias(ofmap3, bias3, M_C3, E_C3, F_C3);
	relu(ofmap3, M_C3, E_C3, F_C3);
	paddata(ofmap3p, ofmap3, M_C3, E_P3, E_P3, P_C4); //zero padding added for standard convolution
	
	Xil_DCacheInvalidateRange(L2_OFMAPOUT_BASE, (L2_ET*L2_FT*L2_M)*sizeof(int));

	it_ofo=0;

	for (g = 0; g<L3_G; g++)
	{
		// for (e = 0; e < L2_E; e += L2_ET)
		// {
		// 	for (f = 0; f < L2_F; f += L2_FT)
		// 	{
				for (m = 0; m < L4_M/L4_G; m += L4_M)
				{
					for (i = (L4_M+g*L4_M/L4_G); i < L4_MT+(m+g*L4_M/L4_G); i++)
					{
						for (j = e; j < L4_ET+e; j++)
						{
							for (k = f; k < L4_FT+f; k++)
							{
								tmp_ofmap = Xil_In16(L3_OFMAPOUT_BASE+sizeof(int)*(it_ofo));
								ofmap4[i*L4_E*L4_F  + j*L4_F  + k] = (float)(tmp_ofmap / pow(2, 6));
								it_ofo++;
							}
						}
					}
			// 	}
			// }
		}
	}
	// Layer #4
	bias(ofmap4, bias4, M_C4, E_C4, F_C4);
	relu(ofmap4, M_C4, E_C4, F_C4);
	paddata(ofmap4p, ofmap4, M_C3, E_P3, E_P3, P_C4); //zero padding added for standard convolution

	Xil_DCacheInvalidateRange(L2_OFMAPOUT_BASE, (L2_ET*L2_FT*L2_M)*sizeof(int));

	it_ofo=0;

	for (g = 0; g<L2_G; g++)
	{
		// for (e = 0; e < L2_E; e += L2_ET)
		// {
		// 	for (f = 0; f < L2_F; f += L2_FT)
		// 	{
				for (m = 0; m < L2_M/L2_G; m += L2_M)
				{
					for (i = (L2_M+g*L2_M/L2_G); i < L2_MT+(m+g*L2_M/L2_G); i++)
					{
						for (j = e; j < L2_ET+e; j++)
						{
							for (k = f; k < L2_FT+f; k++)
							{
								tmp_ofmap = Xil_In16(L5_OFMAPOUT_BASE+sizeof(int)*(it_ofo));
								ofmap5[i*L5_E*L5_F  + j*L5_F  + k] = (float)(tmp_ofmap / pow(2, 6));
								it_ofo++;
							}
						}
					}
			// 	}
			// }
		}
	}

	// Layer #5
	bias(ofmap5, bias5, M_C5, E_C5, F_C5);
	relu(ofmap5, M_C5, E_C5, F_C5);
	pooling(ofmap5p, ofmap5, E_C5, F_C5, M_C5, H_C6, W_C6, K_P3, S_P3); //Pool #3


	//////////Edit code above!!/////////
	////////////////////////////////////
}

void fc(){
	// Layer #6
	convolution_B(ofmap6, ofmap5p, fmap6, M_C6, C_C6, F_C6, E_C6, R_C6, S_C6, H_C6, W_C6, P_C6);
	bias(ofmap6, bias6, M_C6, E_C6, F_C6);
	relu(ofmap6, M_C6, E_C6, F_C6);

	// Layer #7
	convolution_B(ofmap7, ofmap6, fmap7, M_C7, C_C7, F_C7, E_C7, R_C7, S_C7, H_C7, W_C7, P_C7);
	bias(ofmap7, bias7, M_C7, E_C7, F_C7);
	relu(ofmap7, M_C7, E_C7, F_C7);

	// Layer #8
	convolution_B(ofmap8, ofmap7, fmap8, M_C8, C_C8, F_C8, E_C8, R_C8, S_C8, H_C8, W_C8, P_C8);
	bias(ofmap8, bias8, M_C8, E_C8, F_C8);
}

unsigned int initializor_dummy()
{
	return 1;
}

unsigned int validator_dummy()
{
	return 1;
}

int main()
{

#ifndef IDLING
	int data_set = 0;
	int mode_sel = 0;
	int i = 0, ii = 0, kk = 0;
	float lval; int lidx;

	float reference[_data][_class] = {{0,},};
	float optimization[_data+PP_STAGE][_class] = {{0,},}; //Modified by Rev3
	float error  = 0;
	float signal = 0;
	float NSRdB = 0;
	

	
	//Do not edit here.
	//////////////Modified by Rev3/////////////
	BENCHMARK_CASE *pBenchmarkCase;
	BENCHMARK_STATISTICS    *pStat;
	BENCHMARK_CASE BenchmarkCases[TEST_CASE] = {
		{"Reference",    1, initializor_dummy, conv_ref, 0, validator_dummy},
		{"Optimization", 1, initializor_dummy, conv_hw,  0, validator_dummy}
	};
	///////////////////////////////////////////

	xil_printf("If the message stops here, please retry \"RUN\".\r\n");

	fmap1 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C1*4);
	fmap2 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C2*4);
	fmap3 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C3*4);
	fmap4 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C4*4);
	fmap5 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C5*4);
	fmap6 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C6*4);
	fmap7 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C7*4);
	fmap8 = (float*) (MEMPOS_WEIGHTS + MEMPOS_C8*4);

	bias1 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B1*4);
	bias2 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B2*4);
	bias3 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B3*4);
	bias4 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B4*4);
	bias5 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B5*4);
	bias6 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B6*4);
	bias7 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B7*4);
	bias8 = (float*) (MEMPOS_WEIGHTS + MEMPOS_B8*4);

	for (mode_sel = 0; mode_sel<_mode; mode_sel++){

		//////////////Modified by Rev3/////////////
		pBenchmarkCase = &BenchmarkCases[mode_sel];
		pStat = &(pBenchmarkCase->stat);
		statistics_init(pStat);
		///////////////////////////////////////////
		printf("\r\n");

		if(mode_sel == 0)
		  printf("Case 0: Reference \r\n");
		else
		  printf("Case 1: Optimization \r\n");

		for (data_set = 0; data_set<((PP_STAGE*mode_sel)+_data); data_set++){  //Modified by Rev3

			ifmap1 = (float *)calloc(H_C1*W_C1*C_C1,sizeof(float));

			///////////////////////////////////////////////////////
			//////////// Edit code below if necessary  ////////////
			ofmap1 = (float *)calloc(E_C1*F_C1*M_C1,sizeof(float));
			ofmap1l= (float *)calloc(E_C1*F_C1*M_C1,sizeof(float));
			ofmap1p= (float *)calloc(E_P1*F_P1*M_C1,sizeof(float));
			ofmap1pp=(float *)calloc(H_C2*W_C2*M_C1,sizeof(float));
			ofmap2 = (float *)calloc(E_C2*F_C2*M_C2,sizeof(float));
			ofmap2l= (float *)calloc(E_C2*F_C2*M_C2,sizeof(float));
			ofmap2p= (float *)calloc(E_P2*F_P2*M_C2,sizeof(float));
			ofmap2pp=(float *)calloc(H_C3*W_C3*M_C2,sizeof(float));
			ofmap3 = (float *)calloc(E_C3*F_C3*M_C3,sizeof(float));
			ofmap3p= (float *)calloc(H_C3*W_C3*M_C3,sizeof(float));
			ofmap4 = (float *)calloc(E_C4*F_C4*M_C4,sizeof(float));
			ofmap4p= (float *)calloc(H_C5*W_C5*M_C4,sizeof(float));
			ofmap5 = (float *)calloc(E_C5*F_C5*M_C5,sizeof(float));
			ofmap5p= (float *)calloc(H_C6*W_C6*M_C5,sizeof(float));
			ofmap6 = (float *)calloc(E_C6*F_C6*M_C6,sizeof(float));
			ofmap7 = (float *)calloc(E_C7*F_C7*M_C7,sizeof(float));

#ifdef TEST
			XAxiDma_Config *CfgPtr;
			int Status;
			// Initialize the XAxiDma device.
			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_1_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 1, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 1, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 1, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_2_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 2, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 2, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 2, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_3_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 3, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 3, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 3, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_4_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 4, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 4, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 4, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_5_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 5, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 5, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 5, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_6_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 6, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 6, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 6, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_7_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 7, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 7, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 7, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_8_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 8, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 8, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 8, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_9_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 9, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 9, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 9, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_10_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 10, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 10, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 10, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);

			CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_11_DEVICE_ID);
			Status = XAxiDma_CfgInitialize(arrDMA + 11, CfgPtr);
			// Disable interrupts, we use polling mode
			XAxiDma_IntrDisable(arrDMA + 11, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DEVICE_TO_DMA);
			XAxiDma_IntrDisable(arrDMA + 11, XAXIDMA_IRQ_ALL_MASK,
			XAXIDMA_DMA_TO_DEVICE);
#endif


			//////////// Edit code above if necessary  ////////////
			///////////////////////////////////////////////////////

			ofmap8 = (float *)calloc(E_C8*F_C8*M_C8,sizeof(float));

			//Input mapping
			for (i = 0; i<H_C1*W_C1*C_C1; i++){
			 ifmap1[i] = input_image[data_set][i];
			}

			//Convolution Layer
			run_benchmark_single(pBenchmarkCase); //Modified by Rev3

			//Fully-Connected Layer
			fc();

			lval = -100; lidx = 0;
			for (int idx = 0; idx < _class; idx++){
				if (ofmap8[idx] > lval){
					lval = ofmap8[idx];
					lidx = idx;
				}
			}

			printf("Image %1d: %3d (%2.5f) %s \r\n",data_set, lidx, lval, label[lidx]);

			for(int ii=0;ii<_class;ii++){
				if(mode_sel == 0)
					reference[data_set][ii] = ofmap8[ii];
				else
					optimization[data_set][ii] = ofmap8[ii];
			}

			free(ifmap1 );

			///////////////////////////////////////////////////////
			//////////// Edit code below if necessary  ////////////
			free(ofmap1 );
			free(ofmap1l);
			free(ofmap1p);
			free(ofmap1pp);
			free(ofmap2 );
			free(ofmap2l);
			free(ofmap2p);
			free(ofmap2pp);
			free(ofmap3 );
			free(ofmap3p);
			free(ofmap4 );
			free(ofmap4p);
			free(ofmap5 );
			free(ofmap5p);
			free(ofmap6 );
			free(ofmap7 );
			//////////// Edit code above if necessary  ////////////
			///////////////////////////////////////////////////////

			free(ofmap8 );
		}


		// Measure Accuracy (Quantization error)
		xil_printf("\r\n");

		if (mode_sel == 1)
		{
			for (ii = 0; ii<_data; ii++){
				for (kk = 0; kk<_class; kk++){
					error += pow((reference[ii][kk] - optimization[ii+PP_STAGE][kk]),2); //Modified by Rev3
					signal+= pow((reference[ii][kk]),2); 
				}
			}
			NSRdB = 10*log10(error/signal);
			printf("Measured Accuracy: NSR(dB) = %0.3f \r\n", NSRdB);
		}
	}

	//Do not edit here.
	xil_printf("\r\n");
	xil_printf("-----Benchmarking Start-----\r\n");
	for(i=0;i<TEST_CASE;i++)
	{
		pBenchmarkCase = &BenchmarkCases[i];
		pStat = &(pBenchmarkCase->stat);
		printf("Case %d: %s time duration\r\n", i, pBenchmarkCase->pName);
		//run_benchmark_single(pBenchmarkCase);
		statistics_print(pStat);

		if (i == 0)
			SW_TIME = pStat->ullTotal;
		else
			HW_TIME = pStat->ullTotal;
	}
	xil_printf("----Benchmarking Complete----\r\n");

	xil_printf("\r\n");
	printf("Accelerator is x%.2f faster than '-O3' SW \r\n", (double)(SW_TIME/HW_TIME));
	xil_printf("\r\n");

#else
	xil_printf("Dry run for file restore\r\n");
#endif

	return 0;
}
