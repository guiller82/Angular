import { Component, OnInit, Output, EventEmitter  } from '@angular/core';

@Component({
  selector: 'app-game-control',
  templateUrl: './game-control.component.html',
  styleUrls: ['./game-control.component.css']
})
export class GameControlComponent implements OnInit {
  @Output() intervalFired = new EventEmitter<number>();
  interval;
  lastNumber=0;
 // @Output() gameStarted: EventEmitter<string> = new EventEmitter<string>();



  constructor() { }

  ngOnInit() {
  }


onStarGame() {
  //numero: number;
  //var numero:number  = 0;

  this.interval= setInterval(() => {
    
  //lastNumber=0;
  this.intervalFired.emit(this.lastNumber+1);
  this.lastNumber ++;
  }, 1000);

  
    //this.interval = 
    //this.gameStarted.emit(numero);


}



}



