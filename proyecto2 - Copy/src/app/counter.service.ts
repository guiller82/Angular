export class ContadorService {

    contador = 0;


AumentarNumero () {
  this.contador ++;
  console.log('Contador: ' + this.contador);
  
  }


}