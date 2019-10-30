# Kitchain ERP

Página: http://thekitchain.com

El ERP de restaurant más rápido y responsivo

Versión de Ruby: 2.6.3
Versión de Rails: 5.2.3

Para correr localmente se necesita:

- PostgreSQL instalado para base de datos (Con usuario creado)
- Ruby 2.6.3
- Gema Rails 5.2.3
- Gema Bundler
- Yarn instalado y configurado

Pasos luego de descargar:

- Correr Yarn install
- Correr bundler para instalación de gemas
- Correr rails db:migrate para generar tablas
- Correr rails db:seed para programa piloto
- Configurar AWS_SECRET_KEY, AWS_SECRET_KEY_ID y AWS_BUCKET como variables de entorno
- Disfrutar de tu nueva app

Docs:

Commerce:

Commerce es el modelo de usuario principal dentro de la aplicación, quién controla
todas las métricas de la aplicación.

Worker:

Dependiente de commerce, worker solamente puede ser creado bajo la autorización
de commerce y solamente para este.

Office: 

Oficinas o sucursales, creada bajo el modelo commerce, posee trabajadores, productos, mesas y ventas

Product:

Dependiente de office, posee stock, imagen, precio y nombre, necesario para sale.

Table:

Dependiente de office, posee descripción y tamaño, necesario para sale.

Sale:

Dependiente de worker, office y table, posee órdenes para el pedido de productos,
así como también total de productos, cantidad, campo de pago, campo de estado (1: Pedido solicitado; 2: Pedido Preparado; 3: Pedido Entregado,
4: Pedido Finalizado)

Order: 

Dependiente de sale y product, posee el detalle de los productos pedidos en sale, junto con su cantidad.



