import { Component, OnInit, Output, EventEmitter, ViewChild, ElementRef } from '@angular/core';


@Component({
  selector: 'app-cockpit',
  templateUrl: './cockpit.component.html',
  styleUrls: ['./cockpit.component.css']
})
export class CockpitComponent implements OnInit {
   @Output() serverCreated = new EventEmitter<{serverName:string, serverContent:string}>();
   @Output('bpCreated') blueprintCreated = new EventEmitter<{serverName:string, serverContent:string}>();
 /* newServerName = '';
  newServerContent = ''; */
  @ViewChild ('serverContentInput') serverContentInput:ElementRef;

  constructor() { }

  ngOnInit() {
  }

//ServerCreated es el evento APP-COMPONENT
//(serverCreated)="onServerAdded($event)"

  onAddServer(nameInput: HTMLInputElement) {
this.serverCreated.emit({
  //serverName:this.newServerName, 
  serverName:nameInput.value,
//serverContent:this.newServerContent
serverContent:this.serverContentInput.nativeElement.value
});
  }

  onAddBlueprint(nameInput: HTMLInputElement) {
    this.blueprintCreated.emit({
      serverName:nameInput.value,
      // serverName:this.newServerName, 
      //serverContent:this.newServerContent
      serverContent:this.serverContentInput.nativeElement.value
    });
  }

}
