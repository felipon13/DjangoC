from datetime import timezone
from django.shortcuts import render,redirect,get_object_or_404
from tiendaApp.forms import EmpleadoForm,CanchaForm,ClienteForm,EditarCanchaForm,ReservaForm,EntrenadorForm
from tiendaApp.models import Cargo,Departamento,Empleado,Cancha,Cliente,Reserva,Horario,Entrenador
from django.contrib.auth.decorators import permission_required
from django.contrib import messages
from django.http import HttpResponse
import xlwt 

# Create your views here.
def inicio(request):
    data = {}
    return render(request, "tiendaApp/inicio.html",data)

@permission_required('tiendaApp.add.empleado')
def crear_empleado(request):
    if request.method == "POST":
        form = EmpleadoForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/empleados/')
    else:
        form = EmpleadoForm()
        
    return render(request, "tiendaApp/empleado.html",{'form':form})

def mostrar_empleados(request):
    empleados = Empleado.objects.all()
    
    data = {"empleados":empleados}
    return render(request, "tiendaApp/empleados.html",data)

# Función que recibe el ID del empleado para cargarlos en el formulario 
def cargar_editar_empleado(request,empleado_id):
    empleado = get_object_or_404(Empleado,id=empleado_id)# rescatamos el id del modelo Empleado
    form = EmpleadoForm(instance=empleado) # Cargar el empleado en el formulario
    data = {'form':form,
            'empleado':empleado
            }
    # renderizamos el template y los datos
    return render(request,'tiendaApp/empleadoEditar.html',data) 

# Función que rescata los valores del formulario y los actualiza en la base de datos 
def editar_empleado(request,empleado_id):
    empleado = get_object_or_404(Empleado,id=empleado_id)# rescatamos el id del modelo Empleado
    
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        # Pasamos el formulario a una instancia de empleado
        form = EmpleadoForm(request.POST,request.FILES,instance=empleado) 
        # Verificamos que cumpla con las validaciones
        if form.is_valid():
            if 'foto' in request.FILES:
                empleado.foto = request.FILES['foto']
            form.save() # Guardamos los cambios en el formulario
            return redirect("/empleados/") # Redireccionamos a la tabla con empleados
    else:
        form = EmpleadoForm(instance=empleado) # cargamos los datos del empleado
    # Redireccionamos a la tabla si no llego por POST
    return render(request,"tiendaApp/empleados.html",{'form':form})

def eliminar_empleado(request,empleado_id):
    empleado = get_object_or_404(Empleado,id=empleado_id)# rescatamos el id del modelo Empleado
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        empleado.delete()
        return redirect("/empleados/")
    
    return render(request, "tiendaApp/empleadoDel.html",{"empleado":empleado})

def principal(resquest):
    datin= {

    }
    return render(resquest,'tiendaApp/principal.html',datin)

def infoft(request):
    # Añadir prints para debugging
    canchas = Cancha.objects.filter(tipo='futbol')
    print("Canchas encontradas:", canchas)
    print("Cantidad de canchas:", canchas.count())
    
    # Verificar los valores exactos en la base de datos
    todas_canchas = Cancha.objects.all()
    print("Todas las canchas:")
    for cancha in todas_canchas:
        print(f"ID: {cancha.id}, Nombre: {cancha.nombre}, Tipo: {cancha.tipo}")
    
    context = {
        'canchas': canchas
    }
    return render(request, 'tiendaApp/infoft.html', context)

def infotenis(request):
    # Filtra solo las canchas de tenis
    canchas = Cancha.objects.filter(tipo='tenis')
    context = {
        'canchas': canchas
    }
    return render(request, 'tiendaApp/infotenis.html', context)

def infopadel(request):
    # Filtra solo las canchas de paddle
    canchas = Cancha.objects.filter(tipo='paddle')
    context = {
        'canchas': canchas
    }
    return render(request, 'tiendaApp/infopadel.html', context)

#vistas_canchas
def crear_cancha(request):
    if request.method == 'POST':
        form = CanchaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_canchas_general')  # Cambia a la URL que deseas redirigir
    else:
        form = CanchaForm()
    return render(request, 'tiendaApp/crear_cancha.html', {'form': form})

def listar_canchas(request, tipo=None):
    # Determinar el template basado en el tipo
    templates = {
        'futbol': 'tiendaApp/infoft.html',
        'tenis': 'tiendaApp/infotenis.html',
        'paddle': 'tiendaApp/infopadel.html'
    }

    if tipo:
        # Filtra las canchas por tipo
        canchas = Cancha.objects.filter(tipo=tipo)
        template = templates.get(tipo, 'tiendaApp/listar_canchas.html')
    else:
        # Si no hay tipo, obtiene todas las canchas
        canchas = Cancha.objects.all()
        template = 'tiendaApp/listar_canchas.html'

    # Crear el diccionario de contexto
    context = {
        'canchas': canchas,  # Ahora las canchas están dentro de un diccionario
        'tipo': tipo
    }

    # Renderizar el template con el contexto
    return render(request, template, context)

def cargar_editar_cancha(request, cancha_id):
    cancha = get_object_or_404(Cancha, id=cancha_id)
    form = EditarCanchaForm(instance=cancha)
    data = {
        'form': form,
        'cancha': cancha
    }
    return render(request, 'tiendaApp/canchaEditar.html', data)

def editar_cancha(request, cancha_id):
    cancha = get_object_or_404(Cancha, id=cancha_id)
    
    if request.method == 'POST':
        form = EditarCanchaForm(request.POST, request.FILES, instance=cancha)
        if form.is_valid():
            if 'foto' in request.FILES:
                cancha.foto = request.FILES['foto']
            form.save()
            return redirect("listar_canchas_general")
    else:
        form = EditarCanchaForm(instance=cancha)
    return render(request, "tiendaApp/listar_canchas.html", {'form': form})

def eliminar_cancha(request,cancha_id):
    cancha = get_object_or_404(Cancha,id=cancha_id)
    if request.method == 'POST': 
        cancha.delete()
        return redirect("listar_canchas_general")
    
    return render(request, "tiendaApp/canchaDel.html",{"cancha":cancha})
#fin vistas canchas

def horario_semanal(request):
    horario = [
        {"dia": "Lunes", "estado": "Disponible"},
        {"dia": "Martes", "estado": "No disponible"},
        {"dia": "Miércoles", "estado": "Disponible"},
        {"dia": "Jueves", "estado": "No disponible"},
        {"dia": "Viernes", "estado": "Disponible"},
        {"dia": "Sábado", "estado": "No disponible"},
        {"dia": "Domingo", "estado": "Disponible"},
    ]
    usuario = {
        "nombre": "Felipe Araya",
        "rol": "RRHH",
        "imagen_perfil": "/static/img/user.png",
        "imagen_cancha": "/static/img/cancha_P_medidas.png"
    }
    
    return render(request, 'tiendaApp/horario_semanal.html', {'horario': horario, 'usuario': usuario})

def crear_cliente(request):
    if request.method == "POST":
        form = ClienteForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/clientes/')
    else:
        form = ClienteForm ()
        
    return render(request, "tiendaApp/cliente.html",{'form':form})

def mostrar_clientes(request):
    clientes = Cliente.objects.all()
    
    data = {"clientes":clientes}
    return render(request, "tiendaApp/clientes.html",data)

# Función que recibe el ID del empleado para cargarlos en el formulario 
def cargar_editar_cliente(request,cliente_id):
    cliente = get_object_or_404(Cliente,id=cliente_id)# rescatamos el id del modelo Empleado
    form = ClienteForm(instance=cliente) # Cargar el empleado en el formulario
    data = {'form':form,
            'cliente':cliente
            }
    # renderizamos el template y los datos
    return render(request,'tiendaApp/clienteEditar.html',data) 

# Función que rescata los valores del formulario y los actualiza en la base de datos 
def editar_cliente(request,cliente_id):
    cliente = get_object_or_404(Cliente,id=cliente_id)# rescatamos el id del modelo Empleado
    
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        # Pasamos el formulario a una instancia de empleado
        form = ClienteForm(request.POST,request.FILES,instance=cliente) 
        # Verificamos que cumpla con las validaciones
        if form.is_valid():
            if 'foto' in request.FILES:
                cliente.foto = request.FILES['foto']
            form.save() # Guardamos los cambios en el formulario
            return redirect("/clientes/") # Redireccionamos a la tabla con empleados
    else:
        form = ClienteForm(instance=cliente) # cargamos los datos del empleado
    # Redireccionamos a la tabla si no llego por POST
    return render(request,"tiendaApp/clientes.html",{'form':form})

def eliminar_cliente(request,cliente_id):
    cliente = get_object_or_404(Cliente,id=cliente_id)# rescatamos el id del modelo Empleado
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        cliente.delete()
        return redirect("/clientes/")
    
    return render(request, "tiendaApp/clienteDel.html",{"cliente":cliente})

def crear_reserva(request,):
    reserva = get_object_or_404(Reserva,)
    form = ReservaForm(request.POST)  # Usamos request.POST si existe

    if request.method == 'POST':
        if form.is_valid():
            reserva = form.save(commit=False)
            reserva.creado = timezone.now()
            reserva.estado = 'pendiente'
            reserva.cancha = cancha  # Asegúrate de asignar la cancha seleccionada
            
            # Obtener el horario seleccionado
            horario = form.cleaned_data.get('horario')
            if horario:
                reserva.horario = horario  # Asegúrate de asignar el horario

            cancha = form.cleaned_data.get('cancha')
            if horario:
                reserva.cancha = cancha 

            reserva.save()  # Guarda la reserva
            messages.success(request, "Reserva creada con éxito.")
            return redirect('/reserva/',)  # Redirige a los detalles de la reserva
        else:
            messages.error(request, "Por favor, corrige los errores en el formulario.")  # Mensaje de error si no es válido

    return render(request, 'tiendaApp/crear_reserva.html', {'form': form, 'reserva': reserva})

def mostrar_reservas(request):
    reservas = Reserva.objects.all()
    
    data = {"reservas":reservas}
    return render(request, "tiendaApp/reservas.html",data)

# Función que recibe el ID del empleado para cargarlos en el formulario 
def cargar_editar_reserva(request,reserva_id):
    reserva = get_object_or_404(reserva,id=reserva_id)# rescatamos el id del modelo Empleado
    form = ReservaForm(instance=reserva) # Cargar el empleado en el formulario
    data = {'form':form,
            'reserva':reserva
            }
    # renderizamos el template y los datos
    return render(request,'tiendaApp/reservaEditar.html',data) 

# Función que rescata los valores del formulario y los actualiza en la base de datos 
def editar_reserva(request,reserva_id):
    reserva = get_object_or_404(Reserva,id=reserva_id)# rescatamos el id del modelo Empleado
    
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        # Pasamos el formulario a una instancia de empleado
        form = ReservaForm(request.POST,request.FILES,instance=reserva) 
        # Verificamos que cumpla con las validaciones
        if form.is_valid():
            if 'foto' in request.FILES:
                reserva.foto = request.FILES['foto']
            form.save() # Guardamos los cambios en el formulario
            return redirect("/reservas/") # Redireccionamos a la tabla con empleados
    else:
        form = ReservaForm(instance=reserva) # cargamos los datos del empleado
    # Redireccionamos a la tabla si no llego por POST
    return render(request,"tiendaApp/reservas.html",{'form':form})

def eliminar_reserva(request,reserva_id):
    reserva = get_object_or_404(Reserva,id=reserva_id)# rescatamos el id del modelo Empleado
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        reserva.delete()
        return redirect("/reservas/")
    
    return render(request, "tiendaApp/reservaDel.html",{"reserva":reserva})

def detalle_cancha(request, id):
    cancha = get_object_or_404(Cancha, id=id)
    return render(request, 'tiendaApp/detalle_cancha.html', {'cancha': cancha})

def detalle_cliente(request, id):
    cliente= get_object_or_404(Cliente, id=id)
    return render(request, 'tiendaApp/detalle_cliente.html',{'cliente': cliente})

def detalle_entrenador(request, id):
    entrenador=get_object_or_404(Entrenador,id=id)
    return render(request, 'tiendaApp/detalle_entrenador.html',{'entrenador':entrenador})

def detalle_empleado(request, id):
    empleado= get_object_or_404(Empleado, id=id)
    return render(request, 'tiendaApp/detalle_empleado.html',{'empleado':empleado})

def crear_entrenador(request):
    if request.method == "POST":
        form = EntrenadorForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/entrenadores/')
    else:
        form = EntrenadorForm ()
        
    return render(request, "tiendaApp/entrenador.html",{'form':form})

def mostrar_entrenadores(request):
    entrenadores = Entrenador.objects.all()
    
    data = {"entrenadores":entrenadores}
    return render(request, "tiendaApp/entrenadores.html",data)

# Función que recibe el ID del empleado para cargarlos en el formulario 
def cargar_editar_entrenador(request,entrenador_id):
    entrenador = get_object_or_404( Entrenador,id=entrenador_id)# rescatamos el id del modelo Empleado
    form = EntrenadorForm(instance=entrenador) # Cargar el empleado en el formulario
    data = {'form':form,
            'entrenador':entrenador
            }
    # renderizamos el template y los datos
    return render(request,'tiendaApp/entrenadorEditar.html',data) 

# Función que rescata los valores del formulario y los actualiza en la base de datos 
def editar_entrenador(request,entrenador_id):
    entrenador = get_object_or_404(Entrenador,id=entrenador_id)# rescatamos el id del modelo Empleado
    
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        # Pasamos el formulario a una instancia de empleado
        form = EntrenadorForm(request.POST,request.FILES,instance=entrenador) 
        # Verificamos que cumpla con las validaciones
        if form.is_valid():
            if 'foto' in request.FILES:
                entrenador.foto = request.FILES['foto']
            form.save() # Guardamos los cambios en el formulario
            return redirect("/entrenadores/") # Redireccionamos a la tabla con empleados
    else:
        form = EntrenadorForm(instance=entrenador) # cargamos los datos del empleado
    # Redireccionamos a la tabla si no llego por POST
    return render(request,"tiendaApp/entrenadores.html",{'form':form})

def eliminar_entrenador(request,entrenador_id):
    entrenador = get_object_or_404(Entrenador,id=entrenador_id)# rescatamos el id del modelo Empleado
    if request.method == 'POST': # verificamos si la solicitud llega por POST
        entrenador.delete()
        return redirect("/entrenadores/")
    
    return render(request, "tiendaApp/entrenadorDel.html",{"entrenador":entrenador})

def exportar_canchas_excel(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="canchas.xls"'

    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Canchas')

    # Estilos
    header_style = xlwt.XFStyle()
    header_style.font.bold = True

    # Encabezados de columnas
    headers = ['Nombre', 'Descripción', 'Tipo', 'Capacidad', 'Estado']
    for col_num, header in enumerate(headers):
        ws.write(0, col_num, header, header_style)

    # Datos
    canchas = Cancha.objects.all()
    for row_num, cancha in enumerate(canchas, start=1):
        ws.write(row_num, 0, cancha.nombre)
        ws.write(row_num, 1, cancha.descripcion)
        ws.write(row_num, 2, cancha.tipo)
        ws.write(row_num, 3, cancha.capacidad)
        ws.write(row_num, 4, cancha.estado)

    wb.save(response)
    return response