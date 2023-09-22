main(){
    #Variables de entorno
    running=true
    inputMain=''
    opc=0
    opc2=0
    #Logica de ejecucion del menu
    while [[ $running = true ]]; do
        read -p "Ingresa -a para entrar al menu de metodología ágil o -t para entrar a la metodología tradicional: " inputMain        
        if [ $inputMain = "-a" ]; then
            echo "Bienvenido a la guia rapida de Agile, para continuar seleccione un tema: "
            echo "1. SCRUM"
            echo "2. X.P."
            echo "3. Kanban"
            echo "4. Crystal"
            read -p "Opcion: " opc
            case $opc in
                1 )
                echo "Usted esta en la seccion SCRUM, seleccione la opcion que desea utilizar"
                    ;;
                2 )
                echo "Usted esta en la seccion X.P, seleccione la opcion que desea utilizar"
                    ;;
                3 )
                echo "Usted esta en la seccion Kanban, seleccione la opcion que desea utilizar"
                    ;;
                4 )
                echo "Usted esta en la seccion Crystal, seleccione la opcion que desea utilizar"
                    ;;
            esac
            # To-Do: Falta función para desplegar el menu de metodoloǵia ágil
        elif [ $inputMain = "-t" ]; then
            echo "Bienvenido a la guia rapida de metodologias tradicionales, para continuar seleccione un tema: "
            echo "1. Cascada"
            echo "2. Espiral"
            echo "3. Modelo V"
            read -p "Opcion: " opc2
            case $opc2 in
                1 )
                echo "Usted esta en la seccion Cascada, seleccione la opcion que desea utilizar"
                    ;;
                2 )
                echo "Usted esta en la seccion Espiral, seleccione la opcion que desea utilizar"
                    ;;
                3 )
                echo "Usted esta en la seccion Modelo V, seleccione la opcion que desea utilizar"
                    ;;
            esac
            # To-Do: Falta función para desplegar el menu de metodoloǵia tradicional
        else
            running=false
        fi
    done
}

: '

agregarInfo(){

}

buscar(){

}

eliminarInfo(){

}

leerBaseInfo(){

}

'

#Disparador de la función principal de ejecucion del programa
main