import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
oddNUmbers:number [] = [];
evenNumbers:number [] = [];


 // @Output() NUmberFired = new EventEmitter<number>();
  interval;
 // title = 'proyecto1';

// ArrayDeNumeros = [];
numeroEvento:number;
enviaraODD:string = "Hola Soy Osito";

 onGameDtarted (numroINcrementado:number)
 {
  this.numeroEvento = numroINcrementado;
 
  if (numroINcrementado % 2 === 0) {
this.evenNumbers.push(numroINcrementado);
}
else
{
  this.oddNUmbers.push(numroINcrementado);
}

  }
 
  // console.log(this.numeroEvento);
   //return this.numeroEvento;

 }


/*
 
onNUmberFired(){
 

 this.NUmberFired.emit(this.numeroEvento);


} */




