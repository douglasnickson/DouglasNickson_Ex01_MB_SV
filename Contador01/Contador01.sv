
//PEM - System Verilog: Modulo Básico
//Projeto: Atividade 01 - Contador 01
//Funcionamento: 0,1,2..14,15,14,13..0,1,2...
//Autor: Douglas Nickson Moura de Araujo

module Contador01 (clock, clear, s);

	//Definimos as entradas e saida do contador
	input logic clock, clear; 
	output logic[3:0] s;
	logic direction;
	
	//Essa linha diz em que momento a operacao ira ocorrer
	always @(posedge clock or posedge clear)
		
		//Caso o clear seja ativado zera a saida e a direcao
		if(clear) begin
			s = 4'd0;
			direction = 1'b0;
		end
		
		//Caso o clear esteja desativado realiza as operacoes de soma ou subtracao
		else begin
			if(direction)
				s = s - 4'd1;
			else
				s = s + 4'd1;
			if(s==4'd15 || s ==4'd0)
				direction = ~direction;
		end
		
endmodule
