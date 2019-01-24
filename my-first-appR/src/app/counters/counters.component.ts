import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-counters',
  templateUrl: './counters.component.html',
  styleUrls: ['./counters.component.css']
})
export class CountersComponent implements OnInit {
  public show: boolean = false;
  counterss = [];
  //counter = '';
  counte = "hola";


  constructor() { }

  ngOnInit() {
  }

  toggle() {
    this.show = !this.show;
    this.counterss.push(this.counterss.length + 1);

  }

  clickCounter() {
   // this.counte = "TimeStamp";
    

  }

}
