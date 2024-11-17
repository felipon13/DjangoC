from django.db import models
from django.forms import ValidationError
from django.utils import timezone
from tiendaApp.choices import sexos
import os
 
# Create your models here.
class Cargo(models.Model):
    nombre = models.CharField(max_length=50,verbose_name='Nombre del Cargo')
    creado = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return f"{self.nombre}"
    
    class Meta:
        db_table = 'cargo'
        verbose_name = 'Cargo'
        verbose_name_plural = 'Cargos'

class Departamento(models.Model):
    codigo = models.BigAutoField(primary_key=True)
    nombre = models.CharField(max_length=50,verbose_name='Nombre del Departamento')
    creado = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return f"{self.nombre}"
    
    class Meta:
        db_table = 'departamento'
        verbose_name = 'Departamento'
        verbose_name_plural = 'Departamentos'

class Empleado(models.Model):
    run = models.CharField(max_length=10,verbose_name="RUN")
    nombre = models.CharField(max_length=50,verbose_name="Nombre")
    paterno = models.CharField(max_length=50,verbose_name="Apellido Paterno")
    materno = models.CharField(max_length=50,verbose_name="Apellido Materno",blank=True)
    sexo = models.CharField(max_length=1,choices=sexos,default='o')
    codigoEmpleado = models.CharField(max_length=20,verbose_name="Código de Empleado")
    sueldo = models.PositiveIntegerField(default=500000,verbose_name="Sueldo Base")
    fechaNac = models.DateField(blank=True,null=True,verbose_name="Fecha de Nacimiento")
    cargo = models.ForeignKey(Cargo,null=False,on_delete=models.RESTRICT)
    departamento = models.ForeignKey(Departamento,null=False,on_delete=models.CASCADE)
    creado = models.DateTimeField(default=timezone.now,editable=False)
    
    def generar_nombre(instance,filename):  #fotito.png
        extension = os.path.splitext(filename)[1][1:]
        ruta = 'empleados'
        fecha = timezone.now().strftime("%d%m%Y_%H%M%S") #29102024_182030.png
        nombre = f"{fecha}.{extension}"
        return os.path.join(ruta,nombre)
    
    foto = models.ImageField(upload_to=generar_nombre,null=True,blank=True,default='empleados/empledo.png')
        
    
    
    def __str__(self):
        return f"{self.nombre} {self.paterno} {self.materno}"
    
    class Meta:
        db_table = "empleado"
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"
        ordering = ["nombre","paterno","materno"]

class Cancha(models.Model):
    TIPO_CHOICES = [
        ('futbol', 'Fútbol'),
        ('tenis', 'Tenis'),
        ('paddle', 'Paddle'),
        # Agrega más tipos si es necesario
    ]
    ESTADOS = [
        ('Disponible', 'Disponible'),
        ('mantenimiento', 'En Mantenimiento'),
        ('ocupada', 'No disponible')
    ]
    nombre = models.CharField(max_length=100,verbose_name='Nombre')
    descripcion= models.CharField(max_length=100,verbose_name='Descripcion')
    tipo = models.CharField(max_length=50,verbose_name='Tipo de cancha',choices=TIPO_CHOICES) 
    capacidad = models.IntegerField()
    estado = models.CharField(max_length=20, choices=ESTADOS, default='Disponible')
    creado = models.DateTimeField(default=timezone.now)

    def generar_cancha(instance,filename):
        extension= os.path.split(filename)[1][1:]
        ruta = 'canchas'
        fecha = timezone.now().strftime("%d%m%Y_%H%M%S") #29102024_182030.png
        nombre = f"{fecha}.{extension}"
        return os.path.join(ruta,nombre)
    
    foto = models.ImageField(upload_to=generar_cancha,null=True,blank=True,default='cancha/todoCancha.jpg')


    def __str__(self):
        return f"{self.nombre} {self.tipo}"

    class Meta:
        db_table = 'cancha'
        verbose_name = 'Cancha'
        verbose_name_plural = 'Canchas'
    
class Cliente(models.Model):
    run = models.CharField(max_length=10,verbose_name="RUN")
    nombre = models.CharField(max_length=50,verbose_name="Nombre")
    paterno = models.CharField(max_length=50,verbose_name="Apellido Paterno")
    materno = models.CharField(max_length=50,verbose_name="Apellido Materno",blank=True)
    sexo = models.CharField(max_length=1,choices=sexos,default='o')
    fechaNac = models.DateField(blank=True,null=True,verbose_name="Fecha de Nacimiento")
    creado = models.DateTimeField(default=timezone.now,editable=False)
    
    def generar_nombre(instance,filename):  #fotito.png
        extension = os.path.splitext(filename)[1][1:]
        ruta = 'clientes'
        fecha = timezone.now().strftime("%d%m%Y_%H%M%S") #29102024_182030.png
        nombre = f"{fecha}.{extension}"
        return os.path.join(ruta,nombre)
    
    foto = models.ImageField(upload_to=generar_nombre,null=True,blank=True,default='empleados/empledo.png')
        
    
    
    def __str__(self):
        return f"{self.nombre} {self.paterno} {self.materno}"
    
    class Meta:
        db_table = "cliente"
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"
        ordering = ["nombre","paterno","materno"]

class Horario(models.Model):
    hora_inicio = models.TimeField(verbose_name='Hora de inicio')
    hora_fin = models.TimeField(verbose_name='Hora de fin')
    precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio por hora')

    def __str__(self):
        return f"{self.hora_inicio.strftime('%H:%M')} - {self.hora_fin.strftime('%H:%M')}"
    
    def clean(self):
        if self.hora_inicio >= self.hora_fin:
            raise ValidationError("La hora de inicio debe ser menor a la hora de fin")

    class Meta:
        db_table = 'horario'
        verbose_name = 'Horario'
        verbose_name_plural = 'Horarios'

class Reserva(models.Model):
    ESTADO_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('confirmada', 'Confirmada'),
        ('cancelada', 'Cancelada'),
    ]

    cliente = models.ForeignKey('Cliente', on_delete=models.CASCADE, verbose_name='Cliente')
    cancha = models.ForeignKey('Cancha', on_delete=models.CASCADE, verbose_name='Cancha')
    horario = models.ForeignKey(Horario, on_delete=models.CASCADE, verbose_name='Horario')
    fecha = models.DateField(verbose_name='Fecha de reserva')
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES, default='pendiente')
    observaciones = models.TextField(blank=True, null=True)
    creado = models.DateTimeField(default=timezone.now, editable=False)

    def __str__(self):
        return f"Reserva: {self.cliente} - {self.cancha} - {self.fecha} {self.horario}"

    def clean(self):
        if self.fecha < timezone.now().date():
            raise ValidationError("No se pueden hacer reservas en fechas pasadas")
        
        if self.cancha.estado != 'Disponible':
            raise ValidationError(f"La cancha no está disponible. Estado actual: {self.cancha.estado}")
        
        reservas_existentes = Reserva.objects.filter(
            cancha=self.cancha,
            horario=self.horario,
            fecha=self.fecha,
            estado='confirmada'
        ).exclude(pk=self.pk)
        
        if reservas_existentes.exists():
            raise ValidationError("Ya existe una reserva confirmada para este horario")
        
    def save(self, *args, **kwargs):
        if self.estado == 'confirmada':
            self.cancha.estado = 'ocupada'
            self.cancha.save()
        elif self.estado == 'cancelada' and self.cancha.estado == 'ocupada':
            # Verificar si esta es la única reserva que hace que esté ocupada
            otras_reservas = Reserva.objects.filter(
                cancha=self.cancha,
                fecha=self.fecha,
                horario=self.horario,
                estado='confirmada'
            ).exclude(pk=self.pk)
            if not otras_reservas.exists():
                self.cancha.estado = 'Disponible'
                self.cancha.save()
        super().save(*args, **kwargs)
    
    class Meta:
        db_table = 'reserva'
        verbose_name = 'Reserva'
        verbose_name_plural = 'Reservas'
        unique_together = ['cancha', 'horario', 'fecha']
        ordering = ['-fecha', '-horario__hora_inicio']

class Entrenador(models.Model):
    run = models.CharField(max_length=10,verbose_name="RUN")
    nombre = models.CharField(max_length=50,verbose_name="Nombre")
    paterno = models.CharField(max_length=50,verbose_name="Apellido Paterno")
    materno = models.CharField(max_length=50,verbose_name="Apellido Materno",blank=True)
    especialidad = models.CharField(max_length=50,verbose_name="deporte especializado")
    sexo = models.CharField(max_length=1,choices=sexos,default='o')
    fechaNac = models.DateField(blank=True,null=True,verbose_name="Fecha de Nacimiento")
    creado = models.DateTimeField(default=timezone.now,editable=False)
    
    def generar_nombre(instance,filename):  #fotito.png
        extension = os.path.splitext(filename)[1][1:]
        ruta = 'entrenadores'
        fecha = timezone.now().strftime("%d%m%Y_%H%M%S") #29102024_182030.png
        nombre = f"{fecha}.{extension}"
        return os.path.join(ruta,nombre)
    
    foto = models.ImageField(upload_to=generar_nombre,null=True,blank=True,default='empleados/empledo.png')
        
    
    
    def __str__(self):
        return f"{self.nombre} {self.paterno} {self.materno}"
    
    class Meta:
        db_table = "entrenador"
        verbose_name = "Entrenador"
        verbose_name_plural = "Entrenadores"
        ordering = ["nombre","paterno","materno","especialidad"]
