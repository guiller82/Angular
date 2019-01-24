import { Component, OnInit } from '@angular/core';
//import { setTimeout } from '@angular/timers';

@Component({
  selector: 'app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
}

)
export class ServersComponent implements OnInit {
  allowNewServer = false;
  serverCreationStatus = "No server has created";
  serverName = 'Testserver';
  userName = '';
  EmptyScreen = true;
  serverCreated = false;
  servers = ['Testserver', 'Testserver 2'];
 
  //public buttonName: any = 'Show';


  constructor() {

    setTimeout(() => {
      this.allowNewServer = true;
    }, 500);



  }

  ngOnInit() {

  }


  onCreateServer() {
    this.serverCreated = true;
    this.servers.push(this.serverName);
    this.serverCreationStatus = "Server Was Created " + this.serverName;
  }

  onUpdateServerName(event: Event) {
    //console.log(event);
    this.serverName = (<HTMLInputElement>event.target).value;

  }




  notEmptyString() {
        
    if (this.userName != '') {
     // console.log("hola");
      this.EmptyScreen = false;

    }
    return this.EmptyScreen;
  }

}
