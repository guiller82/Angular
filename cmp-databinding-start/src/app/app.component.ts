import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  serverElements = [{type:'server', name:'Testserver', content:'Just a test!'}];
  
//ServerCreated es el evento 
//(serverCreated)="onServerAdded($event)"

  onServerAdded(serverData:{serverName:string, serverContent:string}) {
      this.serverElements.push({
        type: 'server',
        name: serverData.serverName,
        content: serverData.serverContent 
      });
    }
  
    onBlueprintAdded    (
      blueprintData:
      {
        serverName:string, 
        serverContent:string
      }
    )
    
    {
      this.serverElements.push({
        type: 'blueprint',
        name: blueprintData.serverName,
        content: blueprintData.serverContent
      });
    }

    OnChangeFirst(){
this.serverElements[2].name="hola";
    }

    OnDestryFirst(){
      this.serverElements.splice(0,1);
      //this.serverElements[2].name="hola";
          }

}
