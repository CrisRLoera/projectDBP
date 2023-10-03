main(){
    #Variables de entorno
    running=true
    inputMain=''
    opc=0
    opc2=0
    opcSelected=''
    stillRunning=0

    #Logica de ejecucion del menu
    while [[ $running = true ]]; do
        if [ $stillRunning = 0 ]; then
            read -p "Ingresa -a para entrar al menu de metodología ágil o -t para entrar a la metodología tradicional: " inputMain        
            
        else
            read -p "Ingrese -e para terminar con la ejecucion ó -t (Tradicional), -a (Ágil) para continuar la ejecucion:" inputMain
        fi
        if [ $inputMain = "-a" ]; then
                stillRunning=1
                echo "--------------------------------------------------------------------------"
                echo "Bienvenido a la guia rapida de Agile, para continuar seleccione un tema: "
                echo "1. SCRUM"
                echo "2. X.P."
                echo "3. Kanban"
                echo "4. Crystal"
                read -p "Opcion: " opc
                echo "--------------------------------------------------------------------------"
                case $opc in
                    1 )
                    echo "Usted esta en la seccion SCRUM, seleccione la opcion que desea utilizar:"
                    opcSelected="SCRUM"
                    menuOpciones "$opcSelected"
                        ;;
                    2 )
                    echo "Usted esta en la seccion X.P, seleccione la opcion que desea utilizar"
                    opcSelected="XP"
                    menuOpciones "$opcSelected"
                        ;;
                    3 )
                    echo "Usted esta en la seccion Kanban, seleccione la opcion que desea utilizar"
                    opcSelected="Kanban"
                    menuOpciones "$opcSelected"
                        ;;
                    4 )
                    echo "Usted esta en la seccion Crystal, seleccione la opcion que desea utilizar"
                    opcSelected="Crystal"
                    menuOpciones "$opcSelected"
                        ;;
                    * )
                    #Este clear no supe si dejarlo o no, ustedes deciden.
                    clear
                    echo "Opcion No valida, Digite Nuevamente."
                        ;;
                esac
        
        elif [ $inputMain = "-t" ]; then
            echo "Bienvenido a la guia rapida de metodologias tradicionales, para continuar seleccione un tema: "
            echo "1. Cascada"
            echo "2. Espiral"
            echo "3. Modelo V"
            read -p "Opcion: " opc2
            case $opc2 in
                1 )
                echo "Usted esta en la seccion Cascada, seleccione la opcion que desea utilizar"
                opcSelected="Cascada"
                menuOpciones "$opcSelected"
                    ;;
                2 )
                echo "Usted esta en la seccion Espiral, seleccione la opcion que desea utilizar"
                opcSelected="Espiral"
                menuOpciones "$opcSelected"
                    ;;
                3 )
                echo "Usted esta en la seccion Modelo V, seleccione la opcion que desea utilizar"
                opcSelected="ModeloV"
                menuOpciones "$opcSelected"
                    ;;
                * )
                #Este clear no supe si dejarlo o no, ustedes deciden.
                clear
                echo "Opcion No valida, Digite Nuevamente."
                    ;;  
            esac
        elif [ $inputMain = "-e" ]; then
            running=false 
        else
            running=true
        fi
    done
}


menuOpciones(){
    #Varibles de Entorno
    opc=0

    #Menu de opciones
    echo "1. Agregar Informacion"
    echo "2. Buscar"
    echo "3. Eliminar Informacion"
    echo "4. Leer Base de Datos"
    read -p "Opcion: " opc
    echo "--------------------------------------------------------------------------"

    #Case opciones Menu
    case $opc in
        1 )
        echo "Ha Seleccionado La Opcion Agregar Informacion"
        agregarInfo "$opcSelected"
            ;;
        2 )
        echo "Ha Seleccionado La Opcion Buscar"
        buscar "$opcSelected"
            ;;
        3 )
        echo "Ha Seleccionado La Opcion Eliminar"
        eliminarInfo "opcSelected"
            ;;
        4 )
        echo "Ha Seleccionado La Opcion Leer Base de Datos"
        leerBaseInfo "$opcSelected"
            ;;
    esac

}

agregarInfo(){
    #Variables de entorno
    concept=''
    info=''

    #Solicita el concepto
    read -p "Digite El Nombre Del Nuevo Concepto: " concept
    #Solicita nueva informacion
    read -p "Introduzca La Nueva Informacion: " info
    #Agrega nueva informacion y actualizarlo
    echo -e "[$concept] .- $info\n" >> $opcSelected.inf
    echo "Se Agrego Informacion Correctamente"
}



buscar(){
    read -p "Escribe el concepto a buscar: " concept
    result=$(awk -v concept="$concept" '$1 == "["concept"]" {print; exit}' "$opcSelected.inf")
    if [[ -n "$result" ]]; then
        echo "$result"
    else
        echo "No se encontraron concidencias"
    fi
    
    echo ""
}



eliminarInfo(){
    
    concept=''

    read -p "Escribe el concepto a eliminar: " concept

    if [ -f "$opcSelected.inf" ] && grep -q "^\[$concept\]" "$opcSelected.inf"; then
        sed -i "/^\[$concept\]/N; /^\[$concept\]/d" "$opcSelected.inf"
        echo "Se ha eliminado la informacion para el concepto [$concept]"
    else
        echo "El concepto $concept no existe."
    fi

}


leerBaseInfo(){
    cat "$opcSelected.inf"
}


#Disparador de la función principal de ejecucion del programa
main