import { Component,    Output, EventEmitter  } from '@angular/core';


@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})


export class HeaderComponent {
  @Output() menuItemSelected = new EventEmitter<string>();
  //selectedOption: string;


onMenuSelection (selection:string) {
  
  this.menuItemSelected.emit(selection);
  



}


}