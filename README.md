
## Swappiness_sh

La configuración del `vm.swappiness` controla la tendencia del kernel linux a preferir usar la swap (espacio en disco) en lugar de la RAM cuando necesita más memoria. 

- Un valor cercano a 0 le indica al kernel que trate de evitar el uso del swap tanto como sea posible y que mantenga la mayor cantidad de datos en la memoria RAM.
- Un valor cercano a 100 le indica al kernel que intercambie activamente la memoria RAM por la partición de swap, incluso cuando hay suficiente memoria RAM disponible.
- El valor generalmente es 60 en la mayoria de las distribuciones...

### Dependencias

- [Dialog](https://invisible-island.net/dialog/dialog.html#documentation)
