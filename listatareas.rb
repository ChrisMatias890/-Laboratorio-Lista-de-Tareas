#Christian Matias Alvarez
#Proyecto para lista de tareas 
#31 de marzo de 2025

#Implementación de la clase:
#-----------------------------------------------------------------------------------
class TaskList



end
#-----------------------------------------------------------------------------------
#Final de la implementación de la clase


#Funciones principales:

#Función para limpiar la pantalla, también detecta el sistema operativo
#-----------------------------------------------------------------------------------
def limpiar_pantalla
    if Gem.win_platform?  # Detectar si el sistema operativo es Windows
      system('cls')
    else  # Para Unix (Linux, macOS)
      system('clear')
    end
  end
# Fin de la función para limpiar pantalla
#-----------------------------------------------------------------------------------

#Función para Menu
#-----------------------------------------------------------------------------------
def menu()

    puts("#{"-" * 15} Lista de Tareas #{"-" * 15} \n")
    puts("\nMenu: \n")
    puts("1 --- Agregar Tareas")
    puts("2 --- Marcar Tareas como Completadas")
    puts("3 --- Eliminar Tareas")
    puts("4 --- Ver Tareas Pendientes")
    puts("5 --- Guardar Tareas o Actualizar")
    puts("6 --- Cargar otro archivo de Tareas")
    puts("7 --- Salir")\

end
#---------------------------------------------------------------------------------------
#Final de la función Menu 

#Función Main del programa
#---------------------------------------------------------------------------------------
def main()

    #Manejo de excepción:
    begin
        #Iniciando un loop de Do para realizar multiples veces la función menu 
        loop do
        #Llamando la función Menu
        menu()

        print("Selecciona la opción a desear: ")

        #Variables
        opcion = gets.chomp

        #Utilizando un método de Ruby llamado Case-When
        case(opcion) 
        
        #Agregar Tareas
        when "1"
            limpiar_pantalla()
        

        #Fin de agregar Tareas


        #Marcar Tareas como Completadas
        when "2"
            limpiar_pantalla()
        
        #Fin de Marcar Tareas como Completadas


        #Eliminar Tareas
        when "3"
            limpiar_pantalla()

        #Fin de Eliminar Tareas


        #Ver Tareas Pendientes
        when "4"
            limpiar_pantalla()

        #Fin de Ver Tareas Pendientes


        #Guardar Tareas o Actualizar
        when "5"
            limpiar_pantalla()
        

        #Fin de Guardar Tareas o Actualizar


        #Cargar otro archivo de Tareas
        when "6"
            limpiar_pantalla()
        

        #Fin de Cargar otro archivo de Tareas


        #Salir
        when "7"
            limpiar_pantalla()
            print("Saliendo del programa...")
            break

        
        #Fin de Salir
        else
            #Indicación para iniciar el error ArgumentError si hay valores no correctos.
            raise StandardError if opcion != ""

        end #Fin del Case-When
        

        end #Fin de Loop Do
    rescue ArgumentError => tipo
        puts ("Se encontró valores incorrectos, inténtelo de nuevo, Error: #{tipo.message}")
        
    rescue StandardError => error
        # Captura cualquier error derivado de StandardError
        puts ("Se encontraron problemas al iniciar la aplicación, intentélo más tarde. \n Erorr: #{error.class} - #{error.message}")
      
    end #Fin de Manejo de excepciones
end




#---------------------------------------------------------------------------------------
#Final de la función Main

#Llamando la función Main para que el programa ejecute:
main()