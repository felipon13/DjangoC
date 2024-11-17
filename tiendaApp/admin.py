from django.contrib import admin
from tiendaApp.models import Cargo,Departamento,Empleado,Cancha,Cliente,Reserva

# Register your models here.
class CargoAdmin(admin.ModelAdmin):
    list_display = ["id","nombre"]
    
class DepartamentoAdmin(admin.ModelAdmin):
    list_display = ["codigo","nombre"]
    
class EmpleadoAdmin(admin.ModelAdmin):
    list_display = ["run","nombre","paterno","cargo","departamento"]

class CanchaAdmin(admin.ModelAdmin):
    list_display = ["nombre","descripcion","tipo","capacidad","estado","creado"]

class ClienteAdmin(admin.ModelAdmin):
    list_display = ["run","nombre","paterno","materno"]

class ReservaAdmin(admin.ModelAdmin):
    list_display = ["cancha","horario","fecha"]
    
admin.site.register(Cargo,CargoAdmin)
admin.site.register(Departamento,DepartamentoAdmin)
admin.site.register(Empleado,EmpleadoAdmin)
admin.site.register(Cancha,CanchaAdmin)
admin.site.register(Cliente,ClienteAdmin)
admin.site.register(Reserva,ReservaAdmin)