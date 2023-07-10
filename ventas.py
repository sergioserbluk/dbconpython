#importo el conector
import mysql.connector

def conectar():
    #intentar conectar a la base de datos
    try:
        coneccion = mysql.connector.connect(host="db4free.net", 
            user='pruebascodo', password='746650ac', database='pruebascodo')
        return coneccion   
    except mysql.connector.Error as error:
        print("Error al conectar a la base de datos: {}".format(error))
        return None
def desconectar(coneccion):
    #desconectar de la base de datos
    coneccion.close()
    print("La coneccion a la base de datos ha finalizado")
def ejecutar_consulta(coneccion, consulta,comiteo=True):
    #ejecutar una consulta
    try:
        cursor = coneccion.cursor()
        cursor.execute(consulta)
        if comiteo==True:
            coneccion.commit()
        return cursor
    except mysql.connector.Error as error:
        print("Error al ejecutar consulta: {}".format(error))
        return None    
def menu_productos():
    #mostrar el menu de productos
    print("Menu de productos")
    print("1. Listar productos")
    print("2. Agregar producto")
    print("3. Editar producto")
    print("4. Eliminar producto")
    print("5. Salir")
    opcion = input("Ingrese una opcion: ")
    return opcion
def menu_ventas():
    #mostrar el menu de ventas
    print("Menu de ventas")
    print("1. Listar ventas")
    print("2. Agregar venta")
    print("3. Editar venta")
    print("4. Eliminar venta")
    print("5. Salir")
    opcion = input("Ingrese una opcion: ")
    return opcion
def menu_principal():
    #mostrar el menu principal
    print("Menu principal")
    print("1. Productos")
    print("2. Ventas")
    print("3. Salir")
    opcion = input("Ingrese una opcion: ")
    return opcion
while True:
    menu_princ = menu_principal()
    if menu_princ == "1":
        menu_prod=menu_productos()
        if menu_prod=="1":
            #listar productos
            coneccion = conectar()
            if coneccion:
                consulta = "SELECT * FROM pruebascodo.productos"
                micursor=ejecutar_consulta(coneccion, consulta, False)
                if micursor:
                    for fila in micursor:
                        print(fila)
                desconectar(coneccion)
        elif menu_prod=="2":
            #agregar producto
            coneccion = conectar()
            if coneccion:
                nombre = input("Ingrese el nombre del producto: ")
                precio = float(input("Ingrese el precio del producto: "))
                consulta = "INSERT INTO productos(descripcion, precio) VALUES ('{}', {})".format(nombre, precio)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Producto agregado correctamente")
                desconectar(coneccion)
        elif menu_prod=="3":
            #editar producto
            coneccion = conectar()
            if coneccion:
                id_producto = int(input("Ingrese el id del producto a editar: "))
                nombre = input("Ingrese el nuevo nombre del producto: ")
                precio = float(input("Ingrese el nuevo precio del producto: "))
                consulta = "UPDATE productos SET descripcion='{}', precio={} WHERE id_p={}".format(nombre, precio, id_producto)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Producto editado correctamente")
                desconectar(coneccion)
        elif menu_prod=="4":
            #eliminar producto
            coneccion = conectar()
            if coneccion:
                id_producto = int(input("Ingrese el id del producto a eliminar: "))
                consulta = "DELETE FROM productos WHERE id_p={}".format(id_producto)
                #habia agregado la linea del print
                print(consulta)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Producto eliminado correctamente")
                desconectar(coneccion)
        elif menu_prod=="5":
            #salir
            break
        else:
            print("Opcion incorrecta")
    elif menu_princ == "2":
        #menu ventas
        menu_vent=menu_ventas()
        if menu_vent==1:
            #listar ventas
            coneccion = conectar()
            if coneccion:
                consulta = "SELECT * FROM ventas"
                cursor = ejecutar_consulta(coneccion, consulta,False)
                if cursor:
                    for fila in cursor:
                        print(fila)
                desconectar(coneccion)
        elif menu_vent==2:
            #agregar venta
            coneccion = conectar()
            if coneccion:
                id_producto = int(input("Ingrese el id del producto: "))
                cantidad = int(input("Ingrese la cantidad: "))
                consulta = "INSERT INTO ventas(id_producto, cantidad) VALUES ({}, {})".format(id_producto, cantidad)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Venta agregada correctamente")
                desconectar(coneccion)
        elif menu_vent==3:
            #editar venta
            coneccion = conectar()
            if coneccion:
                id_venta = int(input("Ingrese el id de la venta a editar: "))
                id_producto = int(input("Ingrese el nuevo id del producto: "))
                cantidad = int(input("Ingrese la nueva cantidad: "))
                consulta = "UPDATE ventas SET id_producto={}, cantidad={} WHERE id={}".format(id_producto, cantidad, id_venta)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Venta editada correctamente")
                desconectar(coneccion)
        elif menu_vent==4:
            #eliminar venta
            coneccion = conectar()
            if coneccion:
                id_venta = int(input("Ingrese el id de la venta a eliminar: "))
                consulta = "DELETE FROM ventas WHERE id={}".format(id_venta)
                cursor = ejecutar_consulta(coneccion, consulta)
                if cursor:
                    print("Venta eliminada correctamente")
                desconectar(coneccion)
        elif menu_vent==5:
            #salir
            break
        else:
            print("Opcion incorrecta")
    elif menu_princ == "3":
        #salir
        break
    else:
        print("Opcion incorrecta")

        
        
        
    
    
    
    
