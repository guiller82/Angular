import { Component/*, EventEmitter, Output*/ } from '@angular/core';
import { LogginService } from '../logging.service';
import { AccountsService } from '../accounts.service';

@Component({
  selector: 'app-new-account',
  templateUrl: './new-account.component.html',
  styleUrls: ['./new-account.component.css'],
 // providers: [LogginService]
})
export class NewAccountComponent {
 // @Output() accountAdded = new EventEmitter<{name: string, status: string}>();

constructor (private logginService: LogginService,
              private accountsService: AccountsService      ) {

                this.accountsService.statusUpdated.subscribe(
                (status: string) => alert ('New Status ' + status)

                )
              }


  onCreateAccount(accountName: string, accountStatus: string) {

   this.accountsService.addAccount(accountName, accountStatus);
  // this.logginService.logStatusChange (accountStatus);


  }
}
