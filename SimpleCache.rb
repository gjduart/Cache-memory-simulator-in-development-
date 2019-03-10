#==================================================================
#       @Author: Gabriel Duarte
#       Date:10/03/2019
#
#
#=================================================================
#Funcao Check Linha da Cache
def checkCasheLine()

end

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


#Politica de LFU
def Lfu()


end 

#Politica de LRU
def Lru()


end

puts "=============================="
puts "Simulador de Memoria Cache"
puts "=============================="
puts 

#Valores Iniciais (a Serem substituidos por Scans)
Tamanho_cache       = 512
tamLinhaCache       = 16
linhasConjuntoCache = 4
EnderecoMemoria     = 32
politicaDeSubs      = 0
unidadedeTamanho    = 10

#Prints
puts "======================================================="
puts "Tamanho da Cache: " + Tamanho_cache.to_s 
puts "Tamanho de Linhas da Cache: " + tamLinhaCache.to_s
puts "Linhas por Conjunto: " + linhasConjuntoCache.to_s 
puts "======================================================="
puts


#Calculo Para saber o Numero de linhas e o Tamanho do Conjunto
numeroDeLinhasCache    = (Tamanho_cache*2**unidadedeTamanho/tamLinhaCache).to_i 
tamanho_Conjunto_Cache = tamLinhaCache * linhasConjuntoCache



#Calculo de quantidade de bits dos Campos de Formato da Cache
offsetBits = (Math.log(tamLinhaCache,2)).to_i
indexBits  = (Math.log(Tamanho_cache*2**unidadedeTamanho/tamanho_Conjunto_Cache,2)).to_i
tagBits    = EnderecoMemoria - indexBits - offsetBits
puts "Formato da Cache :"
print "Tag: " + tagBits.to_s + " Index: " + indexBits.to_s + " offset: " + offsetBits.to_s
puts

#Variaveis de Controle
cache_acerto = 0 #numero de Acertos da Memoria Cache
cache_miss = 0   #Numero de Perca da Memoria Cache
time_stamp =0
mem_req = 0 #Requisição da Memoria

class CacheLine
   valida = 1.to_i
   tag    = 0.to_i
   ultimo_acesso = 0.to_i
   nrAcesso = 0.to_i
end


trace = File.open("trace","r")  #Le o Arquivo
tamTrace = File.readlines("trace") #Conta o Numero de Linhas do Trace

for lines in 0..tamTrace.length-1
   mem_req += 1 
	 check = HexaParaDec(tamTrace[lines])


end

   puts check

if politicaDeSubs == 0 

elsif politicaDeSubs == 1

end

puts
puts "linhas:" + mem_req.to_s
i = gets.to_s
puts HexaParaBin(i).to_s 
puts HexaParaDec(i).to_s
