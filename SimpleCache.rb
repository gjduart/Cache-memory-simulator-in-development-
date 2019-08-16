#==================================================================
#       @Author: Gabriel Duarte
#       
#
#=================================================================

#Funcao para converter Hexadecimal para Binario
def HexaParaBin(input)
    hex = input.to_i(16)
    bin =  hex.to_s(2)
    return bin
end

#Converter Hexa para Decimal
def HexaParaDec(input)
		dec = input.to_i(16)
		return dec
end




puts "=============================="
puts "Simulador de Memoria Cache"
puts "=============================="
puts 

#Valores Iniciais (a Serem substituidos por Scans)
puts "Insira o Tamanho da Cache"
tamanho_cache       = gets.to_i
tamLinhaCache       = 16
set_line	    = 4
enderecoMemoria     = 32
politicaDeSubs      = 0
unidadedeTamanho    = 10



#Prints
puts "======================================================="
puts "Tamanho da Cache: " + tamanho_cache.to_s 
puts "Tamanho de Linhas da Cache: " + tamLinhaCache.to_s
puts "Linhas por Conjunto: " + set_line.to_s 

#Calculo Para saber o Numero de linhas e o Tamanho do Conjunto
numeroDeLinhasCache    = (tamanho_cache*2**unidadedeTamanho/tamLinhaCache).to_i 
tamanho_Conjunto_Cache = tamLinhaCache * set_line
puts "Tamanho do Conjunto da Cache: " + tamanho_Conjunto_Cache.to_s
puts "======================================================="
puts

#Calculo de quantidade de bits dos Campos de Formato da Cache
offsetBits = (Math.log(tamLinhaCache,2)).to_i
indexBits  = (Math.log(numeroDeLinhasCache,2)).to_i
tagBits    = enderecoMemoria - indexBits - offsetBits

#Print Dos Formatos de Tag , Index e offset
puts "Formato da Cache :"
print "Tag: " + tagBits.to_s + " Index: " + indexBits.to_s + " offset: " + offsetBits.to_s
puts

#Variaveis de Controle
hitDireto  = 0   #numero de Acertos da Memoria Cache
missDireto = 0   #Numero de Perca da Memoria Cache
hitAssociativoConj  = 0
missAssociativoConj = 0
time_stamp = 0
mem_req = 0       #Requisição da Memoria


class CacheLine
  		valida = 1.to_i
  		tag    = 0.to_i
    		ultimo_acesso = 0.to_i
   		nrAcesso = 0.to_i

		attr_reader :valida, :tag, :ultimo_acesso, :nrAcesso  
		attr_writer :valida, :tag, :ultimo_acesso,  :nrAcesso 

end


cache = []#Para Mapeamento DIRETO 
b = []


#Para Mapeamento DIRETO
for i in 0..numeroDeLinhasCache-1
	cache << CacheLine.new
end


	 maskTag = 0
 	 maskIndex = 0
         mask = 0
		for i in 0..indexBits-1                        # Aqui temos o inicio das nossas operacoes bit a bit
			 maskIndex<<=1                                    
			 maskIndex |= 0x01                                          
		end

		for i in 0..tagBits-1
			  maskTag<<=1
				maskTag|=0x01
		end
	 


	maskTag <<= indexBits+ offsetBits
	maskIndex <<= offsetBits


		for i in 0..numeroDeLinhasCache-1
			 cache[i].valida = 0
		end
		


#Abrindo Arquivo
trace = File.open("trace","r")  #Le o Arquivo
tamTrace = File.readlines("trace") #Conta o Numero de Linhas do Trace

blocoCache = []
linhaBloco = []



#Mapeamento DIRETO! 

for lines in 0..tamTrace.length-1                         	 #Faz um for por todas as linhas do arquivo
   mem_req += 1 																				   #Um pequeno Contador
	 check = HexaParaDec(tamTrace[lines])                    #pega a String na posicao Line do Trace e Transforma pra Decimal
	 p = (check & maskIndex.to_i) >> offsetBits              #da um and do check e da mascara e da o shift rigth para ter a index
	
	 if cache[p].valida == 0                                 #Verifica se o index da linha da cache e valida
	 	    cache[p].tag = check  & maskTag.to_i         #define uma nova tag a partir do Check em hexa e da mascara da tag
				cache[p].valida = 1                                #define que e valida
				missDireto += 1                                    #da um cache Miss
				

	 elsif  cache[p].tag == (check & maskTag.to_i)           #Verifica se ja tem o Rotulo
	 		  hitDireto += 1                                     #se Sim marca o Hit

   else
				cache[p].tag = (check & maskTag.to_i)              #Caso Contrario a tag e atribuida e o miss incrementado
		    missDireto += 1
   end
end

puts 
puts 
puts "TAXA DE HITS E MISS DO MAPEAMENTO  DIRETO: "
puts
puts "Cache Miss: " +format("%.2f",(((missDireto*100).to_f/mem_req))) +" %"
puts "Cache Hit: " +format("%.2f",(((hitDireto*100)).to_f/mem_req))+" %"
puts puts
