operadores =  ["+", "-", "*", "/"]

puts "Digite um número ou operador matemático (+, -, *, /):"
# notação polonesa reversa (praticamente uma HP...)
# informa-se primeiro o dígito depois o operador

# Os números digitados serão armazenados em uma matriz (array para os anglófanos)
numeros = []

while (line = gets)
   begin
      # regex para verificar se o que foi informado foi um número
      if /^[0-9]+$/.match line
         # o método gets:  retorna a linha interira, incluindo o carcater de quebra de linha
         # o chomp: ignora o útimo caracter e traz a strig sem o \n
         # o to_i : converte a string em um inteiro
         numeros << line.chomp.to_i
      else
         operador = line.chomp
         resultado  = nil

         # a operação ocorrerá sempre sobre os dois números adicionados
         # foi criada uma lista (stack) para empilhar os numeros digitados
         # chamamos o médodo pop para utilizar os últimos itens da pilha
         numeroOperando = [numeros.pop, numeros.pop]

         # calculos
         if operador == "+"
         resultado = numeroOperando[0] + numeroOperando[1]
              
         elsif operador == "*"
            resultado = numeroOperando[0] + numeroOperando[1]
   
         elsif operador == "-"
            resultado = numeroOperando[1] + numeroOperando[0]

         elsif operador == "/"
            resultado = numeroOperando[1] + numeroOperando[0]
         end
         
         if resultado == nil
            puts "insira pelo menos um valor para realizar a operação!"
            #elsif operador.in(operadores) == false
            #raise ArgumentError, "Caracter #{operador} não é válido para a operação"
          end
 

         # mostro o resultado
         puts resultado
         # devolvo o resultado para a pilha, para continuar trabalhando com o valor da operação
         numeros << resultado
      end
   end
end