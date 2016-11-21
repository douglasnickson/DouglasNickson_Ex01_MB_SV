
//PEM - System Verilog: Modulo Básico
//Projeto: Atividade 01 - Contador 01
//Funcionamento: 0,1,2,..,13,14,15,15,14,13,...,1,0,0,1,2...
//Autor: Douglas Nickson Moura de Araujo

module Contador02 (clock, clear, s);

	//Definimos as entradas e saida do contador
	input logic clock, clear; 
	output logic[3:0] s;
	logic direction,d1,d2;
	
	//definimos em que momento sera realizado as operacoes
	always @(posedge clock or posedge clear)
		
		//Caso o clear esteva ativo reseta a saida
		if(clear) begin
			s = 4'd0;
			direction = 1'b0;
			d1 = 1'b1;
			d2 = 1'b0;
		end
		
		//Caso o clear esteja desativo realiza as operacoes
		else begin
			//Enquanto d1 estiver ativo realiza as operacoes
			if(d1) begin	
				if(direction)	
					s = s - 4'd1;
				else
					s = s + 4'd1;
				
				d2 = 1'b1;
				
			end
			else
				//Caso d1 esteja desativado ele repete o valor e ativa d1
				d1 = 1'b1;
			
			//Caso a saida seja 15 ou 0 e d2 esteja ativo realiza as operacoes
			if((s==4'd15 || s ==4'd0) && d2) begin
				direction = ~direction;
				d1 = 1'b0;
				d2 = 1'b0;
			end	
		end
		
endmodule
