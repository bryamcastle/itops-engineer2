Task 1
======

Crear un script bash o makefile, que acepte parámetros (CREATE, DESTROY y OUTPUT) con los siguientes pasos:
 
Exportar las variables necesarias para crear recursos en GCP (utilizar las credenciales previamente descargadas).
 
Utilizar terraform o pulumi para crear un Cluster de Kubernetes de un solo nodo (GKE).
 
Instalar ingress controller en el Cluster de k8s.
 
Crear una imagen docker para desplegar una aplicación tipo RESTFUL API, basada en python que responda a siguientes dos recursos:
 
/greetings: message —> “Hello World from $HOSTNAME”.
/square: message —>  number: X, square: Y, donde Y es el cuadrado de X. Se espera un response con el cuadrado.
Subir la imagen el registry propio del proyecto gcp ej: gcr.io/$MYPROJECT/mypythonapp.
 
Desplegar la imagen con los objetos mínimos necesarios (no utilizar pods ni replicasets directamente).
El servicio debe poder ser consumido públicamente.
 
NOTA: variabilizar todos los campos que lo ameritan, por ejemplo el PROJECT, para que el script pueda ser ejecutado por otra persona con otra cuenta GCP.
 
solucion:
---------
Se uso bash script para ejecutar docker y terraform.
Tenemos que descargar este repositorio en una maquina con las siquientes herramientas instaldas:

-- GCP account
-- linux machine
-- terraform 
-- google-cloud-sdk
-- docker
-- kubernetes

variables:

 - `terraform/key.json`: json file for google credentials
 - `terraform/variables.tf`: variables for terraform
 - `terraform/config.file`: vairables for bash

Exemplo:
--------

```
$ bash task1.sh create
```

Task2
=====
Crear un script bash o makefile, con los siguientes pasos:
 
Exportar las variables necesarias para crear recursos en GCP (utilizar las credenciales previamente descargadas).
 
Crear una VM basada en Centos
 
Instalar Jenkins en la VM (Puede ser Instalado con Docker o como Servicio, pero es importante que la instalación se realice a través de un playbook de ansible)
 
Instalar plugins estándar de pipeline,
 
Crear un sharedlib que pueda compilar maven.
 
Crear un Job que haga uso del sharedlib para compilar exitosamente un proyecto java simple tipo “Hello World”
 
El repositorio para la aplicación de Java debe ser publico.
 
 Solucion
 --------
se uso bash script para ejecucion de gcloud, used startup-script to install package and run ansible. En el mismo script se usa jenkins CLI para instalar plugins y crear el job para java. Tenemos que descargar este repositorio en una maquina con las siquientes herramientas instaldas:

-- GCP account
-- linux machine
-- google-cloud-sdk
-- git

variables:

 - `task2/config.file`: vairables for bash

Exemplo:
--------
```
$ bash task.sh
```

