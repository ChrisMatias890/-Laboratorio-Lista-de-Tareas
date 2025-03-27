#Christian Matias Alvarez
#Proyecto para lista de tareas 
#31 de marzo de 2025

#Librerías:
require 'time'

#Implementación de la clase:
#-----------------------------------------------------------------------------------
class TaskList

    #Método para Inicializar
    def initialize()
        @listatareas = {}

    end
    #Fin del método para Inicializar

    #Método para agregar tareas:
    def agregar_tareas()
        begin
            #Preguntando al usuario cuantas tareas deseas agregar:
            print("¿Cuántas tareas deseas agregar?: ")
            cantidad_tareas = gets.chomp.to_i

            cantidad_tareas.times do |i|
                #Variable para las fechas:
                fecha = Time.now.strftime("%m/%d/%Y %H:%M:%S")
                print("Ingrese el nombre de la tarea #{i + 1}: ")
                nombre = gets.chomp.capitalize

                print("Ingrese la descripción de la tarea: ")
                descripcion = gets.chomp.capitalize

                @listatareas[nombre] = {
                descripcion: descripcion,
                estado: false,
                creada_en: fecha, 
                finalizada_en: nil,
                }

                puts("La tarea #{nombre} fue creada exitosamente.")
            end # Final del ciclo for
        rescue StandardError => e
            puts("Hubo un error al intentar crear la tarea, erorr: #{e.message}")
        end #Final del manejo de excepciones
    end #Fin del método para agregar tareas

    # Marcar Tarea como Completada
    def completar_tareas()
        begin
            #Condicional por si el usuario no ha registrado ninguna tarea aún.
            if @listatareas.empty?
                puts("No hay tareas registradas")
            else    
                puts("\n #{"-" * 10} Tareas actuales: #{"-" * 10} \n")        
                #Creando un loop con el método .each_with_index para que me ponga un de forma númerica las tareas.
                @listatareas.each_with_index do |(nombre, tarea), index|
                estado = tarea[:estado] ? "Completada" : "Pendiente"
                puts "#{index + 1}. #{nombre}: #{tarea[:descripcion]} - Estado: #{estado} (Creada: #{tarea[:creada_en]})"
                end # Fin del ciclo do 

                loop do
                #Input para escoger el nombre
                print("Ingrese el nombre de la tarea a completar: ")
                nombre = gets.chomp.capitalize

                
                    #Implementación de condicional:
                    if @listatareas[nombre]
                        fecha = Time.now.strftime("%m/%d/%Y %H:%M:%S")
                        @listatareas[nombre][:estado] = true
                        @listatareas[nombre][:finalizada] = fecha
                        puts("\n La tarea #{nombre} fue completada con éxito.")
                        break
                    else
                        puts("Clave '#{nombre} no fue encontrada, inténtelo de nuevo.")
                    end #Fin de la condicion
                end # Fin del bucle do
            end # Final de la condicional
        rescue StandardError => e
                puts("Hubo un error al intentar completar la tarea, erorr: #{e.message}")
        end #Final del manejo de excepciones
    end # Final para completar tareas

    # Método para ver todas las tareas numeradas
    def ver_tareas()
        begin
            #Condicional por si el usuario no ha registrado ninguna tarea aún.
            if @listatareas.empty?
                puts("No hay tareas registradas")
            else
                puts("\n #{"-" * 10} Tareas actuales: #{"-" * 10} \n")
                #Creando un loop con el método .each_with_index para que me ponga un de forma númerica las tareas.
                @listatareas.each_with_index do |(nombre, tarea), index|
                    estado = tarea[:estado] ? "Completada" : "Pendiente"
                    if tarea[:estado] = "Completada"
                        puts ("#{index + 1}. #{nombre}: #{tarea[:descripcion]} - Estado: #{estado} (Creada: #{tarea[:creada_en]}, (Finalizada: #{tarea[:finalizada]})")
                    else
                        puts ("#{index + 1}. #{nombre}: #{tarea[:descripcion]} - Estado: #{estado} (Creada: #{tarea[:creada_en]})")
                    end #fin de la condicional
                end # Fin del ciclo do
            end # Final de la condicion    
        rescue StandardError => e
        puts("Hubo un error al intentar mostrar las tareas, error: #{e.message}")
        end #Fin del manejo de excepciones
    end #Final de la función ver tareas
    
    #Realizando función para eliminar tareas
    def eliminar_tareas()
        begin
            #Condicional por si el usuario no ha registrado ninguna tarea aún.
            if @listatareas.empty?
                puts ("No hay tareas registradas.")
            else         
                puts("\n #{"-" * 10} Tareas actuales: #{"-" * 10} \n")   
                #Creando un loop con el método .each_with_index para que me ponga un de forma númerica las tareas.
                @listatareas.each_with_index do |(nombre, tarea), index|
                estado = tarea[:estado] ? "Completada" : "Pendiente"
                puts "#{index + 1}. #{nombre}: #{tarea[:descripcion]} - Estado: #{estado} (Creada: #{tarea[:creada_en]})"
                end # Fin del ciclo do 

                loop do
                    #Input para escoger el nombre
                    print("Ingrese el nombre de la tarea a eliminar: ")
                    nombre = gets.chomp.capitalize

                
                    #Implementación de condicional:
                    if @listatareas[nombre]
                        puts("\n ¿Estás seguro de querer eliminar esta tarea?")
                        print("Escoja su respuesta: ")
                        opcion = gets.chomp.capitalize

                        #Implementación de una segunda condicion
                        if opcion == "Si"
                            @listatareas.delete(nombre)
                            puts("\n La tarea #{nombre} fue eliminada con éxito.")
                        else
                            puts("Se canceló el proceso de eliminación.")
                        end #Final de la condicioanl
                        break
                    else
                        puts("Clave '#{nombre} no fue encontrada, inténtelo de nuevo.")
                    end #Fin de la condicion
                end # Fin del bucle do
            end # Final de la condicional

        rescue StandardError => e
            puts("Hubo un error al intentar eliminar las tareas, error: #{e.message}")
        end #Fin del manejo de excepciones
    end #Final de eliminar tareas
        
    def guardar_tarea()
        begin
            if @listatareas.empty?
                puts("No hay tareas registradas")
            else
                print("\n Ingrese el nombre del archivo: ")
                archivo = gets.chomp.downcase
                txt = ".txt"

                nombre_archivo = archivo + txt
                if File.exist?(nombre_archivo)
                    print("El archivo  ya fue existe")
                else
                    File.open(nombre_archivo, "w") do |file|
                        @listatareas.each do |nombre, tarea|
                            file.puts("| #{nombre} | #{tarea[:descripcion]} | #{tarea[:estado]}, | #{tarea[:creada_en]} | #{tarea[:finalizada_en]} |")
                        end #Final del ciclo do
                    end #Final del otro ciclo do
                    
                end #Final de la condicion
            end # Fin de la condicion
        rescue StandardError => e
            puts("Hubo un error al intentar guardar las tareas, error: #{e.message}")
        end #Fin del manejo de excepciones        
    end # Fin de la funcion guardar_tarea
        
    def cargar_tareas()
        begin
          print("\n Ingrese el nombre del archivo: ")
          archivo = gets.chomp.downcase
          txt = ".txt"
      
          nombre_archivo = archivo + txt
          if File.exist?(nombre_archivo)
            @listatareas = {}
      
            # Abre el archivo y lee línea por línea
            File.readlines(nombre_archivo).each do |linea|
              # Dividir la línea en partes
              nombre, descripcion, estado, creada_en, finalizada_en = linea.chomp.split('|')
      
              # Convertir las fechas usando Time.parse y manejar posibles errores
              begin
                fecha_creada = Time.strptime(creada_en, "%m/%d/%Y %H:%M:%S")
                fecha_finalizada = finalizada_en.nil? || finalizada_en.strip.empty? ? nil : Time.strptime(finalizada_en, "%m/%d/%Y %H:%M:%S")
              rescue ArgumentError
                puts "Error al cargar las fechas en la tarea '#{nombre}'."
                next # Saltar esta línea si la fecha no es válida
              end
      
              # Guardar la tarea en el hash
              @listatareas[nombre] = {
                descripcion: descripcion,
                estado: estado, # Convertir cadena "true" a booleano
                creada_en: fecha_creada,
                finalizada_en: fecha_finalizada,
              }
              puts "Tareas cargadas desde '#{nombre_archivo}'."
            end
            
          else
            puts "El archivo '#{nombre_archivo}' no existe."
          end
        rescue StandardError => e
          puts "Hubo un error al intentar cargar las tareas, error: #{e.message}"
        end
      end
      
    

end #Final de la implementación de la clase
#-----------------------------------------------------------------------------------



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
    #Llamando a la clase
    tasks = TaskList.new
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
                puts("\n #{"-" * 15} Agregar Tareas: #{"-" * 15} \n") 
                tasks.agregar_tareas()

            #Fin de agregar Tareas


            #Marcar Tareas como Completadas
            when "2"
                limpiar_pantalla()
                puts("\n #{"-" * 15} Completar tareas: #{"-" * 15} \n") 
                tasks.completar_tareas()
            #Fin de Marcar Tareas como Completadas


            #Eliminar Tareas
            when "3"
                limpiar_pantalla()
                puts("\n #{"-" * 15} Eliminar tareas: #{"-" * 15} \n") 
                tasks.eliminar_tareas()
            #Fin de Eliminar Tareas


            #Ver Tareas Pendientes
            when "4"
                limpiar_pantalla()
                puts("\n #{"-" * 15} Ver tareas: #{"-" * 15} \n") 
                tasks.ver_tareas()
            #Fin de Ver Tareas Pendientes


            #Guardar Tareas o Actualizar
            when "5"
                limpiar_pantalla()
                puts("\n #{"-" * 15} Guardar tareas en archivo: #{"-" * 15} \n") 
                tasks.guardar_tarea()

            #Fin de Guardar Tareas o Actualizar


            #Cargar otro archivo de Tareas
            when "6"
                limpiar_pantalla()
                puts("\n #{"-" * 15} Guardar tareas de otro archivo: #{"-" * 15} \n") 
                tasks.cargar_tareas()

            #Fin de Cargar otro archivo de Tareas


            #Salir
            when "7"
                limpiar_pantalla()
                print("Saliendo del programa...")
                break

            
            #Fin de Salir
            else
                #Indicación para iniciar el error ArgumentError si hay valores no correctos.
                raise ArgumentError if opcion != ""

            end #Fin del Case-When
        

        end #Fin de Loop Do
    rescue ArgumentError => tipo
        puts ("Se encontró valores incorrectos, inténtelo de nuevo, Error: #{tipo.message}")
        
    rescue StandardError => error
        # Captura cualquier error derivado de StandardError
        puts ("Se encontraron problemas al iniciar la aplicación, intentélo más tarde. \n Erorr: #{error.message}")
      
    end #Fin de Manejo de excepciones
end #Fin de la función main




#---------------------------------------------------------------------------------------
#Final de la función Main

#Llamando la función Main para que el programa ejecute:
main()