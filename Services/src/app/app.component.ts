import { Component } from '@angular/core';
import { AccountsService } from './accounts.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
 // providers: [AccountsService]
})
export class AppComponent {

  accounts: {name:string, status:string} []=[];

  constructor (private accountsService: AccountsService){}
  
/*
  onAccountAdded(newAccount: {name: string, status: string}) {
    this.accounts.push(newAccount);
  }

  onStatusChanged(updateInfo: {id: number, newStatus: string}) {
    this.accounts[updateInfo.id].status = updateInfo.newStatus;
  } */

        ngOnInit (){
          this.accounts=this.accountsService.accounts;
        }

}
