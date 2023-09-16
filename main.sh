main(){
    #Variables de entorno
    running=true
    inputMain=''
    #Logica de ejecucion del menu
    while [[ $running = true ]]; do
        read -p "Ingresa -a para entrar al menu de metodología ágil o -t para entrar a la metodología tradicional" inputMain        
        if [ $inputMain = "-a" ]; then
            echo "Menú de metodología ágil"
            # To-Do: Falta función para desplegar el menu de metodoloǵia ágil
        elif [ $inputMain = "-t" ]; then
            echo "Menú de metodología tradicional"
            # To-Do: Falta función para desplegar el menu de metodoloǵia tradicional
        else
            running=false
        fi
    done
}

#Disparador de la función principal de ejecucion del programa
main