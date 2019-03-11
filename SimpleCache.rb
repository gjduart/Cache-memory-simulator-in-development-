#==================================================================
#       @Author: Gabriel Duarte
#       Date:10/03/2019
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

#Calculo Para saber o Numero de linhas e o Tamanho do Conjunto
numeroDeLinhasCache    = (Tamanho_cache*2**unidadedeTamanho/tamLinhaCache).to_i 
tamanho_Conjunto_Cache = tamLinhaCache * linhasConjuntoCache

puts "Tamanho do Conjunto da Cache: " + tamanho_Conjunto_Cache.to_s
puts "======================================================="
puts

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
time_stamp = 0   #Para a Verificacao do Mais Frequentemente Utilizado
mem_req = 0 #Requisição da Memoria

class CacheLine
  	  valida = 1.to_i
  	  tag    = 0.to_i
    	ultimo_acesso = 0.to_i
    	nrAcesso = 0.to_i
#Getters and Setters
	def setValue(value)
					valida = value.to_i
					return valida
	end

	def getValue
					valida = valida.to_i
					return valida
	end


end

cache = []

for i in 0..numeroDeLinhasCache
cache << CacheLine.new
end
#Conversao para mascara 
	 baseTag = 0
   baseIndex = 0
   base = 0
		for i in 0..tamLinhaCache
			 baseIndex<<=1
			 baseIndex |= 0x01
		end
		
		for i in 0..tagBits
			  baseTag<<=1
				baseTag|=0x01
		end
	#	puts baseTag.to_s(2) #Teste do shift Left na base Binaria
	#	baseTag <<= indexBits+ offsetBits
	#puts baseTag
	#	baseIndex <<= offsetBits
		for i in 0..numeroDeLinhasCache
		   cache[i].setValue(0)
		end
    puts "o  valor e "+ cache[i].getValue.to_s



#Abrindo Arquivo
trace = File.open("trace","r")  #Le o Arquivo
tamTrace = File.readlines("trace") #Conta o Numero de Linhas do Trace

blocoCache = []
linhaBloco = []

for lines in 0..tamTrace.length-1
   mem_req += 1 
	 check = HexaParaDec(tamTrace[lines])


	 #Associativa por Conjunto
	#for u in 0..tamanho_Conjunto_Cache
	#	for j in 0..linhasConjuntoCache
			
	#	end
 # end
end


puts
puts "linhas na Trace:" + mem_req.to_s
i = gets.to_s
puts HexaParaBin(i).to_s 
puts HexaParaDec(i).to_s
