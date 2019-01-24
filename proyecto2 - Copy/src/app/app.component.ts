import { Component } from '@angular/core';

import {UsersService} from './users.service';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [UsersService]
})


export class AppComponent {
/*
 activeUsers: string [] ;
  inactiveUsers: string [] ;
  constructor (private usersService: UsersService) {}

*/


}
