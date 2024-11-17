from django import forms
from tiendaApp.choices import sexos
from tiendaApp.models import Cargo,Departamento,Empleado,Cancha,Cliente,Reserva,Entrenador
import datetime
from django.core.exceptions import ValidationError

class EmpleadoForm(forms.ModelForm):
    run = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese RUN'}))
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Nombre'}))
    paterno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Paterno'}))
    materno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Materno'}),required=False)
    codigoEmpleado = forms.CharField(widget=forms.NumberInput(attrs={'class':'form-control','placeholder':'ingrese Codigo de Empleado'}))
    sexo = forms.CharField(widget=forms.Select(choices=sexos,attrs={"class":"form-select"}))
    sueldo = forms.CharField(widget=forms.NumberInput(attrs={'class':'form-control','placeholder':'ingrese sueldo'}))
    fechaNac = forms.DateField(widget=forms.DateInput(attrs={"class":"form-control","placeholder":"dd/mm/aaaa","type":"date"}))
    
    cargo = forms.ModelChoiceField(
        queryset = Cargo.objects.all(),
        empty_label = "Seleccione cargo",
        widget=forms.Select(attrs={"class":"form-select"})
    )
    
    departamento = forms.ModelChoiceField(
        queryset = Departamento.objects.all(),
        empty_label = "Seleccione Departamento",
        widget = forms.Select(attrs={"class":"form-select"})
    )
    
    # Validaciones
    def clean_sueldo(self):
        # rescatamos el valor del sueldo del formulario
        sueldo = self.cleaned_data["sueldo"]
        try:
            # intentar realizar las rutinas de este bloque
            sueldo = int(sueldo)
        except ValueError: 
            raise forms.ValidationError("El sueldo debe ser un valor entero.")
        
        if sueldo <= 0:
            raise forms.ValidationError("El sueldo debe ser un número mayor a 0.")
        
        return sueldo
    
    def  clean_fechaNac(self):
        # rescatamos la fecha del formulario
        fecha_nac = self.cleaned_data.get("fechaNac")
        
        # Definimos los rangos mínimo y máximo para las fechas
        fecha_minima = datetime.date(1960,1,1)
        fecha_maxima = datetime.date(2086,12,31)
        
        if fecha_nac:
            if fecha_nac < fecha_minima or fecha_nac > fecha_maxima:
                raise forms.ValidationError("La fecha de nacimiento debe estar entre 2004 y 2086")
        
        return fecha_nac
    
    def clean_nombre(self):
        nombre = self.cleaned_data.get("nombre")
        if nombre and not nombre.isalpha() and ' ' not in nombre:
            raise forms.ValidationError("El nombre solo puede contener letras y espacios")
        
        return nombre
    
    
    class Meta:
        model = Empleado
        fields = '__all__'

class CanchaForm(forms.ModelForm):
    nombre = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Nombre de la Cancha'})
    )
    descripcion = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Descripción'})
    )

    tipo = forms.CharField(
        #empty_label= "Seleccione el tipo de cancha",
        widget=forms.Select(choices=[('futbol', 'Fútbol'), ('paddle', 'Paddle'), ('tenis', 'Tenis')],
                            attrs={"class": "form-select"}))
    
    capacidad = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Capacidad'})
    )

    class Meta:
        model= Cancha
        fields = '__all__'

class ClienteForm(forms.ModelForm):
    run = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese RUN'}))
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Nombre'}))
    paterno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Paterno'}))
    materno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Materno'}))
    sexo = forms.CharField(widget=forms.Select(choices=sexos,attrs={"class":"form-select"}))
    fechaNac = forms.DateField(widget=forms.DateInput(attrs={"class":"form-control","placeholder":"dd/mm/aaaa","type":"date"}))

    class Meta:
        model = Cliente
        fields = '__all__'

class CanchaForm(forms.ModelForm):
    nombre = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Nombre de la Cancha'})
    )
    descripcion = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Descripción'})
    )

    tipo = forms.CharField(
        #empty_label= "Seleccione el tipo de cancha",
        widget=forms.Select(choices=[('futbol', 'Fútbol'), ('paddle', 'Paddle'), ('tenis', 'Tenis')],
                            attrs={"class": "form-select"}))
    
    capacidad = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Capacidad'})
    )

    estado = forms.CharField(
        widget=forms.Select(
            choices=[('Disponible', 'Disponible'), ('mantenimiento', 'En mantenimiento')],
            attrs={"class": "form-select"}
        ),
        initial='Disponible'
    )

    class Meta:
        model= Cancha
        fields = ['nombre', 'descripcion', 'tipo', 'capacidad', 'estado']

    def clean_nombre(self):
        nombre = self.cleaned_data.get('nombre')
        if len(nombre) < 3:
            raise ValidationError("El nombre debe tener al menos 3 caracteres.")
        return nombre

    # Validación personalizada para el campo `capacidad`
    def clean_capacidad(self):
        capacidad = self.cleaned_data.get('capacidad')
        if capacidad <= 0:
            raise ValidationError("La capacidad debe ser un número positivo.")
        return capacidad

    # Validación general del formulario
    def clean(self):
        cleaned_data = super().clean()
        estado = cleaned_data.get('estado')
        
        # Asegura que `estado` siempre sea 'Disponible'
        if estado != 'Disponible':
            self.add_error('estado', "El estado debe ser 'Disponible' por defecto.")
        
        return cleaned_data
    
class EditarCanchaForm(forms.ModelForm):

    nombre = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Nombre de la Cancha'})
    )
    descripcion = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Descripción'})
    )

    tipo = forms.CharField(
        #empty_label= "Seleccione el tipo de cancha",
        widget=forms.Select(choices=[('futbol', 'Fútbol'), ('paddle', 'Paddle'), ('tenis', 'Tenis')],
                            attrs={"class": "form-select"}))
    
    capacidad = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese Capacidad'})
    )
    estado = forms.CharField(
        widget=forms.Select(
            choices=[('Disponible', 'Disponible'),('mantenimiento','En mantenimiento')],
            attrs={"class": "form-select"}
        ),
        initial='Disponible'
    )

    class Meta:

        model = Cancha
        fields = ['nombre', 'descripcion', 'tipo', 'capacidad', 'estado']

class ReservaForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super().clean()
        cancha = cleaned_data.get("cancha")
        horario = cleaned_data.get("horario")
        fecha = cleaned_data.get("fecha")

        # Validar que la cancha esté disponible
        if cancha and horario and fecha:
            reservas_existentes = Reserva.objects.filter(
                cancha=cancha, horario=horario, fecha=fecha, estado='confirmada'
            )
            if reservas_existentes.exists():
                raise forms.ValidationError("La cancha ya está reservada para ese horario.")
        return cleaned_data
    class Meta:
        model = Reserva
        fields = ['cliente', 'cancha', 'horario', 'fecha', 'observaciones']
        widgets = {
            'fecha': forms.DateInput(attrs={'type': 'date'}),
        }

class EntrenadorForm(forms.ModelForm):
    run = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese RUN'}))
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Nombre'}))
    paterno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Paterno'}))
    materno = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese Apellido Materno'}))
    especialidad = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'ingrese deporte especializado'}))
    sexo = forms.CharField(widget=forms.Select(choices=sexos,attrs={"class":"form-select"}))
    fechaNac = forms.DateField(widget=forms.DateInput(attrs={"class":"form-control","placeholder":"dd/mm/aaaa","type":"date"}))

    class Meta:
        model = Entrenador
        fields = '__all__'